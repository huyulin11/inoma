package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.util.agv.msg.PiCommandId;

@Component
public class HongfuPiCtrlDealer implements IPiCtrlDealer {
	@Autowired
	private HongfuPiTaskexeDealer piTaskexeDealer;

	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	@Autowired
	private HongfuPiInfoService piInfoService;

	public PiCommandId check2Agvs(IotClientBean agvOne, IotClientBean agvAnother) throws Exception {
		HongfuTaskexeBean one = piInfoService.get(agvOne.getId()), another = piInfoService.get(agvAnother.getId());
		if (AppTool.isAnyNull(one, another)) {
			return null;
		}

		List<TaskexeDetailBean> taskexeDetailListOne = taskexeDetailService.find(one),
				taskexeDetailListAnother = taskexeDetailService.find(another);
		if (AppTool.isAnyNull(taskexeDetailListOne, taskexeDetailListAnother)) {
			return null;
		}
		return piTaskexeDealer.check2Agvs(one, another);
	}

}
