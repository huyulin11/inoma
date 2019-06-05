package com.kaifantech.component.service.ctrl.deal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.component.comm.manager.agv.IAgvManager;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.msg.info.agv.IAgvMsgInfoModule;
import com.kaifantech.component.service.taskexe.ctrl.IHongfuCtrlModule;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvMoveStatus;

@Service(HongfuSystemQualifier.CTRL_MODULE)
public class HongfuCtrlModule implements IHongfuCtrlModule {
	@Autowired
	private IAgvManager agvManager;

	@Autowired
	private IAgvMsgInfoModule msgService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	public void control(IotClientBean agvBean, HongfuAgvMsgBean agvMsg) {
		if (!AgvMoveStatus.CONTINUE.equals(agvInfoDao.getMoveStatus(agvBean.getId()))) {
			if (!msgService.getLatestMsgBean(agvBean.getId()).isAGVPause()) {
				pause(agvBean.getId());
			}
		} else {
			if (msgService.getLatestMsgBean(agvBean.getId()).isAGVPause()) {
				startup(agvBean.getId());
			}
		}
	}

	public void pause(Integer agvId) {
		agvManager.pause(agvId);
	}

	public void startup(Integer agvId) {
		agvManager.startup(agvId);
	}
}
