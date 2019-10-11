package com.kaifantech.component.service.comm.socketdev;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.component.dao.IotClientConnectMsgDao;
import com.kaifantech.component.log.AgvStatusDBLogger;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.iot.client.msg.IotClientMsgService;
import com.kaifantech.component.service.lap.LapAgvInfoService;
import com.kaifantech.component.service.taskexe.auto.ITaskexeAutoService;
import com.kaifantech.init.sys.AppBusinessInfo;
import com.kaifantech.init.sys.BaseBusinessInfo;
import com.kaifantech.init.sys.params.AppAutoParameters;
import com.kaifantech.util.constant.taskexe.ctrl.IotDevType;
import com.kaifantech.util.socket.IConnect;
import com.kaifantech.util.socket.netty.client.hongfu.HongfuClientFactory;
import com.kaifantech.util.thread.ThreadTool;

@Service
public class RoboticArmWorker {
	private Map<Integer, IConnect> clientMap = new HashMap<Integer, IConnect>();

	@Autowired
	private IIotClientService socketdevService;

	@Autowired
	private IotClientMsgService msgService;

	@Autowired
	private IotClientConnectMsgDao connectMsgDao;

	@Autowired
	private LapAgvInfoService lapInfoService;

	@Autowired
	private ITaskexeAutoService taskexeAutoService;

	private int tipsTime = 0;

	@Autowired
	private AgvStatusDBLogger dbLogger;

	public IConnect getClient(Integer keyId) {
		return getClientMap().get(keyId);
	}

	public Map<Integer, IConnect> getClientMap() {
		if (clientMap == null || clientMap.size() <= 0) {
			for (IotClientBean bean : socketdevService.getList()) {
				if (BaseBusinessInfo.Projects.CSY_DAJ.equals(AppBusinessInfo.CURRENT_PROJECT)
						&& bean.getDevtype().equals(IotDevType.ROBOT_GOODS_FROM)) {
					try {
						IConnect client;
						client = HongfuClientFactory.create(bean);
						clientMap.put(bean.getId(), client);
						client.init();
					} catch (Exception e) {
						e.printStackTrace();
						continue;
					}
				}
			}
		}
		return clientMap;
	}

	public void startConnect() {
		Iterator<Entry<Integer, IConnect>> iterator = getClientMap().entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<Integer, IConnect> entry = iterator.next();
			doReceive(entry.getKey(), entry.getValue());
		}
	}

	@SuppressWarnings("null")
	@Async
	private void doReceive(Integer keyId, IConnect client) {
		if (!AppAutoParameters.isAutoTask()) {
			if (tipsTime++ > 20) {
				tipsTime = 0;
				dbLogger.warning("系统自动任务功能关闭中，请注意观察机械手实际生产情况！！！", 0, AgvStatusDBLogger.MSG_LEVEL_INFO);
			}
			return;
		}
		List<Integer> lapIds = null;// client.getLatestMsgList();
		for (Integer lapId : lapIds) {
			if (!AppTool.isNull(lapInfoService.getLap(lapId))) {
				if (!lapInfoService.getLapInUsed(lapId)) {
					taskexeAutoService.addTask(lapId, 1);
					ThreadTool.sleep(1000);
				}
			}
		}
		String msg = client.getMsg();
		if (!AppTool.isNullStr(msg)) {
			ThreadTool.getThreadPool().execute(new Runnable() {
				public void run() {
					connectMsgDao.addAReceiveMsg(msg, keyId);
					msgService.setLatestMsg();
				}
			});
		}
	}
}
