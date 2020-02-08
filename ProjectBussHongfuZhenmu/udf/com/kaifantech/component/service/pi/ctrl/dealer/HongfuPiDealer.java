package com.kaifantech.component.service.pi.ctrl.dealer;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.util.agv.msg.Direction;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.log.AppFileLogger;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;

@Component
public class HongfuPiDealer {
	public PiCommand check2Agvs(HongfuTaskexeBean aa, HongfuTaskexeBean bb) {
		return calculate(aa, bb);
	}

	private PiCommand calculate(HongfuTaskexeBean aa, HongfuTaskexeBean bb) {
		PiCommand command = new PiCommand();
		AppFileLogger.piLogs(aa, currentArea(aa), "-", direction(aa));
		AppFileLogger.piLogs(bb, currentArea(bb), "-", direction(bb));

		if (AppTool.equals(currentArea(aa), currentArea(bb))) {
			command.setInfo("两车同时在" + currentArea(aa) + "区内时同时停车！");
			return command.d(aa).d(bb);
		}

		command = calculateOneSide(aa, bb);
		if (!AppTool.isNull(command)) {
			return command;
		}
		command = calculateOneSide(bb, aa);
		if (!AppTool.isNull(command)) {
			return command;
		}

		return null;
	}

	private String currentArea(HongfuTaskexeBean o) {
		return o.currentArea;
	}

	private String nextArea(HongfuTaskexeBean o) {
		return o.nextArea;
	}

	private Direction direction(HongfuTaskexeBean o) {
		return HongfuAgvMsgGetter.getDirection(o.getAgvId());
	}

	private PiCommand calculateOneSide(HongfuTaskexeBean one, HongfuTaskexeBean two) {
		PiCommand command = new PiCommand();

		if ("B".equals(currentArea(one))) {
			if (AppTool.equals(currentArea(two), "C", "D")) {
				if (Direction.Y_POS.equals(direction(one))) {
					command.setInfo("B区车等待CD区域车");
					return command.d(one).s(two);
				}
				return null;
			}
			if (AppTool.equals(nextArea(two), "C")) {
				command.setInfo("B区车等待目标目标C区车");
				return command.d(one).s(two);
			}
		}

		if ("C".equals(currentArea(one))) {
			if (AppTool.equals(currentArea(two), "E", "D")) {
				if (Direction.Y_POS.equals(direction(one))) {
					command.setInfo("C区车等待DE区域车");
					return command.d(one).s(two);
				}
				return null;
			}
		}

		if ("E".equals(currentArea(one))) {
			if (AppTool.equals(currentArea(two), "D")) {
				if (Direction.Y_NEG.equals(direction(one))) {
					command.setInfo("E区车等待D区域车");
					return command.d(one).s(two);
				}
				return null;
			}
			if (AppTool.equals(currentArea(two), "C") && AppTool.equals(nextArea(two), "D")) {
				if (Direction.Y_POS.equals(direction(two)) && Direction.Y_NEG.equals(direction(one))) {
					command.setInfo("E区车等待目标D区域车");
					return command.d(one).s(two);
				}
				return null;
			}
		}

		return null;
	}
}
