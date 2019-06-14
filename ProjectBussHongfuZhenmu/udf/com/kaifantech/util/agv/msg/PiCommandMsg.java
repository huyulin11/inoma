package com.kaifantech.util.agv.msg;

import java.util.ArrayList;
import java.util.List;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.util.agv.taskpath.DistanceStatus;

public class PiCommandMsg extends PiCommand {
	private DistanceStatus distanceStatus;

	private List<HongfuAgvMsgBean> safeMsgs = new ArrayList<>();

	private List<HongfuAgvMsgBean> dangerMsgs = new ArrayList<>();

	public DistanceStatus getDistanceStatus() {
		return distanceStatus;
	}

	public void setDistanceStatus(DistanceStatus distanceStatus) {
		this.distanceStatus = distanceStatus;
	}

	public List<HongfuAgvMsgBean> getSafeMsgs() {
		return safeMsgs;
	}

	public List<HongfuAgvMsgBean> getDangerMsgs() {
		return dangerMsgs;
	}

	public PiCommand dangerous(HongfuAgvMsgBean msgOne) {
		if (!AppTool.isNull(msgOne)) {
			getDangerMsgs().add(msgOne);
		}
		return this;
	}

	public PiCommand safe(HongfuAgvMsgBean msgOne) {
		if (!AppTool.isNull(msgOne)) {
			getSafeMsgs().add(msgOne);
		}
		return this;
	}
}
