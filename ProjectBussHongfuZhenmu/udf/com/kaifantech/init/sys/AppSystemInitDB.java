package com.kaifantech.init.sys;

public class AppSystemInitDB extends BaseSystemInitDB {
	public static final String SYSTEM_INIT_DB_KEY = "kf_inoma_weiwei_";

	public static final String OP_DB = SYSTEM_INIT_DB_KEY + "agv";
	public static final String BUSS_DB = SYSTEM_INIT_DB_KEY + "acs";
	public static final String IOT_DB = SYSTEM_INIT_DB_KEY + "iot";
	public static final String DE_DB = SYSTEM_INIT_DB_KEY + "de";
	public static final String WMS_DB = SYSTEM_INIT_DB_KEY + "wms";

	public static final String CONF_DB = SYSTEM_INIT_DB_KEY + "_conf";
	public static final String CACHE_CONF_DB = SYSTEM_INIT_DB_KEY + "_cache_conf";
	public static final String CACHE_SOCKET_DB = SYSTEM_INIT_DB_KEY + "_cache_socket";
}
