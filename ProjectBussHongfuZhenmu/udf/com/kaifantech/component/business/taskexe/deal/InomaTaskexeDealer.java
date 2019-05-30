package com.kaifantech.component.business.taskexe.deal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.comm.manager.agv.IAgvManager;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.taskexe.dealer.ITaskexeDealer;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.thread.ThreadTool;

@Service
public class InomaTaskexeDealer implements ITaskexeDealer {
	@Autowired
	protected TaskexeOpDao taskexeTaskDao;

	@Autowired
	protected IAgvManager agvManager;

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
		taskexeTaskDao.sendATask(taskexeBean);
	}
}
