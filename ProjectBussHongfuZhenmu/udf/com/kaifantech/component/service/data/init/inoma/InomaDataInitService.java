package com.kaifantech.component.service.data.init.inoma;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.info.agv.AgvInfoBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.wms.alloc.AllocColumnInfoBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.bean.wms.alloc.AllocationAreaInfoBean;
import com.kaifantech.bean.wms.sku.SkuInfoBean;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.dao.alloc.AllocColumnDao;
import com.kaifantech.component.dao.alloc.AllocItemDao;
import com.kaifantech.component.dao.iot.led.LedDevInfoDao;
import com.kaifantech.component.dao.singletask.SingletaskInfoDao;
import com.kaifantech.component.service.alloc.area.IAllocAreaService;
import com.kaifantech.component.service.lap.LapAgvInfoService;
import com.kaifantech.component.service.sku.SkuInfoService;
import com.kaifantech.init.sys.params.AppSysParameters;
import com.kaifantech.init.sys.qualifier.UdfQualifier;

@Service
public class InomaDataInitService {

	@Autowired
	private AllocColumnDao allocColumnDao;

	@Autowired
	private AllocItemDao allocItemDao;

	@Autowired
	private LapAgvInfoService lapInfoService;

	@Autowired
	private SingletaskInfoDao singletaskDao;

