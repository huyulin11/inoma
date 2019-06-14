package com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.component.service.pi.ctrl.msg.HongfuPiMsgService;
import com.kaifantech.component.service.pi.path.distance.Differ;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.agv.msg.Point;
import com.kaifantech.util.constant.pi.PICtrlConstant;
import com.kaifantech.util.constant.pi.detail.BASIC_INFO;
import com.kaifantech.util.constant.pi.detail.VERTICAL_1_CLOSE_1_FARAWAY;
import com.kaifantech.util.constant.pi.detail.VERTICAL_2_CLOSE;

@Component
public class PICtrlVericalService implements IPICtrlByMsgService {
	@Autowired
	private Differ differ;

	private boolean isClashModel = false;

	@Autowired
	private HongfuPiMsgService piMsgService;

	public PiCommand checkWhenV(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother,
			MsgCompare<HongfuAgvMsgBean> compare, boolean isClashModel) {
		this.isClashModel = isClashModel;
		PiCommand command = checkWhenV(msgOne, msgAnother, compare);
		isClashModel = false;
		return command;
	}

	public PiCommand checkWhenV(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother,
			MsgCompare<HongfuAgvMsgBean> compare) {
		Point croosPoint = compare.getCrossPoint();
		boolean isOneCloseToPoint = msgOne.isCloseTo(croosPoint);
		boolean isAnotherCloseToPoint = msgAnother.isCloseTo(croosPoint);
		double distanceOfOneToPoint = differ.diff(croosPoint, msgOne);
		double distanceOfAnotherToPoint = differ.diff(croosPoint, msgAnother);

		/** --------------------------------------垂直，两个都远离交叉点-------------------------------------- **/
		if (!isOneCloseToPoint && !isAnotherCloseToPoint) {
			return this.when2Faraway(msgOne, msgAnother, isOneCloseToPoint, isAnotherCloseToPoint, distanceOfOneToPoint,
					distanceOfAnotherToPoint);
		}

		/** --------------------------------------垂直，一个远离交叉点，另一靠近-------------------------------------- **/
		if (!isOneCloseToPoint == isAnotherCloseToPoint) {
			return when1Faraway1Close(msgOne, msgAnother, compare, isOneCloseToPoint, isAnotherCloseToPoint,
					distanceOfOneToPoint, distanceOfAnotherToPoint);
		}

		/** --------------------------------------垂直，两个都靠近交叉点-------------------------------------- **/
		if (isOneCloseToPoint && isAnotherCloseToPoint) {
			return when2Close(msgOne, msgAnother, compare, isOneCloseToPoint, isAnotherCloseToPoint,
					distanceOfOneToPoint, distanceOfAnotherToPoint);
		}

		return null;
	}

	private PiCommand when2Faraway(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother, boolean isOneCloseToPoint,
			boolean isAnotherCloseToPoint, double distanceOfOneToPoint, double distanceOfAnotherToPoint) {
		return this.safe(msgOne, msgAnother);
	}

	private PiCommand when1Faraway1Close(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother,
			MsgCompare<HongfuAgvMsgBean> compare, boolean isOneCloseToPoint, boolean isAnotherCloseToPoint,
			double distanceOfOneToPoint, double distanceOfAnotherToPoint) {
		HongfuAgvMsgBean closeBean = isOneCloseToPoint ? msgOne : msgAnother;
		HongfuAgvMsgBean farawayBean = !isOneCloseToPoint ? msgOne : msgAnother;

		double distanceOfCloseOneToPoint = isOneCloseToPoint ? distanceOfOneToPoint : distanceOfAnotherToPoint;
		double distanceOfFarawayOneToPoint = !isOneCloseToPoint ? distanceOfOneToPoint : distanceOfAnotherToPoint;
		if ((distanceOfFarawayOneToPoint < VERTICAL_1_CLOSE_1_FARAWAY.DISTANCE_DANGEROUS_FARAWAY
				+ BASIC_INFO.addedDistance(closeBean.getSpeed())
				+ (farawayBean.inSameDirectionWithFD() ? 0 : -BASIC_INFO.FORKLIFT_LENGTH / 2))
				&& distanceOfCloseOneToPoint < VERTICAL_1_CLOSE_1_FARAWAY.DISTANCE_DANGEROUS_CLOSE) {
			piMsgService.danger(msgOne, msgAnother, PICtrlConstant.VERTICAL,
					(isClashModel ? PICtrlConstant.MAINCTRL : PICtrlConstant.VERTICAL),
					"垂直行驶，" + farawayBean.getAgvId() + "车远离交叉点,距离" + distanceOfFarawayOneToPoint + "，"
							+ closeBean.getAgvId() + "车靠近交叉点" + "，停靠近交叉点车辆：" + closeBean.getAgvId());
			return this.dangerous(closeBean, null).safe(farawayBean);
		} else {
			return this.safe(closeBean, farawayBean);
		}
	}

	private PiCommand when2Close(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother,
			MsgCompare<HongfuAgvMsgBean> compare, boolean isOneCloseToPoint, boolean isAnotherCloseToPoint,
			double distanceOfOneToPoint, double distanceOfAnotherToPoint) {
		double distanceMsgOne = VERTICAL_2_CLOSE.DISTANCE_DANGEROUS + BASIC_INFO.addedDistance(msgOne.getSpeed());
		double distanceMsgAnother = VERTICAL_2_CLOSE.DISTANCE_DANGEROUS
				+ BASIC_INFO.addedDistance(msgAnother.getSpeed());

		if (distanceOfOneToPoint < distanceMsgOne && distanceOfAnotherToPoint < distanceMsgAnother) {
			piMsgService.danger(msgOne, msgAnother, PICtrlConstant.VERTICAL,
					(isClashModel ? PICtrlConstant.MAINCTRL : PICtrlConstant.VERTICAL),
					"垂直行驶，两车同时靠近交叉点" + msgOne.getAgvId() + "，距离交叉点均小于" + distanceMsgOne + "，车距离交叉点："
							+ distanceOfOneToPoint + "，" + msgAnother.getAgvId() + "车距离交叉点：" + distanceOfAnotherToPoint
							+ "，" + "，停远离交叉点车辆："
							+ (distanceOfOneToPoint > distanceOfAnotherToPoint ? msgOne : msgAnother).getAgvId());
			return this.dangerous(distanceOfOneToPoint > distanceOfAnotherToPoint ? msgOne : msgAnother, null)
					.safe(distanceOfOneToPoint > distanceOfAnotherToPoint ? msgAnother : msgOne);
		} else {
			return this.safe(msgOne, msgAnother);
		}
	}

}
