package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.bean.tasksite.TaskSiteInfoBean;
import com.kaifantech.cache.manager.AppCache;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.tasksite.info.HongfuTaskSiteInfoService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;

@Component
public class HongfuPiInfoService {
	@Autowired
	private HongfuTaskSiteInfoService taskSiteInfoService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	private Map<Integer, HongfuTaskexeBean> cache = new HashMap<>();

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	public HongfuTaskexeBean getCache(Integer agvId) throws Exception {
		return cache.get(agvId);
	}

	public HongfuTaskexeBean get(Integer agvId) throws Exception {
		TaskexeBean taskexeBean = taskexeInfoService.getNextOne(agvId);
		if (taskexeBean == null) {
			return null;
		}
		HongfuTaskexeBean hongfuTaskexeBean = new HongfuTaskexeBean(taskexeBean);
		List<TaskexeDetailBean> detailList = taskexeDetailService.find(taskexeBean);
		if (AppTool.isNull(detailList)) {
			return null;
		}
		return get(hongfuTaskexeBean, detailList);
	}

	public HongfuTaskexeBean get(TaskexeBean taskexeBean, List<TaskexeDetailBean> list) {
		HongfuTaskexeBean obj = HongfuTaskexeBean.get(taskexeBean, list);
		HongfuAgvMsgBean agvMsgBean = HongfuAgvMsgGetter.getFreshBean(taskexeBean.getAgvId());
		if (AppTool.isNull(agvMsgBean)) {
			return null;
		}
		if (AppTool.isAnyNull(agvMsgBean.getX(), agvMsgBean.getY())) {
			return null;
		}

		obj.msg = agvMsgBean;
		obj.currentYaxis = agvMsgBean.getY();
		obj.currentArea = AppCache.worker().get("AREA_CURRENT", taskexeBean.getAgvId());

		obj.agvBean = agvInfoDao.get(taskexeBean.getAgvId());
		if (AppTool.isNull(obj.agvBean)) {
			return null;
		}

		for (TaskexeDetailBean thisDetail : list) {
			TaskSiteInfoBean thisSite = taskSiteInfoService.getBean(thisDetail.getSiteid());
			if (!thisDetail.isNew()) {
				obj.currentDetail = thisDetail;
				obj.currentSite = thisSite;
				continue;
			}

			double thisYaxis = Double.parseDouble(thisSite.getJsonItem("yaxis"));
			if (AppTool.isNull(obj.nextDetail)) {
				obj.nextDetail = thisDetail;
				obj.nextSite = thisSite;
				obj.nextYaxis = thisYaxis;
				obj.nextArea = AppCache.worker().get("AREA_NEXT", taskexeBean.getAgvId());
			} else {
				obj.nextYaxisList.add(thisYaxis);
			}
		}
		cache.put(obj.getAgvId(), obj);
		return obj;
	}
}
