package com.kaifantech.component.service.alloc.check;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.service.singletask.group.SingletaskGroupService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;

@Service(HongfuSystemQualifier.ALLOC_CHECK_SERVICE)
public class InomaWmsAllocCheckService extends WmsAllocCheckService {
	@Autowired
	private SingletaskGroupService singletaskGroupService;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	private TaskexeInfoService taskInfoService;

	public AppMsg checkTaskGroup(SingletaskBean singletaskBean) {
		List<TaskexeBean> latestTaskList = taskInfoService.getNotOverList();
		if (latestTaskList != null && latestTaskList.size() > 0) {
			for (TaskexeBean taskexeBean : latestTaskList) {
				SingletaskBean tmpSingletaskBean = singleTaskInfoService.get(taskexeBean.getTaskid());
				if (AgvTaskType.ZUHE_RENWU.equals(singletaskBean.getTaskType())
						&& !singletaskGroupService.inTheSameGroupWith(tmpSingletaskBean, singletaskBean)) {
					return new AppMsg(-1, "正在执行的子任务与已执行的子任务不属于同一组！");
				} else if (tmpSingletaskBean.getId().equals(singletaskBean.getId())) {
					return new AppMsg(-1, "正在执行的子任务已经处于执行状态！");
				}
			}
		}
		return new AppMsg(0, "任务可以下达！");
	}
}
