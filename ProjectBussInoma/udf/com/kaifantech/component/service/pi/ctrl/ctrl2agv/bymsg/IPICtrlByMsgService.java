package com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg;

import org.springframework.stereotype.Component;

import com.kaifantech.bean.msg.agv.LaserAgvMsgBean;
import com.kaifantech.util.agv.msg.PiCommandMsg;
import com.kaifantech.util.agv.taskpath.DistanceStatus;
import com.calculatedfun.util.AppTool;

@Component
public interface IPICtrlByMsgService {

	public default PiCommandMsg dangerous(LaserAgvMsgBean msgOne) {
		PiCommandMsg command = new PiCommandMsg();
		command.setDistanceStatus(DistanceStatus.DANGEROUS);
		if (!AppTool.isNull(msgOne)) {
			command.getDangerMsgs().add(msgOne);
		}
		return command;
	}

	public default PiCommandMsg dangerous(LaserAgvMsgBean msgOne, LaserAgvMsgBean msgAnother) {
		PiCommandMsg command = new PiCommandMsg();
		command.setDistanceStatus(DistanceStatus.DANGEROUS);
		if (!AppTool.isNull(msgOne)) {
			command.getDangerMsgs().add(msgOne);
		}
		if (!AppTool.isNull(msgAnother)) {
			command.getDangerMsgs().add(msgAnother);
		}
		return command;
	}

	public default PiCommandMsg safe(LaserAgvMsgBean msgOne, LaserAgvMsgBean msgAnother) {
		PiCommandMsg command = new PiCommandMsg();
		command.setDistanceStatus(DistanceStatus.SAFE);
		if (!AppTool.isNull(msgOne)) {
			command.getSafeMsgs().add(msgOne);
		}
		if (!AppTool.isNull(msgAnother)) {
			command.getSafeMsgs().add(msgAnother);
		}
		return command;
	}

	public default PiCommandMsg warning(LaserAgvMsgBean msgOne, LaserAgvMsgBean msgAnother) {
		PiCommandMsg command = new PiCommandMsg();
		command.setDistanceStatus(DistanceStatus.WARNING);
		return command;
	}

}
