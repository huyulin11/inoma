package com.kaifantech.util.socket.netty.client.hongfu;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.cache.manager.AppCacheManager;
import com.kaifantech.cache.manager.AppConfManager;
import com.kaifantech.init.sys.params.HongfuCacheKeys;
import com.kaifantech.util.socket.netty.client.AbstractNettyClient;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.util.CharsetUtil;

public class HongfuAgvNettyClient extends AbstractNettyClient {
	public static final String PREFIX_WHEN_SEND_TASK = "cmd=set task by name;name=";
	public static final String PAUSE_CMD = "cmd=pause;pauseStat=" + 1 + ";";
	public static final String CONTINUE_CMD = "cmd=pause;pauseStat=" + 0 + ";";

	public static final String MSG_PREFIX = "cmd=position;";
	public static final String MSG_SUFFIX = "?";
	public static final String MSG_SUFFIX2 = "�";

	private int msgIndex = 0;

	public HongfuAgvNettyClient(IotClientBean iotClientBean) {
		super(iotClientBean);
	}

	public void dealData(ChannelHandlerContext ctx, ByteBuf in) {
		String agvMsgStr = in.toString(CharsetUtil.UTF_8);
		agvMsgStr = dealMsg(agvMsgStr);
		if (AppTool.isNull(agvMsgStr)) {
			return;
		}

		AppCacheManager.getWorker().hset(HongfuCacheKeys.agvMsgKey(), getAgvId(), agvMsgStr);
		if (msgIndex > 100000) {
			msgIndex = 0;
			AppConfManager.getWorker().del(HongfuCacheKeys.agvMsgList(getAgvId()));
		}
		AppConfManager.getWorker().hset(HongfuCacheKeys.agvMsgList(getAgvId()), msgIndex++, agvMsgStr);
		setLatestMsg(agvMsgStr);
	}

	public String dealMsg(String msg) {
		String info = msg.replaceAll(MSG_SUFFIX2, "").replaceAll("[" + MSG_SUFFIX + "]", "") + MSG_SUFFIX;

		if (!AppTool.isNullStr(info)) {
			int i = info.indexOf(MSG_PREFIX);
			int ii = info.indexOf(MSG_PREFIX, i + MSG_PREFIX.length());
			if (i < 0) {
				info = "";
			} else if (ii < 0) {
				int iii = info.indexOf(MSG_SUFFIX);
				if (iii < 0) {
					info = "";
				} else {
					info = info.substring(i, iii + 1);
				}
			} else {
				info = info.substring(i, ii);
			}
		}
		return info;
	}
}
