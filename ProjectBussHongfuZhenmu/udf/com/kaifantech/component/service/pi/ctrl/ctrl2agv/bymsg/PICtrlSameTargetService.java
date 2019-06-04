package com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kaifantech.bean.info.agv.AGVBeanWithLocation;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.component.service.pi.ctrl.HongfuPiMsgService;
import com.kaifantech.component.service.pi.path.distance.Differ;
import com.kaifantech.util.agv.msg.Location;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.agv.msg.PiCommandId;
import com.kaifantech.util.constant.pi.detail.BASIC_INFO;
import com.kaifantech.util.constant.pi.detail.CLASH_AREA_INFO;

@Component
public class PICtrlSameTargetService implements IPICtrlByMsgService {

	@Autowired
	private Differ differ;

	@Autowired
	private PICtrlSameTargetInitService piCtrlSameTargetInitService;

	@Autowired
	private HongfuPiMsgService piMsgService;

	public PiCommandId check(HongfuAgvMsgBean msgInCurrentXOne, HongfuAgvMsgBean msgAnotherOne,
			MsgCompare<HongfuAgvMsgBean> compare) {
		piCtrlSameTargetInitService.init(msgAnotherOne, msgInCurrentXOne);
		boolean isInTheWarning = piCtrlSameTargetInitService.isInTheWarningArea();
		boolean isInClash = piCtrlSameTargetInitService.isInTheClash();

		if (!isInTheWarning) {
			return null;
		}

		msgInCurrentXOne = piCtrlSameTargetInitService.getMsgInCurrentXOne();
		msgAnotherOne = piCtrlSameTargetInitService.getMsgAnother();
		AGVBeanWithLocation agvInCurrentXOne = piCtrlSameTargetInitService.getAGVInCurrentXOne();
		AGVBeanWithLocation agvAnother = piCtrlSameTargetInitService.getAGVAnother();

		if (isInTheWarning && !isInClash) {
			if ((differ.diffY(msgInCurrentXOne,
					BASIC_INFO.COORDINATE_Y_MAIN_ROAD_MIDDLE) < CLASH_AREA_INFO.DISTANCE_TO_MIDDLE_ROAD_SAFE_WHEN_IN_SAME_ROAD
					|| agvInCurrentXOne.getCurrentLocation() == agvAnother.getNextLocation())
					&& msgAnotherOne.isCloseYRoad(agvInCurrentXOne.getCurrentXaxis())) {
				piMsgService.dangerInSameTarget(msgInCurrentXOne, msgAnotherOne, msgAnotherOne);
				return this.dangerous(msgAnotherOne).safe(msgInCurrentXOne);
			} else {
				piMsgService.dangerInSameTarget(msgInCurrentXOne, msgAnotherOne, msgInCurrentXOne);
				return this.dangerous(msgInCurrentXOne).safe(msgAnotherOne);
			}
		}

		if (isInClash) {
			if (msgInCurrentXOne.getCurrentLoacation() != Location.OTHERS
					&& msgAnotherOne.getCurrentLoacation() != Location.OTHERS) {
				return this.safe(msgInCurrentXOne, msgAnotherOne);
			}
			if ((msgInCurrentXOne.getCurrentLoacation() != Location.OTHERS) != (msgAnotherOne
					.getCurrentLoacation() != Location.OTHERS)) {

				HongfuAgvMsgBean tempMsgNotInMiddleXOne = msgInCurrentXOne.getCurrentLoacation() == Location.OTHERS
						? msgAnotherOne : msgInCurrentXOne;
				HongfuAgvMsgBean tempMsgInMiddleOne = msgInCurrentXOne.getCurrentLoacation() != Location.OTHERS
						? msgAnotherOne : msgInCurrentXOne;
				if (tempMsgNotInMiddleXOne.isCloseToMainRoad()) {
					piMsgService.dangerInSameTarget(tempMsgNotInMiddleXOne, tempMsgInMiddleOne, tempMsgNotInMiddleXOne);
					return this.dangerous(tempMsgNotInMiddleXOne).safe(tempMsgInMiddleOne);
				}
			}

		}

		return null;
	}

}
