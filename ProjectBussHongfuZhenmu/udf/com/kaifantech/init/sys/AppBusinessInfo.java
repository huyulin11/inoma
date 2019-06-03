package com.kaifantech.init.sys;

import java.io.IOException;

import com.alibaba.fastjson.JSONArray;
import com.kaifantech.component.cache.worker.AppContextStaticBeanFactory;
import com.kaifantech.component.dao.alloc.AllocItemDao;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;

public class AppBusinessInfo extends BaseBusinessInfo {
	public static final Clients CURRENT_CLIENT = Clients.HONGFU;
	public static final Projects CURRENT_PROJECT = Projects.HONGFU_ZHENMU;

	public static void createStaticFile() throws IOException {
		BaseBusinessInfo.createStaticFile();

		{
			AllocItemDao allocItemDao = AppContextStaticBeanFactory.getBean(AllocItemDao.class);
			String info = JSONArray.toJSON(allocItemDao.getAllocs()).toString();
			AppBusinessInfo.createFile(AppBusinessInfo.getProjJsonsPath() + "allocs/", "allocs" + ".json", info);
		}

		{
			SingleTaskInfoService singleTaskInfoService = AppContextStaticBeanFactory
					.getBean(SingleTaskInfoService.class);
			String info = JSONArray.toJSON(singleTaskInfoService.getList()).toString();
			AppBusinessInfo.createFile(AppBusinessInfo.getProjJsonsPath() + "singletasks/", "singletasks" + ".json",
					info);
		}
	}
}
