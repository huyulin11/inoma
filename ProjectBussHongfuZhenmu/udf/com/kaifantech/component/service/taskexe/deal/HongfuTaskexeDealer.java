package com.kaifantech.component.service.taskexe.deal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.component.comm.manager.agv.HongfuAgvManager;
import com.kaifantech.component.dao.agv.info.AgvOpChargeDao;
import com.kaifantech.component.dao.agv.info.AgvOpWmsDao;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.alloc.info.IAllocInfoService;
import com.kaifantech.component.service.alloc.status.IAllocStatusMgrService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.dealer.IHongfuTaskexeDealer;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;
import com.kaifantech.util.thread.ThreadTool;

@Service
public class HongfuTaskexeDealer implements IHongfuTaskexeDealer {
	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	@Autowired
	protected TaskexeOpDao taskexeTaskDao;

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

	public void deal(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsg) throws Exception {
		List<TaskexeDetailBean> taskexeDetailList = taskexeDetailService.getList(taskexeBean);
		if (TaskexeOpFlag.NEW.equals(taskexeBean.getOpflag())) {
			startWork(taskexeBean);
			return;
		}
		if (TaskexeOpFlag.SEND.equals(taskexeBean.getOpflag())) {
			watchWork(taskexeBean);
			return;
		}
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
		System.out.println(taskexeBean.getAgvId() + "号AGV执行的" + taskexeBean.getTaskexesid() + "-"
				+ taskexeBean.getTasksequence() + "发送成功，更新任务状态为SEND！");
	}

	private void watchWork(TaskexeBean taskexeBean) {
		HongfuAgvMsgBean agvMsg = HongfuAgvMsgGetter.getBean(taskexeBean.getAgvId());
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
			System.out.println(taskexeBean.getAgvId() + "号AGV执行的" + taskexeBean.getTaskexesid() + "-"
					+ taskexeBean.getTasksequence() + "任务所有明细任务均已执行完毕，更新任务状态为OVER！");
		}
	}
}
