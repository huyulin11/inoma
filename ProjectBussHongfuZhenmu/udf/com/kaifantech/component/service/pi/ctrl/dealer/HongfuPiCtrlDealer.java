package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.msg.agv.TaskPathInfoPointBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.service.pi.ctrl.ctrl2agv.byangle.PICtrlService;
import com.kaifantech.component.service.pi.ctrl.msg.HongfuPiMsgService;
import com.kaifantech.component.service.pi.path.info.TaskPathInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.util.agv.msg.PiCommandId;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;

@Component
public class HongfuPiCtrlDealer implements IPiCtrlDealer {

	@Autowired
	private PICtrlService piCtrlService;

	@Autowired
	private HongfuPiMsgService piMsgService;

	@Autowired
	private TaskPathInfoService taskPathInfoService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	public PiCommandId check2Agvs(IotClientBean agvOne, IotClientBean agvAnother) {
		TaskexeBean one = taskexeInfoService.getNextOne(agvOne.getId()),
				another = taskexeInfoService.getNextOne(agvAnother.getId());
		if (AppTool.isAnyNull(one, another)) {
			return null;
		}
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

}
