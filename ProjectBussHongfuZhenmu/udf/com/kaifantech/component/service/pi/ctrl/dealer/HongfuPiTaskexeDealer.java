package com.kaifantech.component.service.pi.ctrl.dealer;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;

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
		String nextAreaAa = aa.nextArea, nextAreaBb = bb.nextArea;
		if ("B".equals(currentAreaAa) && AppTool.equals(currentAreaBb, "C", "D")) {
			if (TaskexeOpFlag.SEND.equals(aa.getOpflag())) {
				command.setInfo("B区车等待CD区域车");
				return command.d(aa).s(bb);
			}
		}
		if ("B".equals(currentAreaBb) && AppTool.equals(currentAreaAa, "C", "D")) {
			if (TaskexeOpFlag.SEND.equals(bb.getOpflag())) {
				command.setInfo("B区车等待CD区域车");
				return command.d(bb).s(aa);
			}
		}
		if ("B".equals(currentAreaAa) && AppTool.equals(nextAreaBb, "C")) {
			command.setInfo("B区车等待CD区域车");
			return command.d(aa).s(bb);
		}
		if ("B".equals(currentAreaBb) && AppTool.equals(nextAreaAa, "C")) {
			command.setInfo("B区车等待CD区域车");
			return command.d(bb).s(aa);
		}

		return null;
	}
}