	@Autowired
	@Qualifier(UdfQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvDao;

	@Autowired
	private SkuInfoService skuInfoService;

	@Autowired
	private IAllocAreaService allocAreaService;

	@Autowired
	private LedDevInfoDao ledDevInfoDao;

	public void initData() {
		initAlloc();
		initTask();
		initLedInfo();
	}

	private void initTask() {
		if (!AppSysParameters.isInitTaskInfo()) {
			return;
		}

		for (AllocItemInfoBean bean : allocItemDao.getAllocs()) {
			Integer areaid = bean.getJsonItem("areaid", Integer.class);
			Integer colid = bean.getJsonItem("colid", Integer.class);
			Integer environment = bean.getJsonItem("environment", Integer.class);
			AllocColumnInfoBean columnBean = allocColumnDao.getAllocationColumnInfoBeanBy(areaid, colid);
			if (columnBean == null) {
				return;
			}
			SkuInfoBean skuInfoBean = null;
			if (columnBean.getAllowedSkuId() > 0) {
				skuInfoBean = skuInfoService.getSkuInfoBeanById(columnBean.getAllowedSkuId());
			} else if (columnBean.getAllowedSkuType() > 0) {
				skuInfoBean = skuInfoService.getSkuInfoBeanByType(columnBean.getAllowedSkuType());
			}
			for (AgvInfoBean agvBean : agvDao.getList()) {
				if (agvBean.getEnvironment() != environment) {
					continue;
				}
				List<Map<String, Object>> lapAGVList = lapInfoService.getAllLapListBy(agvBean.getId());
				for (Map<String, Object> lapAGV : lapAGVList) {
					Map<String, SingletaskBean> tasks = new HashMap<>();
					String tmpTaskName;
					String lapForkDesc = "";
					Integer lapId = (Integer) lapAGV.get("lapId");
					if (lapId.equals(lapAGV.get("agvId"))) {
						lapForkDesc = "" + agvBean.getId();
					} else {
						lapForkDesc = "" + agvBean.getId() + "-" + lapId;
					}

					if (bean.getText().indexOf("CHG") >= 0) {
						tmpTaskName = "" + agvBean.getId() + "-" + bean.getText() + "-" + "GOTO";
						tasks.put(tmpTaskName, singletaskDao.getSingletaskBy(bean.getId(), agvBean.getId(), 0, 5));
						tmpTaskName = "" + agvBean.getId() + "-" + bean.getText() + "-" + "BACK";
						tasks.put(tmpTaskName, singletaskDao.getSingletaskBy(bean.getId(), agvBean.getId(), 0, 6));
					} else {
						tmpTaskName = lapForkDesc + "-" + bean.getText() + "-"
								+ (AppTool.isNull(skuInfoBean) ? "0" : skuInfoBean.getLayerHeight());
						tasks.put(tmpTaskName, singletaskDao.getSingletaskBy(bean.getId(), agvBean.getId(), lapId));
					}

					for (String taskName : tasks.keySet()) {
						SingletaskBean singletask = tasks.get(taskName);
						if (!AppTool.isNull(singletask)) {
							if ((taskName + ".xml").equals(singletask.getTaskname())) {
								continue;
							} else {
								singletaskDao.update(taskName + ".xml", taskName + "任务", singletask.getId());
							}
						} else {
							if (taskName.indexOf("CHG") >= 0 && taskName.indexOf("GOTO") >= 0) {
								singletaskDao.insert(taskName + ".xml", taskName + "任务", bean.getId(), 5,
										agvBean.getId(), 0, environment);
							} else if (taskName.indexOf("CHG") >= 0 && taskName.indexOf("BACK") >= 0) {
								singletaskDao.insert(taskName + ".xml", taskName + "任务", bean.getId(), 6,
										agvBean.getId(), 0, environment);
							} else {
								singletaskDao.insert(taskName + ".xml", taskName + "任务", bean.getId(), -1,
										agvBean.getId(), lapId, environment);
							}
						}
					}
				}
			}
		}

		AppSysParameters.setInitTaskInfo(false);
	}

	private void initAlloc() {
		if (!AppSysParameters.isInitAllocInfo()) {
			return;
		}
		doInitAlloc();
		AppSysParameters.setInitAllocInfo(false);
	}

	private void doInitAlloc() {
		for (AllocationAreaInfoBean area : allocAreaService.getAllocationAreaInfoBeanList()) {
			for (int y = 1; y <= area.getColNum(); y++) {
				if (allocColumnDao.getAllAllocationColumnInfoBeanCount(area.getAreaId(), y) <= 0) {
					allocColumnDao.insert(area.getAreaId(), y, area.getEnvironment(),
							("CHG".equals(area.getText()) || "UCHG".equals(area.getText())) ? -1 : 0);
				}
			}
		}

		for (AllocationAreaInfoBean area : allocAreaService.getAllocationAreaInfoBeanList()) {
			for (int y = 1; y <= area.getColNum(); y++) {
				AllocColumnInfoBean columnBean = allocColumnDao.getAllocationColumnInfoBeanBy(area.getAreaId(), y);
				for (int x = 1; x <= area.getRowNum(); x++) {
					for (int z = 1; z <= area.getzNum(); z++) {
						String allocTextName = ("CHG".equals(area.getText()) || "UCHG".equals(area.getText()))
								? (area.getText() + "-" + y) : (area.getText() + "-" + y + "-" + x + "-" + z);
						if (allocItemDao.getAllocsCountBy(area.getAreaId(), x, y, z) > 0) {
							AllocItemInfoBean item = allocItemDao.getAllocationInfoBean(area.getAreaId(), x, y, z);
							if (!AppTool.isNull(item)) {
								if (!(allocTextName).equals(columnBean.getText())) {
									allocItemDao.updateText(item.getId(), allocTextName);
								}
							}

							Integer columnid = item.getJsonItem("columnid", Integer.class);
							if (!AppTool.isNull(item) && AppTool.isNull(columnid)) {
								allocItemDao.updateColumnId(item.getId(), columnBean.getColumnId());
							} else {
								continue;
							}
						} else {
							allocItemDao.insert(area.getAreaId(), x, y, z, columnBean.getColumnId(), allocTextName,
									columnBean.getEnvironment());
						}
					}
				}
			}
		}
	}

	private void initLedInfo() {
		if (!AppSysParameters.isInitLed()) {
			return;
		}

		String ipPreffix = "192.168.0.";
		int currentIpSuffix = 1;
		for (AllocColumnInfoBean columnBean : allocColumnDao.getAllAllocationColumnInfoBean()) {
			if (ledDevInfoDao.getAllLedDevInfoBeanCount(columnBean.getColumnId()) <= 0) {
				ledDevInfoDao.insert(columnBean.getColumnId(), ipPreffix + (currentIpSuffix++));
			}
		}

		AppSysParameters.setInitLed(false);
	}
}
