package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.msg.agv.TaskPathInfoPointBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.service.agv.road.VerticalRoad;
import com.kaifantech.component.service.agv.road.VerticalRoadService;
import com.kaifantech.component.service.pi.ctrl.ctrl2agv.byangle.PICtrlService;
import com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg.PICtrlClashAreaService;
import com.kaifantech.component.service.pi.ctrl.msg.HongfuPiMsgService;
import com.kaifantech.component.service.pi.path.info.TaskPathInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.util.agv.msg.PiCommandId;
import com.kaifantech.util.constant.pi.detail.CLASH_AREA_INFO;
import com.kaifantech.util.constant.pi.detail.ClashArea;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;

public class HongfuPiCtrlDealerBak implements IFancyPiCtrlDealer {

	@Autowired
	private PICtrlService piCtrlService;

	@Autowired
	private HongfuPiMsgService piMsgService;

	@Autowired
	private TaskPathInfoService taskPathInfoService;

	@Autowired
	private VerticalRoadService verticalRoadService;

	@Autowired
	private PICtrlClashAreaService piCtrlClashAreaService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	public PiCommandId check2Agvs(IotClientBean agvOne, IotClientBean agvAnother) {
		TaskexeBean one = taskexeInfoService.getNextOne(agvOne.getId()),
				another = taskexeInfoService.getNextOne(agvAnother.getId());
		if (AppTool.isAnyNull(one, another)) {
			return null;
		}

		clashArea(one);
		clashArea(another);

		HongfuAgvMsgBean msgOne = HongfuAgvMsgGetter.getBean(one.getAgvId());
		HongfuAgvMsgBean msgAnother = HongfuAgvMsgGetter.getBean(another.getAgvId());
		if (AppTool.isAnyNull(msgOne, msgAnother) || AppTool.isAnyNull(msgOne.getAgvId(), msgAnother.getAgvId())) {
			return null;
		}
		if (AppTool.isAnyNull(msgOne.getX(), msgOne.getY(), msgAnother.getX(), msgAnother.getY())) {
			return null;
		}

		List<TaskPathInfoPointBean> pathOne = null;
		List<TaskPathInfoPointBean> pathAnother = null;
		if (!AppTool.isNull(one)) {
			pathOne = taskPathInfoService.findPathInMap(one);
		}
		if (!AppTool.isNull(another)) {
			pathAnother = taskPathInfoService.findPathInMap(another);
		}

		if (!AppTool.isNull(one) || !AppTool.isNull(another)) {
			piMsgService.printMsg(msgOne, msgAnother, !AppTool.isNull(pathOne) || !AppTool.isNull(pathAnother),
					!AppTool.isNull(pathOne), !AppTool.isNull(pathAnother));
		}

		return piCtrlService.check2Agvs(pathOne, pathAnother, msgOne, msgAnother, one, another);
	}

	public void clashArea(TaskexeBean taskexeBean) {
		if (!AppTool.equals(taskexeBean.getTasktype(), AgvTaskType.RECEIPT, AgvTaskType.SHIPMENT)) {
			return;
		}

		boolean isNeedToImporveClashArea = false;
		ClashArea clashArea = new ClashArea(CLASH_AREA_INFO.CLASH_AREA_1);
		VerticalRoad road = verticalRoadService.getRoadOfAlloc(taskexeBean);
		int distanceToRightAxisOfArea = road.getXaxis() - CLASH_AREA_INFO.CLASH_AREA_1.getRightXaxis();
		int distanceToLeftAxisOfArea = CLASH_AREA_INFO.CLASH_AREA_1.getLeftXaxis() - road.getXaxis();
		if (distanceToRightAxisOfArea > 0 && distanceToRightAxisOfArea < CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA) {
			isNeedToImporveClashArea = true;
			clashArea.addRightXaxis(
					Math.min(CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA, distanceToRightAxisOfArea + 1000));
		} else if (distanceToLeftAxisOfArea > 0
				&& distanceToLeftAxisOfArea < CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA) {
			isNeedToImporveClashArea = true;
			clashArea.addLeftXaxis(
					Math.min(CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA, -distanceToLeftAxisOfArea - 1000));
		}
		if (!isNeedToImporveClashArea) {
			clashArea = new ClashArea(CLASH_AREA_INFO.CLASH_AREA_1);
		}
		piCtrlClashAreaService.setClashArea(clashArea);
	}
}
