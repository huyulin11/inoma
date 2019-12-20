package com.kaifantech.init.sys;

import java.io.IOException;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.calculatedfun.util.AppFile;
import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.component.cache.worker.AppBeanFactory;
import com.kaifantech.component.dao.alloc.AllocItemDao;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;

public class AppBusinessInfo extends BaseBusinessInfo {
	public static final Clients CURRENT_CLIENT = Clients.HONGFU;
	public static final Projects CURRENT_PROJECT = Projects.HONGFU_ZHENMU;

	public static final String SYSTEM_INIT_DB_KEY = "kf_hongfu_zhenmu_";

	public static void createStaticFile() throws IOException {
		BaseBusinessInfo.createStaticFile();

		{
			AllocItemDao allocItemDao = AppBeanFactory.get(AllocItemDao.class);
			String info = JSONArray.toJSON(allocItemDao.getAllocs()).toString();
			AppFile.createFile(AppBusinessInfo.getProjJsonsPath() + "allocs/", "allocs" + ".json", info);
		}

		{
			List<SingletaskBean> singleTaskList = AppBeanFactory.get(SingleTaskInfoService.class).getList();
			if (!AppTool.isNull(singleTaskList)) {
				String info = JSONArray.toJSON(singleTaskList).toString();
				AppFile.createFile(AppBusinessInfo.getProjJsonsPath() + "singletasks/", "singletasks" + ".json", info);
			}
		}
	}
}
