package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.util.agv.msg.PiCommandId;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;

@Component
public class HongfuPiCtrlDealer implements IPiCtrlDealer {
	@Autowired
	private HongfuPiTaskexeDealer piTaskexeDealer;

	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	public PiCommandId check2Agvs(IotClientBean agvOne, IotClientBean agvAnother) throws Exception {
		TaskexeBean one = taskexeInfoService.getNextOne(agvOne.getId()),
				another = taskexeInfoService.getNextOne(agvAnother.getId());
		if (AppTool.isAnyNull(one, another)) {
			return null;
		}
		HongfuAgvMsgBean msgOne = HongfuAgvMsgGetter.getBean(one.getAgvId()),
				msgAnother = HongfuAgvMsgGetter.getBean(another.getAgvId());
		if (AppTool.isAnyNull(msgOne, msgAnother) || AppTool.isAnyNull(msgOne.getAgvId(), msgAnother.getAgvId())) {
			return null;
		}
		if (AppTool.isAnyNull(msgOne.getX(), msgOne.getY(), msgAnother.getX(), msgAnother.getY())) {
			return null;
		}
		List<TaskexeDetailBean> taskexeDetailListOne = taskexeDetailService.find(one),
				taskexeDetailListAnother = taskexeDetailService.find(another);
		if (AppTool.isAnyNull(taskexeDetailListOne, taskexeDetailListAnother)) {
			return null;
		}
		return piTaskexeDealer.check2Agvs(one, another, msgOne, msgAnother, taskexeDetailListOne,
				taskexeDetailListAnother);
	}

}
