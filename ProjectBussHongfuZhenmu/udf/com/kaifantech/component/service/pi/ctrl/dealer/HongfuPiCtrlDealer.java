package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppSetTool;
import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.log.AppFileLogger;

@Component
public class HongfuPiCtrlDealer implements IPiCtrlDealer {
	@Autowired
	private HongfuPiTaskexeDealer piTaskexeDealer;

	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	@Autowired
	private HongfuPiInfoService piInfoService;

	public PiCommand check2Agvs(IotClientBean agvOne, IotClientBean agvAnother) throws Exception {
		PiCommand command = new PiCommand();
		HongfuTaskexeBean one = piInfoService.get(agvOne.getId()), another = piInfoService.get(agvAnother.getId());
		if (AppTool.isAnyNull(one, another)) {
			command.s(agvOne, agvAnother);
			return command;
		}

		List<TaskexeDetailBean> taskexeDetailListOne = taskexeDetailService.find(one),
				taskexeDetailListAnother = taskexeDetailService.find(another);
		if (AppTool.isAnyNull(taskexeDetailListOne, taskexeDetailListAnother)) {
			return null;
		}
		command = piTaskexeDealer.check2Agvs(one, another);
		AppFileLogger.piError(
				"交管策略：" + "放行：" + AppSetTool.join(command.getSafes()) + "交管：" + AppSetTool.join(command.getDangers()));
		AppFileLogger.piError("附加信息：" + command.getInfo());
		return command;
	}

}
