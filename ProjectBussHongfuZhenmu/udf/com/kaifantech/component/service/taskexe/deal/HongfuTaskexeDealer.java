package com.kaifantech.component.service.taskexe.deal;

import java.util.List;
import java.util.concurrent.ExecutorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
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
import com.kaifantech.component.service.alloc.status.IAllocStatusMgrService;
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
	private IAllocStatusMgrService allocService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_ALLOC_INFO_SERVICE)
	private IAllocInfoService allocInfoService;

	@Autowired
	private AgvOpChargeDao agvOpDao;

	@Autowired
	private AgvOpWmsDao agvOpWmsDao;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	private static ExecutorService pool = ThreadTool.getThreadPool(2);

	public synchronized void deal(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsg) throws Exception {
		List<TaskexeDetailBean> taskexeDetailList = taskexeDetailService.getList(taskexeBean);
		pool.execute(() -> {
			try {
				taskexeWatchDealer.watchSingleSite(taskexeBean, agvMsg, taskexeDetailList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		if (TaskexeOpFlag.NEW.equals(taskexeBean.getOpflag())) {
			Integer exeingAgv = agvInDArea(taskexeBean);
			if (!AppTool.isNull(exeingAgv)) {
				return;
			}
			AppFileLogger.warning("开始任务！", taskexeBean.getTaskKey());
			startWork(taskexeBean);
			return;
		}
		if (TaskexeOpFlag.SEND.equals(taskexeBean.getOpflag())) {
			watchWork(taskexeBean);
			return;
		}
	}

	private Integer agvInDArea(TaskexeBean taskexeBean) {
		for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
			if (agvBean.getId().equals(taskexeBean.getAgvId())) {
				continue;
			}
			TaskexeBean taskexeBeanOther = taskexeInfoService.getNextOne(agvBean.getId());
			if (taskexeBeanOther == null || !TaskexeOpFlag.SEND.equals(taskexeBeanOther.getOpflag())) {
				continue;
			}
			String currentAreaOther = AppCache.worker().get("AREA_CURRENT", agvBean.getId());
			String nextAreaWorkOther = AppCache.worker().get("AREA_NEXT_WORK", agvBean.getId());
			String nextAreaWorkTarget = AppCache.worker().get("AREA_NEXT_WORK", taskexeBean.getAgvId());
			if (AppTool.equals(currentAreaOther, "D")) {
				AppFileLogger.piLogs(currentAreaOther, "区有AGV", agvBean.getId(), ",", taskexeBean, "阻塞");
				return agvBean.getId();
			}
			if (AppTool.equals(currentAreaOther, "C", "B", "A")) {
				if (AppTool.equals(nextAreaWorkOther, "A") && AppTool.equals(nextAreaWorkTarget, "C")) {
				} else {
					AppFileLogger.piLogs(currentAreaOther, "区有AGV", agvBean.getId(), ",", taskexeBean, "阻塞");
					return agvBean.getId();
				}
			} else if ("A".equals(currentAreaOther) && !"C".equals(nextAreaWorkTarget)) {
				AppFileLogger.piLogs(currentAreaOther, "区有AGV", agvBean.getId(), ",", taskexeBean, "阻塞");
				return agvBean.getId();
			}

			if (AgvTaskType.RECEIPT.equals(taskexeBean.getTasktype())) {
			} else if (AgvTaskType.SHIPMENT.equals(taskexeBean.getTasktype())) {
				if (!AppTool.equals(currentAreaOther, "E")) {
					AppFileLogger.piLogs("放货任务：A(或B/C/D)区有AGV", agvBean.getId(), ",", taskexeBean.getTaskKey(), "阻塞");
					return agvBean.getId();
				}
			}
		}
		return null;
	}

	private void startWork(TaskexeBean taskexeBean) {
		ThreadTool.sleep(1000);
		if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.RECEIPT, AgvTaskType.SHIPMENT)) {
			SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
			AppMsg msg = agvManager.doTask(taskexeBean.getAgvId(), singletaskBean.getTaskname());
			if (!msg.isSuccess()) {
				return;
			}
			agvOpWmsDao.goWork(taskexeBean.getAgvId(), taskexeBean.getTasktype(), taskexeBean.getTaskexesid());
		} else if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.GOTO_CHARGE, AgvTaskType.BACK_CHARGE)) {
			SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
			AppMsg msg = agvManager.doTask(taskexeBean.getAgvId(), singletaskBean.getTaskname());
			if (!msg.isSuccess()) {
				return;
			}
		}
		taskexeTaskDao.sendATask(taskexeBean);
		AppFileLogger.warning(taskexeBean.getAgvId(), "号AGV执行的", taskexeBean.getTaskexesid(), "-",
				taskexeBean.getTasksequence(), "发送成功，更新任务状态为SEND！");
	}

	private void watchWork(TaskexeBean taskexeBean) {
		HongfuAgvMsgBean agvMsg = HongfuAgvMsgGetter.getFreshBean(taskexeBean.getAgvId());
		if (!AppTool.isNull(agvMsg) && agvMsg.isTaskfinished()) {
			if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.RECEIPT, AgvTaskType.SHIPMENT)) {
				AllocItemInfoBean allocItem = allocInfoService.getByTaskid(taskexeBean.getJsonItem("taskid"));
				AppMsg msg = AgvTaskType.RECEIPT.equals(taskexeBean.getTasktype())
						? allocService.transferUpDone(allocItem) : allocService.transferDownDone(allocItem);
				if (!msg.isSuccess()) {
					return;
				}
				agvOpWmsDao.workOver(taskexeBean.getAgvId(), taskexeBean.getTasktype());
			} else if (AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.GOTO_CHARGE, AgvTaskType.BACK_CHARGE)) {
				if (AgvTaskType.GOTO_CHARGE.equals(taskexeBean.getTasktype())) {
					agvOpDao.workOverGotoCharge(taskexeBean.getAgvId());
				} else if (AgvTaskType.BACK_CHARGE.equals(taskexeBean.getTasktype())) {
					agvOpDao.workOverBackCharge(taskexeBean.getAgvId());
				}
			}
			taskexeTaskDao.overASendTask(taskexeBean);
			AppCache.worker().hset("AREA_CURRENT", taskexeBean.getAgvId(), "O");
			AppCache.worker().hset("AREA_NEXT", taskexeBean.getAgvId(), "O");
			AppCache.worker().hset("AREA_NEXT_WORK", taskexeBean.getAgvId(), "O");
			AppFileLogger.warning(taskexeBean.getAgvId(), "号AGV执行的", taskexeBean.getTaskexesid(), "-",
					taskexeBean.getTasksequence(), "任务所有明细任务均已执行完毕，更新任务状态为OVER！");
		}
	}
}
