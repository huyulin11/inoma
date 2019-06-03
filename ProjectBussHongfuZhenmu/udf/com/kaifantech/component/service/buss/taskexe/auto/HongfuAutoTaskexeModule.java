package com.kaifantech.component.service.buss.taskexe.auto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.info.agv.AgvBean;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.taskexe.auto.IAutoTaskexeModule;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvSiteStatus;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.log.AppFileLogger;

@Component
@Lazy(false)
public class HongfuAutoTaskexeModule implements IAutoTaskexeModule {
	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	@Autowired
	private HongfuAutoTaskexeChargeDealer autoTaskexeChargeDealer;

	public synchronized void doWork() {
		charge();
	}

	private synchronized void charge() {
		List<AgvBean> list = agvInfoDao.getChargedList();
		AppMsg msg = AppMsg.fail();
		for (AgvBean agv : list) {
			if ((AgvSiteStatus.INIT.equals(agv.getSitestatus()) && AgvTaskType.GOTO_CHARGE.equals(agv.getTaskstatus()))
					|| (AgvSiteStatus.CHARGING.equals(agv.getSitestatus())
							&& AgvTaskType.BACK_CHARGE.equals(agv.getTaskstatus()))) {
				msg = autoTaskexeChargeDealer.newTask(agv, agv.getTaskstatus());
			}
		}
		if (!AppTool.isNull(msg.getMsg())) {
			AppFileLogger.error(msg.getMsg());
		}
	}
}
