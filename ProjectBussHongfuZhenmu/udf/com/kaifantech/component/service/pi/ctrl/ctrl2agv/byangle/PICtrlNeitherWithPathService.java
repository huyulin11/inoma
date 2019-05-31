package com.kaifantech.component.service.pi.ctrl.ctrl2agv.byangle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kaifantech.bean.msg.agv.LaserAgvMsgBean;
import com.kaifantech.component.service.pi.path.distance.DistanceChecker;
import com.kaifantech.util.agv.msg.PiCommandMsg;
import com.kaifantech.util.agv.taskpath.DistanceStatus;

@Component
public class PICtrlNeitherWithPathService {

	@Autowired
	private DistanceChecker distanceChecker;

	public PiCommandMsg check2AgvsByMsg(LaserAgvMsgBean msgOne, LaserAgvMsgBean msgAnother) {
		PiCommandMsg command = new PiCommandMsg();
		if (distanceChecker.isDangerous(msgOne, msgAnother, false)) {
			command.setDistanceStatus(DistanceStatus.DANGEROUS);
			if ("0".equals(msgOne.getTaskIsfinished())) {
				command.getDangerMsgs().add(msgOne);
			}
			if ("0".equals(msgAnother.getTaskIsfinished())) {
				command.getDangerMsgs().add(msgAnother);
			}
			return command;
		} else if (distanceChecker.isTotallySafe(msgOne, msgAnother, false)) {
			command.setDistanceStatus(DistanceStatus.SAFE);
			command.getSafeMsgs().add(msgOne);
			command.getSafeMsgs().add(msgAnother);
			return command;
		} else {
			command.setDistanceStatus(DistanceStatus.WARNING);
			return command;
		}
	}

}