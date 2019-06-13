package com.kaifantech.component.service.alloc.amount;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.component.dao.agv.info.AgvOpInitDao;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;

@Service(HongfuSystemQualifier.ALLOC_AMOUNT_SERVICE)
public class HongfuAllocAmountService extends AcsAllocAmountService {
	@Autowired
	private TaskexeInfoService taskexeInfoService;

	@Autowired
	private TaskexeOpDao taskexeTaskDao;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	private AgvOpInitDao agvOpInitDao;

	public void dealWhenSuoding(AllocItemInfoBean item) {
		List<SingletaskBean> singleTaskList = singleTaskInfoService.getBy(item.getId());
		for (SingletaskBean singletask : singleTaskList) {
			TaskexeBean taskexe = taskexeInfoService.getNotOverOne(singletask.getId());
			if (!AppTool.isNull(taskexe)) {
				if (TaskexeOpFlag.NEW.equals(taskexe.getOpflag())) {
					taskexeTaskDao.overANormalTask(taskexe.getUuid());
				} else if (TaskexeOpFlag.SEND.equals(taskexe.getOpflag())) {
					taskexeTaskDao.overASendTask(taskexe.getUuid());
				}
				agvOpInitDao.workOverForce(taskexe.getAgvId());
			}
		}
	}
}
