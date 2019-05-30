package com.kaifantech.component.comm.manager.agv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaifantech.component.comm.cmd.sender.agv.IAgvCmdSender;
import com.calculatedfun.util.msg.AppMsg;

@Service
public class InomaAgvManager implements IAgvManager {
	@Autowired
	private IAgvCmdSender agvCmdSender;

	public AppMsg send(Integer agvId, String command) {
		return agvCmdSender.send(agvId, command);
	}

	@Override
	public AppMsg pause(int agvId) {
		return null;
	}

	@Override
	public AppMsg startup(int agvId, boolean isSwitchAspect) {
		return null;
	}

	@Override
	public AppMsg changeSpeed(int agvId, int speed) {
		return null;
	}

	@Override
	public AppMsg send(String cmd, Integer agvId) {
		return null;
	}

	@Override
	public AppMsg generalSearch(int agvId) {
		return null;
	}
}
