package com.kaifantech.component.service.taskexe.deal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.taskexe.add.ITaskexeAddService;
import com.kaifantech.component.service.taskexe.dealer.ITaskexeDealer;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.taskexe.module.ITaskexeModule;
import com.kaifantech.init.sys.params.SystemLock;
import com.kaifantech.init.sys.params.SystemParameters;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.seq.ThreadID;
import com.kaifantech.util.thread.ThreadTool;

/***
 * 描述任务从用户下达到发送AGV执行前的逻辑
 ***/
@Service(HongfuSystemQualifier.TASKEXE_MODULE)
public class HongfuTaskexeModule implements ITaskexeModule {

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

	public void startControl(IotClientBean agvBean) {
		Boolean flag = isRunning.get(agvBean.getId());
		if (AppTool.isNull(flag) || !flag) {
			ThreadTool.run(() -> {
				Thread.currentThread().setName("任务处理定时器(AGV:" + agvBean.getId() + ")" + "衍生进程" + ThreadID.number++);
				isRunning.put(agvBean.getId(), true);
				while (true) {
					try {
						ThreadTool.sleepOneSecond();
						doDeal(agvBean.getId());
					} catch (Exception e) {
						System.err.println(agvBean.getId() + "号AGV解析任务时发生错误：" + e.getMessage());
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
