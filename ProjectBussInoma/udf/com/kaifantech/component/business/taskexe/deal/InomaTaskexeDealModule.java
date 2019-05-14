package com.kaifantech.component.business.taskexe.deal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.business.taskexe.ITaskexeDealer;
import com.kaifantech.component.business.taskexe.ITaskexeModule;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.taskexe.oper.ITaskexeAddService;
import com.kaifantech.init.sys.params.SystemLock;
import com.kaifantech.init.sys.params.SystemParameters;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.InomaSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.seq.ThreadID;
import com.kaifantech.util.thread.ThreadTool;
import com.ytgrading.util.AppTool;

/***
 * 描述任务从用户下达到发送AGV执行前的逻辑
 ***/
@Service(InomaSystemQualifier.TASKEXE_MODULE)
public class InomaTaskexeDealModule implements ITaskexeModule {

	@Autowired
	private ITaskexeDealer taskexeDealer;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_CLIENT_WORKER)
	private IConnectWorker agvClientMgr;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_TASKEXE_ADD_SERVICE)
	private ITaskexeAddService taskexeAddService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	private Map<Integer, Boolean> isRunning = new HashMap<>();

	public void startControl() {
		for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
			startControl(agvBean.getId());
		}
	}

	private void startControl(Integer agvId) {
		Boolean flag = isRunning.get(agvId);
		if (AppTool.isNull(flag) || !flag) {
			ThreadTool.run(() -> {
				Thread.currentThread().setName("任务处理定时器(AGV:" + agvId + ")" + "衍生进程" + ThreadID.number++);
				isRunning.put(agvId, true);
				while (true) {
					try {
						ThreadTool.sleepOneSecond();
						doDeal(agvId);
					} catch (Exception e) {
						System.err.println(agvId + "号AGV解析任务时发生错误：" + e.getMessage());
						continue;
					}
				}
			});
		}
	}

	public void doDeal(Integer agvId) throws Exception {
		TaskexeBean taskexeBean = taskexeInfoService.getNextOne(agvId);
		if (taskexeBean == null) {
			return;
		}
		deal(taskexeBean);
	}

	private void deal(TaskexeBean taskexeBean) throws Exception {
		synchronized (SystemLock.charge(taskexeBean.getAgvId())) {
			if (AgvTaskType.match(taskexeBean.getTasktype())) {
				boolean isShutdown = SystemParameters.isShutdown(taskexeBean);
				if (!isShutdown) {
					taskexeDealer.dealTaskexe(taskexeBean);
				} else {
					taskexeAddService.cancel(taskexeBean, SystemParameters.isShutdownThenToInit());
				}
				return;
			}
			System.out.println("无法识别当前任务类型！");
		}
	}
}
