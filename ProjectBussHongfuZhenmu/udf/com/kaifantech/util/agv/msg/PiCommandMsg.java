package com.kaifantech.util.agv.msg;

import java.util.ArrayList;
import java.util.List;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.info.agv.AgvBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.util.agv.taskpath.DistanceStatus;

public class PiCommandMsg {
	private DistanceStatus distanceStatus;

	private List<HongfuAgvMsgBean> safeMsgs = new ArrayList<>();

	private List<HongfuAgvMsgBean> dangerMsgs = new ArrayList<>();

	private List<Integer> safeIds = new ArrayList<>();

	private List<Integer> dangerIds = new ArrayList<>();

	private String piInfo;

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

	public List<Integer> getSafeIds() {
		return safeIds;
	}

	public List<Integer> getDangerIds() {
		return dangerIds;
	}

	public PiCommandMsg dangerous(HongfuAgvMsgBean msgOne) {
		if (!AppTool.isNull(msgOne)) {
			getDangerMsgs().add(msgOne);
		}
		return this;
	}

	public PiCommandMsg safe(HongfuAgvMsgBean msgOne) {
		if (!AppTool.isNull(msgOne)) {
			getSafeMsgs().add(msgOne);
		}
		return this;
	}

	public PiCommandMsg dangerous(Integer one) {
		if (!AppTool.isNull(one)) {
			getDangerIds().add(one);
		}
		return this;
	}

	public PiCommandMsg safe(Integer one) {
		if (!AppTool.isNull(one)) {
			getSafeIds().add(one);
		}
		return this;
	}

	public PiCommandMsg dangerous(AgvBean one) {
		return dangerous(one.getId());
	}

	public PiCommandMsg safe(AgvBean one) {
		return safe(one.getId());
	}

	public String getPiInfo() {
		return piInfo;
	}

	public void setPiInfo(String piInfo) {
		this.piInfo = piInfo;
	}

}
