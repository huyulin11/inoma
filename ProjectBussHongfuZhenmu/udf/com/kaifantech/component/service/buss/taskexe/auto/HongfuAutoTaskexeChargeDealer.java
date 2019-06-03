package com.kaifantech.component.service.buss.taskexe.auto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.info.agv.AgvBean;
import com.kaifantech.component.dao.ControlInfoDao;
import com.kaifantech.component.dao.agv.info.AgvOpChargeDao;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.paper.base.WmsPaperService;
import com.kaifantech.util.constant.taskexe.ctrl.AgvSiteStatus;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;

@Component
public class HongfuAutoTaskexeChargeDealer {
	@Autowired
	protected WmsPaperService wmsPaperService;

	@Autowired
	private AgvOpChargeDao agvOpDao;

	@Autowired
	private TaskexeOpDao taskexeTaskDao;

	@Autowired
	private ControlInfoDao controlInfoDao;

	@Transactional(propagation = Propagation.REQUIRED)
	public synchronized AppMsg newTask(AgvBean targetAgv, String tasktype) {
		if (AppTool.ifAnd(
				!(AgvSiteStatus.INIT.equals(targetAgv.getSitestatus())
						&& AgvTaskType.GOTO_CHARGE.equals(targetAgv.getTaskstatus())),
				!(AgvSiteStatus.CHARGING.equals(targetAgv.getSitestatus())
						&& AgvTaskType.BACK_CHARGE.equals(targetAgv.getTaskstatus())),
				!(AgvSiteStatus.CHARGING.equals(targetAgv.getSitestatus())
						&& AgvTaskType.GOTO_CHARGE.equals(targetAgv.getTaskstatus())))) {
			return new AppMsg(-1, "下达充电任务到" + targetAgv.getId() + "号AGV出现异常：" + "任务参数有问题：" + tasktype);
		}

		try {
			String taskexesid = getSid();
			if (AgvTaskType.GOTO_CHARGE.equals(tasktype)) {
				JSONObject json = new JSONObject();
				json.put("taskid", targetAgv.equals(1) ? -4 : -2);
				taskexeTaskDao.addATask(taskexesid, targetAgv.getId(), 0, AgvTaskType.GOTO_CHARGE, json.toJSONString(),
						2);
				agvOpDao.goWorkToCharge(targetAgv.getId(), 0, taskexesid);
				return new AppMsg(0, "下达充电任务，将" + targetAgv.getId() + "号AGV调度到充电站！");
			} else if (AgvTaskType.BACK_CHARGE.equals(tasktype)) {
				JSONObject json = new JSONObject();
				json.put("taskid", targetAgv.equals(1) ? -4 : -2);
				taskexeTaskDao.addATask(taskexesid, targetAgv.getId(), 0, AgvTaskType.BACK_CHARGE, json.toJSONString(),
						2);
				agvOpDao.goWorkBackCharge(targetAgv.getId(), taskexesid);
				return new AppMsg(0, "下达充电任务，将" + targetAgv.getId() + "号AGV从充电站召回到其初始位置！");
			}
			return new AppMsg(0, "");
		} catch (Exception e) {
			e.printStackTrace();
			return new AppMsg(-1, "出现异常：" + e.getMessage());
		}
	}

	private String getSid() {
		String paperid = controlInfoDao.getPrefixByType("AGV_CHARGE_SID")
				+ String.format("%08d", controlInfoDao.getNextValueByType("AGV_CHARGE_SID"));
		return paperid;
	}
}
