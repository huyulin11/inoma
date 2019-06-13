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
		List<Map<String, Object>> roadLockMaps = AppCache.worker().getListBy(CacheKeys.ROAD_LOCKS,
				"`value` like '%" + AgvLockStatus.INLOCK + "%'");
		String siteYaxisStr = taskSiteInfoService.getBean(taskexeDetail.getSiteid()).getJsonItem("yaxis");
		long notSelfLocks = 0;

		if (!AppTool.isNull(roadLockMaps)) {
			for (Map<String, Object> roadLockMap : roadLockMaps) {
				if (!roadLockMap.get("key").equals(taskexeBean.getAgvId())) {
					notSelfLocks++;
				} else {
					Object jsonValObj = roadLockMap.get("value");
					JSONObject tmpJsonObj = JSONObject.parseObject(jsonValObj.toString());
					String status = tmpJsonObj.getString("status");
					lockOne(taskexeBean, status, agvMsgBean.getY(), siteYaxisStr);
				}
			}
		}
		if (notSelfLocks == 0) {
			lockOne(taskexeBean, AgvLockStatus.INLOCK, agvMsgBean.getY(), siteYaxisStr);
		}
	}

	private void lockOne(TaskexeBean taskexeBean, String status, Object startAxis, Object endAxis) {
		lockOne(taskexeBean.getAgvId(), status, startAxis, endAxis);
	}

	private void lockOne(int agvid, String status, Object startAxis, Object endAxis) {
		JSONObject roadLockJson = new JSONObject();
		roadLockJson.put("status", status);
		roadLockJson.put("start", startAxis);
		roadLockJson.put("end", endAxis);
		AppCache.worker().hset(CacheKeys.ROAD_LOCKS, agvid, roadLockJson.toJSONString());
	}
}
