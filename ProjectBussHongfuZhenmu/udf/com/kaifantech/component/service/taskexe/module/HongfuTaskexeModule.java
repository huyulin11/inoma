package com.kaifantech.component.service.taskexe.module;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.taskexe.add.ITaskexeAddService;
import com.kaifantech.component.service.taskexe.ctrl.IHongfuCtrlModule;
import com.kaifantech.component.service.taskexe.dealer.IHongfuTaskexeDealer;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.taskexe.module.ITaskexeModule;
import com.kaifantech.init.sys.params.SystemLock;
import com.kaifantech.init.sys.params.SystemParameters;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.log.AppFileLogger;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;
import com.kaifantech.util.seq.ThreadID;
import com.kaifantech.util.thread.ThreadTool;

/***
 * 描述任务从用户下达到发送AGV执行前的逻辑
 ***/
@Service(HongfuSystemQualifier.TASKEXE_MODULE)
public class HongfuTaskexeModule implements ITaskexeModule {

	@Autowired
	private IHongfuTaskexeDealer taskexeDealer;

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

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_CTRL_MODULE)
	private IHongfuCtrlModule ctrlModule;

	private Map<Integer, Boolean> isRunning = new HashMap<>();

	public void startControl(IotClientBean agvBean) {
		Boolean flag = isRunning.get(agvBean.getId());
		if (AppTool.isNull(flag) || !flag) {
			ThreadTool.run(() -> {
				Thread.currentThread().setName("任务处理定时器(AGV:" + agvBean.getId() + ")" + "衍生进程" + ThreadID.number++);
				isRunning.put(agvBean.getId(), true);
				while (true) {
					ThreadTool.sleepOneSecond();
					doDeal(agvBean);
				}
			});
		}
	}

	public void doDeal(IotClientBean agvBean) {
		AppFileLogger.warning("MODULE:DODEAL1:" + agvBean.getId() + Thread.currentThread().getName());
		TaskexeBean taskexeBean = taskexeInfoService.getNextOne(agvBean.getId());
		if (taskexeBean == null) {
			return;
		}
		AppFileLogger.warning("MODULE:DODEAL2:" + agvBean.getId() + Thread.currentThread().getName());
		HongfuAgvMsgBean agvMsg = HongfuAgvMsgGetter.getBean(agvBean.getId());
		if (AppTool.isNull(agvMsg)) {
			return;
		}
		AppFileLogger.warning("MODULE:DODEAL3:" + agvBean.getId() + Thread.currentThread().getName());
		try {
			deal(taskexeBean, agvMsg);
		} catch (Exception e) {
			AppFileLogger.warning(agvBean.getId() + "号AGV解析任务时发生错误：" + e.getMessage());
		}
		try {
			ctrlModule.control(agvBean, agvMsg);
		} catch (Exception e) {
			AppFileLogger.warning(agvBean.getId() + "号AGV综合控制时发生错误：" + e.getMessage());
		}
	}

	private void deal(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsg) throws Exception {
		AppFileLogger.warning("MODULE:DEAL:" + taskexeBean.getAgvId());
		synchronized (SystemLock.charge(taskexeBean.getAgvId())) {
			if (AgvTaskType.match(taskexeBean.getTasktype())) {
				boolean isShutdown = SystemParameters.isShutdown(taskexeBean);
				if (!isShutdown) {
					taskexeDealer.deal(taskexeBean, agvMsg);
				} else {
					taskexeAddService.cancel(taskexeBean, SystemParameters.isShutdownThenToInit());
				}
				return;
			}
			AppFileLogger.warning("无法识别当前任务类型！" + taskexeBean.getTaskKey());
		}
	}
}
