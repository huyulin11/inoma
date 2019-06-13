package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.cache.manager.AppCache;
import com.kaifantech.component.service.tasksite.info.HongfuTaskSiteInfoService;
import com.kaifantech.init.sys.params.CacheKeys;
import com.kaifantech.util.constant.taskexe.ctrl.AgvLockStatus;

@Component
public class HongfuPiLockService {
	@Autowired
	private HongfuTaskSiteInfoService taskSiteInfoService;

	public void roadLocks(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsgBean, TaskexeDetailBean taskexeDetail) {
		List<Map<String, Object>> roadLocks = AppCache.worker().getListSerachByVal(CacheKeys.ROAD_LOCKS, "%TRUE%");
		String siteYaxisStr = taskSiteInfoService.getBean(taskexeDetail.getSiteid()).getJsonItem("yaxis");
		if (AppTool.isNull(roadLocks)) {
			JSONObject roadLock = new JSONObject();
			roadLock.put("lock", "TRUE");
			roadLock.put("status", AgvLockStatus.INLOCK);
			roadLock.put("start", agvMsgBean.getY());
			roadLock.put("end", siteYaxisStr);
			AppCache.worker().hset(CacheKeys.ROAD_LOCKS, taskexeBean.getAgvId(), roadLock.toJSONString());
		}
	}
}
