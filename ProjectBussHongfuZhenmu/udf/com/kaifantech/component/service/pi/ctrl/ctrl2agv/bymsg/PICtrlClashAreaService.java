package com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.info.agv.AGVBeanWithLocation;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.pi.ctrl.HongfuPiMsgService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.agv.msg.PiCommandId;
import com.kaifantech.util.constant.pi.detail.CLASH_AREA_INFO;
import com.kaifantech.util.constant.pi.detail.ClashArea;
import com.kaifantech.util.log.AppFileLogger;

@Component
public class PICtrlClashAreaService implements IPICtrlByMsgService {

	@Autowired
	private HongfuPiMsgService piMsgService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvDao;

	@Autowired
	PICtrlSameTargetService piCtrlSameTargetService;

	AGVBeanWithLocation agvOne;
	AGVBeanWithLocation agvAnother;

	private ClashArea clashArea = new ClashArea(CLASH_AREA_INFO.CLASH_AREA_1);

	public ClashArea getClashArea() {
		return clashArea;
	}

	public void setClashArea(ClashArea clashArea) {
		this.clashArea = clashArea;
	}

	public PiCommandId check(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother,
			MsgCompare<HongfuAgvMsgBean> compare) {
		PiCommandId command = new PiCommandId();
		if (msgOne.isInTheXArea(clashArea) && msgAnother.isInTheXArea(clashArea)) {

			agvOne = agvDao.getAGVBeanWithLocation(msgOne.getAgvId());
			agvAnother = agvDao.getAGVBeanWithLocation(msgAnother.getAgvId());

			boolean isOneCloseToArea = msgOne.isCloseToArea(clashArea);
			boolean isAnotherCloseToArea = msgAnother.isCloseToArea(clashArea);

			boolean isOneInTheArea = msgOne.isInTheArea(clashArea);
			boolean isAnotherInTheArea = msgAnother.isInTheArea(clashArea);

			if (isOneCloseToArea && agvOne.getNextXaxis() == agvAnother.getCurrentXaxis()
					&& agvAnother.getInCurrentXaxis() == 1
					&& agvOne.getNextLocation() == agvAnother.getCurrentLocation()) {
				command.dangerous(msgOne.getAgvId()).safe(msgAnother.getAgvId());
			}
			if (isAnotherCloseToArea && agvAnother.getNextXaxis() == agvOne.getCurrentXaxis()
					&& agvOne.getInCurrentXaxis() == 1 && agvAnother.getNextLocation() == agvOne.getCurrentLocation()) {
				command.dangerous(msgAnother.getAgvId()).safe(msgOne.getAgvId());
			}

			String info = "msgOne:" + msgOne.getAgvId() + "," + "msgAnother:" + msgAnother.getAgvId() + ","
					+ "isOneCloseToArea:" + isOneCloseToArea + "," + "isAnotherCloseToArea:" + isAnotherCloseToArea
					+ "," + "isOneInTheArea:" + isOneInTheArea + "," + "isAnotherInTheArea:" + isAnotherInTheArea;
			if ((isOneCloseToArea && isAnotherInTheArea) || (isAnotherCloseToArea && isOneInTheArea)) {
				AppFileLogger.piError("---危险---" + info);
				piMsgService.dangerInClashArea(msgOne, msgAnother,
						msgOne.isCloseToArea(clashArea) ? msgOne : msgAnother);
				return command.dangerous(msgOne.isCloseToArea(clashArea) ? msgOne.getAgvId() : msgAnother.getAgvId())
						.safe(!msgOne.isCloseToArea(clashArea) ? msgOne.getAgvId() : msgAnother.getAgvId());
			} else {
				if (command.getDangerIds().size() > 0) {
					piMsgService.dangerInClashAreaWhenSameTarger(
							!command.getDangerIds().contains(msgOne) ? msgOne : msgAnother,
							command.getDangerIds().contains(msgOne) ? msgOne : msgAnother);
					return command;
				}

				if (isOneCloseToArea && isAnotherCloseToArea) {
					double distanceOfOneToArea = msgOne.getDistanceToArea(clashArea);
					double distanceOfAnotherToArea = msgAnother.getDistanceToArea(clashArea);
					String s = "," + "distanceOfOneToArea:" + distanceOfOneToArea + "," + "distanceOfAnotherToArea:"
							+ distanceOfAnotherToArea;
					AppFileLogger.piError("---危险---" + info + s);
					piMsgService.dangerInClashArea(msgOne, msgAnother,
							distanceOfOneToArea > distanceOfAnotherToArea ? msgOne : msgAnother);
					return command
							.dangerous(distanceOfOneToArea > distanceOfAnotherToArea ? msgOne.getAgvId()
									: msgAnother.getAgvId())
							.safe(!(distanceOfOneToArea > distanceOfAnotherToArea) ? msgOne.getAgvId()
									: msgAnother.getAgvId());
				} else if (isOneInTheArea && isAnotherInTheArea) {
					AppFileLogger.piError("---同时处在易冲突区域，使用其它模式防止冲突---");
					return null;
				} else {
					AppFileLogger.piLogs("---安全---" + info);
					return null;
				}
			}
		}

		command = piCtrlSameTargetService.check(msgOne, msgAnother, compare);
		if (!AppTool.isNull(command)) {
			return command;
		}

		return null;
	}

}
