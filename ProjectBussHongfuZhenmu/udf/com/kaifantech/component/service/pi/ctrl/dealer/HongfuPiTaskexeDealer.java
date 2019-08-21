package com.kaifantech.component.service.pi.ctrl.dealer;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.agv.msg.Direction;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.log.AppFileLogger;
import com.kaifantech.util.msg.agv.HongfuAgvMsgGetter;

@Component
public class HongfuPiTaskexeDealer {
	public PiCommand check2Agvs(HongfuTaskexeBean aa, HongfuTaskexeBean bb) {
		PiCommand command = new PiCommand();

		double maxOne = AppTool.max(aa.nextYaxisList, aa.currentYaxis, aa.nextYaxis);
		double minOne = AppTool.min(aa.nextYaxisList, aa.currentYaxis, aa.nextYaxis);
		double maxAnother = AppTool.max(bb.nextYaxisList, bb.currentYaxis, bb.nextYaxis);
		double minAnother = AppTool.min(bb.nextYaxisList, bb.currentYaxis, bb.nextYaxis);

		if (maxOne < minAnother - SystemConfParameters.detaJudgeSite()) {
			command.setInfo("TOTAL SAFE 1!");
			return command.s(aa, bb);
		}
		if (maxAnother < minOne - SystemConfParameters.detaJudgeSite()) {
			command.setInfo("TOTAL SAFE 2!");
			return command.s(aa, bb);
		}
		return calculate(aa, bb);
	}

	private PiCommand calculate(HongfuTaskexeBean aa, HongfuTaskexeBean bb) {
		PiCommand command = new PiCommand();
		String currentAreaAa = aa.currentArea, currentAreaBb = bb.currentArea;
		AppFileLogger.piLogs(aa, currentAreaAa, "-", HongfuAgvMsgGetter.getDirection(aa.getAgvId()));
		AppFileLogger.piLogs(bb, currentAreaBb, "-", HongfuAgvMsgGetter.getDirection(bb.getAgvId()));

		if (AppTool.equals(currentAreaAa, currentAreaBb)) {
			command.setInfo("两车同时在" + currentAreaAa + "区内时同时停车！");
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

	private PiCommand calculateOneSide(HongfuTaskexeBean one, HongfuTaskexeBean two) {
		PiCommand command = new PiCommand();

		String currentAreaOne = one.currentArea, currentAreaTwo = two.currentArea;
		String nextAreaTwo = two.nextArea;
		Direction directionOne = HongfuAgvMsgGetter.getDirection(one.getAgvId()),
				directionTwo = HongfuAgvMsgGetter.getDirection(two.getAgvId());

		// if ("A".equals(currentAreaOne)) {
		// if (AppTool.equals(currentAreaTwo, "B")) {
		// if (Direction.Y_POS.equals(directionOne)) {
		// command.setInfo("A区车等待B区域车");
		// return command.d(one).s(two);
		// }
		// return null;
		// }
		// if (AppTool.equals(nextAreaTwo, "B", "C")) {
		// command.setInfo("A区车等待目标目标BC区车");
		// return command.d(one).s(two);
		// }
		// }

		if ("B".equals(currentAreaOne)) {
			if (AppTool.equals(currentAreaTwo, "C", "D")) {
				if (Direction.Y_POS.equals(directionOne)) {
					command.setInfo("B区车等待CD区域车");
					return command.d(one).s(two);
				}
				return null;
			}
			if (AppTool.equals(nextAreaTwo, "C")) {
				command.setInfo("B区车等待目标目标C区车");
				return command.d(one).s(two);
			}
		}

		if ("C".equals(currentAreaOne)) {
			if (AppTool.equals(currentAreaTwo, "E", "D")) {
				if (Direction.Y_POS.equals(directionOne)) {
					command.setInfo("C区车等待DE区域车");
					return command.d(one).s(two);
				}
				return null;
			}
		}

		if ("E".equals(currentAreaOne)) {
			if (AppTool.equals(nextAreaTwo, "D")) {
				if (Direction.Y_POS.equals(directionTwo)) {
					command.setInfo("E区车等待目标D区域车");
					return command.d(one).s(two);
				}
				return null;
			}
		}

		return null;
	}
}
