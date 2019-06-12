package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.stereotype.Component;

import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.util.agv.msg.PiCommandId;

@Component
public class HongfuPiTaskexeDealer {
	public PiCommandId check2Agvs(TaskexeBean one, TaskexeBean another, HongfuAgvMsgBean msgOne,
			HongfuAgvMsgBean msgAnother, List<TaskexeDetailBean> taskexeDetailListOne,
			List<TaskexeDetailBean> taskexeDetailListAnother) {
		return null;
	}
}
