package com.kaifantech.component.service.taskexe.oper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.agv.info.AgvInfoService;
import com.kaifantech.component.service.taskexe.add.ITaskexeAddService;
import com.kaifantech.component.service.taskexe.check.ITaskexeCheckService;
import com.kaifantech.component.service.taskexe.status.ITaskexeStatusService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;

/***
 * 描述任务从用户下达到发送AGV执行前的逻辑
 ***/
@Service(HongfuSystemQualifier.TASKEXE_ADD_SERVICE)
public class AcsTaskexeAddService implements ITaskexeAddService {

	@Autowired
	private AgvInfoService agvInfoService;

	@Autowired
	private TaskexeOpDao taskexeTaskDao;

	@Autowired
	private ITaskexeStatusService taskexeStatusService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_TASKEXE_CHECK_SERVICE)
	private ITaskexeCheckService taskexeCheckService;

	@Override
	public AppMsg addTask(Object obj) {
		TaskexeBean taskexeBean = (TaskexeBean) obj;
		return addTask(taskexeBean);
	}

	private AppMsg addTask(TaskexeBean taskexeBean) {
		Integer tmpAGVId = agvInfoService.checkAgvId(taskexeBean.getAgvId());
		if (tmpAGVId < 0) {
			return new AppMsg(-1, "错误的agv编号");
		}
		AppMsg msg = taskexeCheckService.checkAllocBeforeAddTask(taskexeBean, tmpAGVId);
		if (msg.getCode() >= 0) {
			taskexeStatusService.changeStatusWhenNew(taskexeBean.getTaskid());
			taskexeTaskDao.addATask(taskexeBean);
			msg.setMsg("任务完成下达！");
		}
		return msg;
	}
}