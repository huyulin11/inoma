package com.kaifantech.component.service.taskexe.check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.service.alloc.check.IAllocCheckService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.init.sys.qualifier.DefaultQualifier;
import com.kaifantech.init.sys.qualifier.WmsQualifier;

@Service(WmsQualifier.TASKEXE_CHECK_SERVICE)
public class HongfuTaskexeCheckService extends AcsTaskexeCheckService {
	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	@Qualifier(DefaultQualifier.DEFAULT_ALLOC_CHECK_SERVICE)
	private IAllocCheckService allocCheckService;

	public AppMsg checkBeforeAdd(TaskexeBean taskexeBean, Integer agvId) {
		SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
		if (singletaskBean == null) {
			return new AppMsg(-1, "未获取到对应基础任务信息！");
		}
		AppMsg msg = allocCheckService.checkAllocBeforeAdd(singletaskBean, agvId);
		return msg;
	}
}
