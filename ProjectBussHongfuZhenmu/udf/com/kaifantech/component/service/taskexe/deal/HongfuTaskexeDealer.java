package com.kaifantech.component.service.taskexe.deal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.comm.manager.agv.HongfuAgvManager;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.dealer.ITaskexeDealer;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.thread.ThreadTool;

@Service
public class HongfuTaskexeDealer implements ITaskexeDealer {
	@Autowired
	protected TaskexeOpDao taskexeTaskDao;

	@Autowired
	protected HongfuAgvManager agvManager;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	public void dealTaskexe(TaskexeBean taskexeBean) throws Exception {
		if (TaskexeOpFlag.NEW.equals(taskexeBean.getOpflag())) {
			startWork(taskexeBean);
			return;
		}
		if (TaskexeOpFlag.SEND.equals(taskexeBean.getOpflag())) {
		}
	}

	private void startWork(TaskexeBean taskexeBean) {
		ThreadTool.sleep(5000);
		SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getTaskid());
		agvManager.doTask(taskexeBean.getAgvId(), singletaskBean.getTaskName());
		taskexeTaskDao.sendATask(taskexeBean);
	}
}
