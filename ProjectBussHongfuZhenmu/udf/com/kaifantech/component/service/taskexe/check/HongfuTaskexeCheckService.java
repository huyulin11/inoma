package com.kaifantech.component.service.taskexe.check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.info.agv.AgvBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.alloc.check.IAllocCheckService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.WmsSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvSiteStatus;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;

@Service(WmsSystemQualifier.TASKEXE_CHECK_SERVICE)
public class HongfuTaskexeCheckService extends AcsTaskexeCheckService {
	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_ALLOC_CHECK_SERVICE)
	private IAllocCheckService allocCheckService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	public AppMsg checkAllocBeforeAddTask(TaskexeBean taskexeBean, Integer agvId) {
		AgvBean agvInfo = agvInfoDao.get(agvId);
		if (AppTool.isNull(agvInfo)) {
			return new AppMsg(-1, "未能货值AGV当前状态！");
		}
		if (!(AgvTaskType.FREE.equals(agvInfo.getTaskstatus()) && AgvSiteStatus.INIT.equals(agvInfo.getSitestatus()))) {
			return new AppMsg(-1, "AGV不处于空闲中，检查是否正在充电！");
		}
		SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
		if (singletaskBean == null) {
			return new AppMsg(-1, "未获取到对应基础任务信息！");
		}
		AppMsg msg = allocCheckService.checkBeforeAddTask(singletaskBean, agvId);
		return msg;
	}
}
