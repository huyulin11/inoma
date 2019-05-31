package com.kaifantech.component.service.iot.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.IotDevType;

@Service(HongfuSystemQualifier.IOT_CLIENT_SERVICE)
public class HongfuIotClientService extends AcsIotClientService {
	private List<IotClientBean> agvCacheList = new ArrayList<>();

	@Scheduled(cron = "0 0 0/1 * * ?")
	public void shuffleAgvList() {
		Collections.shuffle(getAgvCacheList());
	}

	public synchronized List<IotClientBean> getAgvCacheList() {
		if (AppTool.isNull(agvCacheList)) {
			agvCacheList = getList(IotDevType.AGV_HONGFU);
			agvCacheList.sort((a1, a2) -> {
				return a2.getId() - a1.getId();
			});
		}
		return agvCacheList;
	}
}