package com.kaifantech.component.comm.worker.client.agv;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.component.business.msg.info.agv.IAgvMsgInfoModule;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.dao.AgvMsgDao;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.InomaSystemQualifier;
import com.kaifantech.util.socket.IConnect;
import com.kaifantech.util.socket.netty.client.NettyClientFactory;
import com.kaifantech.util.thread.ThreadTool;
import com.ytgrading.util.AppTool;

@Service(InomaSystemQualifier.AGV_CLIENT_WORKER)
public class AcsAgvClientWorker implements IConnectWorker {
	private Map<Integer, IConnect> map = new HashMap<Integer, IConnect>();

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	private IAgvMsgInfoModule msgFromAGVService;

	@Autowired
	private AgvMsgDao msgDao;

	public void init() {
		if (map == null || map.size() <= 0) {
			for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
				IConnect agvClient = NettyClientFactory.create(agvBean);
				map.put(agvBean.getId(), agvClient);
				try {
					agvClient.init();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public Map<Integer, IConnect> getMap() {
		init();
		return map;
	}

	public void startConnect() {
		Iterator<Entry<Integer, IConnect>> iterator = getMap().entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<Integer, IConnect> entry = iterator.next();
			doReceive(entry.getKey(), entry.getValue());
		}
	}

	@Async
	private void doReceive(Integer agvId, IConnect client) {
		ThreadTool.run(() -> {
			String msg = client.getMsg();
			if (!AppTool.isNullStr(msg)) {
				ThreadTool.getThreadPool().execute(new Runnable() {
					public void run() {
						msgDao.addAReceiveMsg(msg, agvId);
						msgFromAGVService.setLatestMsg();
					}
				});
			}
		});
	}

}
