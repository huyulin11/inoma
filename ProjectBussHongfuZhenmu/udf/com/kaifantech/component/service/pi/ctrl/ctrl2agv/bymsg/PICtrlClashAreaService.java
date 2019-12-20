package com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.info.agv.AGVBeanWithLocation;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.pi.ctrl.msg.HongfuPiMsgService;
import com.kaifantech.init.sys.qualifier.DefaultQualifier;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.constant.pi.detail.CLASH_AREA_INFO;
import com.kaifantech.util.constant.pi.detail.ClashArea;
import com.kaifantech.util.log.AppFileLogger;

@Component
public class PICtrlClashAreaService implements IPICtrlByMsgService {

	@Autowired
	private HongfuPiMsgService piMsgService;

	@Autowired
	@Qualifier(DefaultQualifier.DEFAULT_AGV_INFO_DAO)
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

	public PiCommand check(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother, MsgCompare<HongfuAgvMsgBean> compare) {
		PiCommand command = new PiCommand();
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
				command.d(msgOne.getAgvId()).s(msgAnother.getAgvId());
			}
			if (isAnotherCloseToArea && agvAnother.getNextXaxis() == agvOne.getCurrentXaxis()
					&& agvOne.getInCurrentXaxis() == 1 && agvAnother.getNextLocation() == agvOne.getCurrentLocation()) {
				command.d(msgAnother.getAgvId()).s(msgOne.getAgvId());
			}

			String info = "msgOne:" + msgOne.getAgvId() + "," + "msgAnother:" + msgAnother.getAgvId() + ","
					+ "isOneCloseToArea:" + isOneCloseToArea + "," + "isAnotherCloseToArea:" + isAnotherCloseToArea
					+ "," + "isOneInTheArea:" + isOneInTheArea + "," + "isAnotherInTheArea:" + isAnotherInTheArea;
			if ((isOneCloseToArea && isAnotherInTheArea) || (isAnotherCloseToArea && isOneInTheArea)) {
				AppFileLogger.setPiTips(0, "---危险---", info);
				piMsgService.dangerInClashArea(msgOne, msgAnother,
						msgOne.isCloseToArea(clashArea) ? msgOne : msgAnother);
				return command.d(msgOne.isCloseToArea(clashArea) ? msgOne.getAgvId() : msgAnother.getAgvId())
						.s(!msgOne.isCloseToArea(clashArea) ? msgOne.getAgvId() : msgAnother.getAgvId());
			} else {
				if (command.getDangers().size() > 0) {
					piMsgService.dangerInClashAreaWhenSameTarger(
							!command.getDangers().contains(msgOne) ? msgOne : msgAnother,
							command.getDangers().contains(msgOne) ? msgOne : msgAnother);
					return command;
				}

				if (isOneCloseToArea && isAnotherCloseToArea) {
					double distanceOfOneToArea = msgOne.getDistanceToArea(clashArea);
					double distanceOfAnotherToArea = msgAnother.getDistanceToArea(clashArea);
					String s = "," + "distanceOfOneToArea:" + distanceOfOneToArea + "," + "distanceOfAnotherToArea:"
							+ distanceOfAnotherToArea;
					AppFileLogger.setPiTips(0, "---危险---", info, s);
					piMsgService.dangerInClashArea(msgOne, msgAnother,
							distanceOfOneToArea > distanceOfAnotherToArea ? msgOne : msgAnother);
					return command
							.d(distanceOfOneToArea > distanceOfAnotherToArea ? msgOne.getAgvId()
									: msgAnother.getAgvId())
							.s(!(distanceOfOneToArea > distanceOfAnotherToArea) ? msgOne.getAgvId()
									: msgAnother.getAgvId());
				} else if (isOneInTheArea && isAnotherInTheArea) {
					AppFileLogger.setPiTips(0, "---同时处在易冲突区域，使用其它模式防止冲突---");
					return null;
				} else {
					AppFileLogger.setPiTips(0, "---安全---" + info);
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
