package com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.agv.msg.PiCommandMsg;

@Component
public class PIRoadService implements IPICtrlByMsgService {
	@Autowired
	private PICtrlOtherService piCtrlOtherService;

	@Autowired
	PICtrlVericalService piCtrlVericalService;

	@Autowired
	PICtrlParallelService piCtrlParallelService;

	public PiCommandMsg check2AgvsByMsg(HongfuAgvMsgBean msgOne, HongfuAgvMsgBean msgAnother) {
		MsgCompare<HongfuAgvMsgBean> compare = new MsgCompare<HongfuAgvMsgBean>(msgOne, msgAnother);

		if (msgOne.isTaskfinished() || msgAnother.isTaskfinished()) {
			return this.warning(msgOne, msgAnother);
		}

		if (compare.isParallel()) {
			return piCtrlParallelService.checkWhenParallel(msgOne, msgAnother, compare);
		} else if (compare.isVertical()) {
			return piCtrlVericalService.checkWhenV(msgOne, msgAnother, compare);
		} else {
			return piCtrlOtherService.checkWhenOthers(msgOne, msgAnother, compare);
		}
	}

}
