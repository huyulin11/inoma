package com.kaifantech.component.service.iot.client.msg;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;

public class IotClientLatestMsg {
	private HongfuAgvMsgBean agvMsg = null;

	public IotClientLatestMsg(HongfuAgvMsgBean agvMsg) {
		this.agvMsg = agvMsg;
	}

	public HongfuAgvMsgBean geAGVMsg() {
		return agvMsg;
	}

	public void setAGVMsg(HongfuAgvMsgBean latestMsg) {
		this.agvMsg = latestMsg;
	}

	public boolean isLatestTaskexeSuccessDone(TaskexeBean command) {
		try {
			if (AppTool.isNull(agvMsg) || AppTool.isNull(agvMsg.getTime())) {
				return false;
			}
			Date latestMsgTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(agvMsg.getTime());
			Date cmdTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(command.getTime());
			if (latestMsgTime.getTime() - cmdTime.getTime() < 10000) {
				return false;
			}
			if (!command.getTaskexesid().equals(agvMsg.getTaskid()) || !"1".equals(agvMsg.getTaskIsfinished())) {
				return false;
			} else {
				return true;
			}
		} catch (ParseException e) {
			return false;
		}
	}

	public boolean isLatestTaskexeSendDone() {
		try {
			if (AppTool.isNullStr(agvMsg.getStr()) || agvMsg.getStr().indexOf("task_isfinished=") < 0
					|| !"0".equals(agvMsg.getStr().substring(
							agvMsg.getStr().indexOf("task_isfinished=") + "task_isfinished=".length(),
							agvMsg.getStr().indexOf("task_isfinished=") + "task_isfinished=".length() + 1))) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public boolean isAGVPause() {
		try {
			if (AppTool.isNullStr(agvMsg.getStr()) || agvMsg.getStr().indexOf("pause_stat=") < 0) {
				return false;
			}
			if (!"0".equals(agvMsg.getStr().substring(agvMsg.getStr().indexOf("pause_stat=") + "pause_stat=".length(),
					agvMsg.getStr().indexOf("pause_stat=") + "pause_stat=".length() + 1))) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
}