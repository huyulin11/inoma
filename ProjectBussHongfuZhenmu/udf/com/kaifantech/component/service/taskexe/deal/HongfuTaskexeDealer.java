package com.kaifantech.component.service.taskexe.deal;

import java.util.List;
import java.util.concurrent.ExecutorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.info.agv.AgvInfoBean;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.cache.manager.AppCache;
import com.kaifantech.component.comm.manager.agv.HongfuAgvManager;
import com.kaifantech.component.dao.agv.info.AgvOpChargeDao;
import com.kaifantech.component.dao.agv.info.AgvOpWmsDao;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.alloc.info.IAllocInfoService;
import com.kaifantech.component.service.alloc.status.IAllocStatusService;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.dealer.IHongfuTaskexeDealer;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.taskexe.watch.HongfuTaskexeWatchDealer;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.log.AppFileLogger;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;
import com.kaifantech.util.thread.ThreadTool;

@Service
public class HongfuTaskexeDealer implements IHongfuTaskexeDealer {
	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	@Autowired
	protected TaskexeOpDao taskexeTaskDao;

	@Autowired
	protected HongfuTaskexeWatchDealer taskexeWatchDealer;

	@Autowired
	protected HongfuAgvManager agvManager;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	private IAllocStatusService allocService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_ALLOC_INFO_SERVICE)
	private IAllocInfoService allocInfoService;

	@Autowired
	private AgvOpChargeDao agvOpChargeDao;

	@Autowired
	private AgvOpWmsDao agvOpWmsDao;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	private static ExecutorService pool = ThreadTool.getThreadPool(2);

	public synchronized void deal(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsg) throws Exception {
		Integer agvId = taskexeBean.getAgvId();
		List<TaskexeDetailBean> taskexeDetailList = taskexeDetailService.getList(taskexeBean);
		pool.execute(() -> {
			try {
				taskexeWatchDealer.watchSingleSite(taskexeBean, agvMsg, taskexeDetailList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		if (TaskexeOpFlag.NEW.equals(taskexeBean.getOpflag())) {
			AgvInfoBean agvBean = agvOpWmsDao.get(agvId);
			if (AppTool.equals(agvBean.getTaskstatus(), AgvTaskType.GOTO_CHARGE, AgvTaskType.BACK_CHARGE)
					&& AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.SHIPMENT, AgvTaskType.RECEIPT)) {
				AppFileLogger.setWarningTips(agvId, "目标AGV正在充电，任务无法下达！", taskexeBean.getTaskKey());
				return;
			}

			Integer exeingAgv = agvObstacle(taskexeBean);
			if (!AppTool.isNull(exeingAgv)) {
				return;
			}
			startWork(taskexeBean);
			return;
		}
		if (TaskexeOpFlag.SEND.equals(taskexeBean.getOpflag())) {
			watchWork(taskexeBean);
			return;
		}
	}

	private Integer agvObstacle(TaskexeBean targetTaskexeBean) {
		Integer targetAgvId = targetTaskexeBean.getAgvId();
		for (IotClientBean otherAgvBean : iotClientService.getAgvCacheList()) {
			Integer otherAgvId = otherAgvBean.getId();
			if (otherAgvId.equals(targetAgvId)) {
				continue;
			}
			TaskexeBean otherTaskexeBean = taskexeInfoService.getNextOne(otherAgvId);
			if (otherTaskexeBean == null) {
				continue;
			}
			if (TaskexeOpFlag.NEW.equals(otherTaskexeBean.getOpflag())) {
				if (targetTaskexeBean.getUpdatetime().getTime() > otherTaskexeBean.getUpdatetime().getTime()) {
					AppFileLogger.setPiTips(0, "更早任务尚未下达,当前：", targetTaskexeBean, ",根据", otherTaskexeBean, "判断");
					return otherTaskexeBean.getAgvId();
				}
				continue;
			}
			String otherCurrentArea = AppCache.worker().get("AREA_CURRENT", otherAgvId);
			String otherNextAreaWork = AppCache.worker().get("AREA_NEXT_ALLOC", otherAgvId);
			String targetNextAreaWork = AppCache.worker().get("AREA_NEXT_ALLOC", targetAgvId);
			if (AppTool.equals(otherCurrentArea, "D")) {
				AppFileLogger.setPiTips(0, otherCurrentArea, "区有AGV", otherAgvId, ",", targetTaskexeBean, "阻塞");
				return otherAgvId;
			}
			if (AppTool.equals(otherCurrentArea, "C", "B", "A")) {
				if ("A".equals(otherCurrentArea) && !"C".equals(targetNextAreaWork)) {
					AppFileLogger.setPiTips(0, otherCurrentArea, "区有AGV", otherAgvId, ",", targetTaskexeBean, "阻塞");
					return otherAgvId;
				}
				if (AppTool.equals(otherNextAreaWork, "A") && AppTool.equals(targetNextAreaWork, "C")) {
				} else {
					AppFileLogger.setPiTips(0, otherCurrentArea, "区有AGV", otherAgvId, ",", targetTaskexeBean, "阻塞");
					return otherAgvId;
				}
			}

			if (AgvTaskType.RECEIPT.equals(targetTaskexeBean.getTasktype())) {
			} else if (AgvTaskType.SHIPMENT.equals(targetTaskexeBean.getTasktype())) {
				if (!AppTool.equals(otherCurrentArea, "E")) {
					AppFileLogger.setPiTips(0, "放货任务：A(或B/C/D)区有AGV", otherAgvId, ",", targetTaskexeBean.getTaskKey(),
							"阻塞");
					return otherAgvId;
				}
			}
		}
		return null;
	}

	private void startWork(TaskexeBean taskexeBean) {
		ThreadTool.sleep(1000);
		Integer agvId = taskexeBean.getAgvId();
		SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
		AppFileLogger.setWarningTips(agvId, "开始任务！", taskexeBean.getTaskKey(), ",任务名：", singletaskBean.getTasktext());
		AppMsg msg = agvManager.doTask(agvId, singletaskBean.getTaskname());
		if (!msg.isSuccess()) {
			return;
		}
		if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.RECEIPT, AgvTaskType.SHIPMENT)) {
			agvOpWmsDao.command(agvId, taskexeBean.getTasktype());
			agvOpWmsDao.goWork(agvId, taskexeBean.getTasktype(), taskexeBean.getTaskexesid());
		}
		taskexeTaskDao.sendATask(taskexeBean);
		AppFileLogger.setWarningTips(agvId, agvId, "号AGV执行的", taskexeBean.getTaskexesid(), "-",
				taskexeBean.getTasksequence(), ",任务名：", singletaskBean.getTasktext(), "发送成功，更新任务状态为SEND！");
		agvOpChargeDao.updateRemark(agvId, "" + singletaskBean.getTasktext() + "任务已发送");
	}

	private void watchWork(TaskexeBean taskexeBean) {
		Integer agvId = taskexeBean.getAgvId();
		HongfuAgvMsgBean agvMsg = HongfuAgvMsgGetter.getFreshBean(agvId);
		if (!AppTool.isNull(agvMsg) && agvMsg.isTaskfinished()) {
			if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.RECEIPT, AgvTaskType.SHIPMENT)) {
				AllocItemInfoBean allocItem = allocInfoService.getByTaskid(taskexeBean.getJsonItem("taskid"));
				AppMsg msg = allocService.end(allocItem, taskexeBean.getTasktype());
				if (!msg.isSuccess()) {
					return;
				}
				agvOpWmsDao.workOver(agvId, taskexeBean.getTasktype());
			} else if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.GOTO_CHARGE, AgvTaskType.BACK_CHARGE)) {
				if (AgvTaskType.GOTO_CHARGE.equals(taskexeBean.getTasktype())) {
					agvOpChargeDao.workOverGotoCharge(agvId);
				} else if (AgvTaskType.BACK_CHARGE.equals(taskexeBean.getTasktype())) {
					agvOpChargeDao.workOverBackCharge(agvId);
				}
			}
			SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
			taskexeTaskDao.overASendTask(taskexeBean);
			AppCache.worker().hset("AREA_CURRENT", agvId, "O");
			AppCache.worker().hset("AREA_NEXT", agvId, "O");
			AppCache.worker().hset("AREA_NEXT_ALLOC", agvId, "O");
			AppFileLogger.setWarningTips(agvId, agvId, "号AGV执行的", taskexeBean.getTaskexesid(), "-",
					taskexeBean.getTasksequence(), ",任务名：", singletaskBean.getTasktext(),
					"任务所有明细任务均已执行完毕，更新任务状态为OVER！");
			agvOpChargeDao.updateRemark(agvId, "" + singletaskBean.getTasktext() + "任务已结束");
		}
	}
}
