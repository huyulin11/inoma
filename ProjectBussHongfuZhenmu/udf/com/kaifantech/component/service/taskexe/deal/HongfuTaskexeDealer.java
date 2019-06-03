package com.kaifantech.component.service.taskexe.deal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.component.comm.manager.agv.HongfuAgvManager;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.alloc.info.IAllocInfoService;
import com.kaifantech.component.service.alloc.status.IAllocStatusMgrService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.dealer.ITaskexeDealer;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;
import com.kaifantech.util.thread.ThreadTool;

@Service
public class HongfuTaskexeDealer implements ITaskexeDealer {
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

	public void dealTaskexe(TaskexeBean taskexeBean) throws Exception {
		if (TaskexeOpFlag.NEW.equals(taskexeBean.getOpflag())) {
			startWork(taskexeBean);
			return;
		}
		if (TaskexeOpFlag.SEND.equals(taskexeBean.getOpflag())) {
			HongfuAgvMsgBean agvMsg = HongfuAgvMsgGetter.getBean(taskexeBean.getAgvId());
			if (!AppTool.isNull(agvMsg) && agvMsg.isTaskfinished()) {
				AllocItemInfoBean allocItem = allocInfoService.getByTaskid(taskexeBean.getTaskid());
				AppMsg msg = AgvTaskType.RECEIPT.equals(taskexeBean.getTasktype())
						? allocService.transferUpDone(allocItem) : allocService.transferDownDone(allocItem);
				if (!msg.isSuccess()) {
					return;
				}
				System.out.println(taskexeBean.getAgvId() + "号AGV执行的" + taskexeBean.getTaskid() + "-"
						+ taskexeBean.getTasksequence() + "任务所有明细任务均已执行完毕，更新任务状态为OVER！");
				taskexeTaskDao.overASendTask(taskexeBean);
			}
		}
	}

	private void startWork(TaskexeBean taskexeBean) {
		ThreadTool.sleep(5000);
		SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getTaskid());
		AppMsg msg = agvManager.doTask(taskexeBean.getAgvId(), singletaskBean.getTaskName());
		if (!msg.isSuccess()) {
			return;
		}
		taskexeTaskDao.sendATask(taskexeBean);
	}
}
