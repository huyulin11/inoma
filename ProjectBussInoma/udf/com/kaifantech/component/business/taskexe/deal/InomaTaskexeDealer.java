package com.kaifantech.component.business.taskexe.deal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.msg.fancy.agv.FancyAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.business.taskexe.dealer.ITaskexeDealer;
import com.kaifantech.component.comm.manager.agv.IAgvManager;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.paper.base.WmsPaperService;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.msg.agv.FancyAgvMsgGetter;
import com.kaifantech.util.thread.ThreadTool;
import com.ytgrading.util.AppTool;

@Service
public class InomaTaskexeDealer implements ITaskexeDealer {
	@Autowired
	protected WmsPaperService wmsPaperService;

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
			FancyAgvMsgBean fancyAgvMsgBean = FancyAgvMsgGetter.getAgvMsgBean(taskexeBean.getAgvId());
			if (AppTool.isNull(fancyAgvMsgBean) || !fancyAgvMsgBean.isValid()) {
				return;
			}
		}
	}

	private void startWork(TaskexeBean taskexeBean) {
		ThreadTool.sleep(5000);
		taskexeTaskDao.sendATask(taskexeBean);
	}
}
