package com.kaifantech.util.socket.netty.client.hongfu;

import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.util.constant.taskexe.ctrl.IotDevType;
import com.kaifantech.util.socket.IConnect;
import com.kaifantech.util.socket.iot.client.RoboticArmClient;
import com.kaifantech.util.socket.netty.client.AbstractNettyClient;

public class HongfuClientFactory {
	private static IConnect create(IotClientBean iotClientBean, String devtype) {
		if (devtype.equals(IotDevType.AGV_HONGFU)) {
			HongfuAgvNettyClient agvNettyClient = new HongfuAgvNettyClient(iotClientBean);
			agvNettyClient.setAgvId(iotClientBean.getId());
			return agvNettyClient;
		} else if (devtype.equals(IotDevType.RONOT_ON_AGV)) {
			return new RoboticArmClient(iotClientBean);
		}
		return null;
	}

	public static IConnect create(IotClientBean bean) {
		IConnect client = create(bean, bean.getDevtype());
		((AbstractNettyClient) client).setDevId(bean.getId());
		return client;
	}

}
