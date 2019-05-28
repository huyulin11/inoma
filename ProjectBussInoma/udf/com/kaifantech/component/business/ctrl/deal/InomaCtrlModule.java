package com.kaifantech.component.business.ctrl.deal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.component.business.msg.info.agv.IAgvMsgInfoModule;
import com.kaifantech.component.comm.manager.agv.IAgvManager;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.ctrl.ICtrlModule;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.status.agv.AgvCtrlInfoService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.InomaSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvMoveStatus;

/***
 * 描述任务从用户下达到发送AGV执行前的逻辑
 ***/
@Service(InomaSystemQualifier.CTRL_MODULE)
public class InomaCtrlModule implements ICtrlModule {

	@Autowired
	private AgvCtrlInfoService ctrlService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	private IAgvManager agvManager;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_CLIENT_WORKER)
	private IConnectWorker agvClientWorker;

	@Autowired
	private IAgvMsgInfoModule msgService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	private Map<Integer, String> lastCtrlCMD = new HashMap<>();

	public void startControl() {
		if (!ctrlService.isSystemRunning()) {
			for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
				if (!msgService.getLatestMsgBean(agvBean.getId()).isAGVPause()) {
					sendPauseCommand(agvBean.getId());
				}
			}
		} else {
			for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
				if (!AgvMoveStatus.CONTINUE.equals(agvInfoDao.getMoveStatus(agvBean.getId()))) {
					if (!msgService.getLatestMsgBean(agvBean.getId()).isAGVPause()) {
						sendPauseCommand(agvBean.getId());
					}
				} else {
					if (msgService.getLatestMsgBean(agvBean.getId()).isAGVPause()) {
						sendContinueCommand(agvBean.getId());
					}
				}
			}
		}
	}

	public void sendPauseCommand(Integer agvId) {
		agvManager.pause(agvId);
	}

	public void sendContinueCommand(Integer agvId) {
		agvManager.startup(agvId);
	}

	public Map<Integer, String> getLastCtrlCmd() {
		return lastCtrlCMD;
	}

}
