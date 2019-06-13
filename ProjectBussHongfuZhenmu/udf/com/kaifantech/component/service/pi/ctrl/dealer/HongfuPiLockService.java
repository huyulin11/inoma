package com.kaifantech.component.service.pi.ctrl.dealer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.cache.manager.AppCache;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.tasksite.info.HongfuTaskSiteInfoService;
import com.kaifantech.init.sys.params.CacheKeys;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvLockStatus;

@Component
public class HongfuPiLockService {
	@Autowired
	private HongfuTaskSiteInfoService taskSiteInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	public void roadLocks(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsgBean, TaskexeDetailBean taskexeDetail) {
		String roadLockInfo = AppCache.worker().get(CacheKeys.ROAD_LOCKS, taskexeBean.getAgvId());
		String siteYaxisStr = taskSiteInfoService.getBean(taskexeDetail.getSiteid()).getJsonItem("yaxis");
		long notSelfLocks = 0;

		for (IotClientBean agv : iotClientService.getAgvCacheList()) {
			if (!agv.getId().equals(taskexeBean.getAgvId())) {
				String thisRoadLockInfo = AppCache.worker().get(CacheKeys.ROAD_LOCKS, agv.getId());
				JSONObject tmpJsonObj = JSONObject.parseObject(thisRoadLockInfo);
				if (!AppTool.isNull(tmpJsonObj) && AgvLockStatus.INLOCK.equals(tmpJsonObj.getString("status"))) {
					notSelfLocks++;
				}
			}
		}
		if (notSelfLocks == 0) {
			lockOne(taskexeBean, AgvLockStatus.INLOCK, agvMsgBean.getY(), siteYaxisStr);
		} else {
			if (!AppTool.isNull(roadLockInfo))
				updateOne(taskexeBean, agvMsgBean.getY(), siteYaxisStr, roadLockInfo);
		}
	}

	private void lockOne(TaskexeBean taskexeBean, String status, Object startAxis, Object endAxis) {
		lockOne(taskexeBean.getAgvId(), status, startAxis, endAxis);
	}

	private void updateOne(TaskexeBean taskexeBean, Object startAxis, Object endAxis, String jsonValObj) {
		JSONObject tmpJsonObj = JSONObject.parseObject(jsonValObj);
		String status = tmpJsonObj.getString("status");
		lockOne(taskexeBean, status, startAxis, endAxis);
	}

	private void lockOne(int agvid, String status, Object startAxis, Object endAxis) {
		JSONObject roadLockJson = new JSONObject();
		roadLockJson.put("status", status);
		roadLockJson.put("start", startAxis);
		roadLockJson.put("end", endAxis);
		AppCache.worker().hset(CacheKeys.ROAD_LOCKS, agvid, roadLockJson.toJSONString());
	}
}
