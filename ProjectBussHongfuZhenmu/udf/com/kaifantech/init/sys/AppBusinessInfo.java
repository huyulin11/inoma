package com.kaifantech.init.sys;

import java.io.IOException;

import com.alibaba.fastjson.JSONArray;
import com.kaifantech.component.cache.worker.AppContextStaticBeanFactory;
import com.kaifantech.component.dao.alloc.AllocItemDao;

public class AppBusinessInfo extends BaseBusinessInfo {
	public static final Clients CURRENT_CLIENT = Clients.INOMA;
	public static final Projects CURRENT_PROJECT = Projects.HONGFU_ZHENMU;

	public static void createStaticFile() throws IOException {
		BaseBusinessInfo.createStaticFile();
		AllocItemDao allocItemDao = AppContextStaticBeanFactory.getBean(AllocItemDao.class);
		String info;
		info = JSONArray.toJSON(allocItemDao.getAllocs()).toString();
		AppBusinessInfo.createFile(AppBusinessInfo.getProjJsonsPath() + "allocs/", "allocs" + ".json", info);
	}
}
