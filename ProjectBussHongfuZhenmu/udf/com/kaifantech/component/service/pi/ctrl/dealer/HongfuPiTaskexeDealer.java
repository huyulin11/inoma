package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.Collections;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.agv.msg.PiCommandId;

@Component
public class HongfuPiTaskexeDealer {
	public PiCommandId check2Agvs(HongfuTaskexeBean one, HongfuTaskexeBean two) {
		PiCommandId piCommandId = new PiCommandId();

		double maxOne = Math.max(Collections.max(one.nextYaxisList), one.currentYaxis);
		double minOne = Math.min(Collections.min(one.nextYaxisList), one.currentYaxis);
		double maxAnother = Math.max(Collections.max(two.nextYaxisList), two.currentYaxis);
		double minAnother = Math.min(Collections.min(two.nextYaxisList), two.currentYaxis);

		if (maxOne < minAnother - SystemConfParameters.detaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.s(one).s(two);
		}
		if (maxAnother < minOne - SystemConfParameters.detaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.s(one).s(two);
		}
		double currentOne = one.currentYaxis, currentTwo = two.currentYaxis;
		double nextOne = one.nextYaxis, nextTwo = two.nextYaxis;
		if (AppTool.inOrder(currentOne, currentTwo, nextOne, nextTwo)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(currentOne, currentTwo, nextTwo, nextOne)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(currentOne, nextOne, currentTwo, nextTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(currentOne, nextOne, nextTwo, currentTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(currentOne, nextTwo, currentTwo, nextOne)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(currentOne, nextTwo, nextOne, currentTwo)) {
			return piCommandId.d(one).s(two);
		}

		if (AppTool.inOrder(currentTwo, currentOne, nextOne, nextTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(currentTwo, currentOne, nextTwo, nextOne)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(currentTwo, nextOne, nextTwo, currentOne)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(currentTwo, nextOne, currentOne, nextTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(currentTwo, nextTwo, currentOne, nextOne)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(currentTwo, nextTwo, nextOne, currentOne)) {
			return piCommandId.s(one).d(two);
		}

		if (AppTool.inOrder(nextOne, currentOne, currentTwo, nextTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nextOne, currentOne, nextTwo, currentTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nextOne, currentTwo, currentOne, nextTwo)) {//
		} else if (AppTool.inOrder(nextOne, currentTwo, nextTwo, currentOne)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(nextOne, nextTwo, currentOne, currentTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(nextOne, nextTwo, currentTwo, currentOne)) {
			return piCommandId.d(one).s(two);
		}

		if (AppTool.inOrder(nextTwo, currentOne, currentTwo, nextOne)) {//
		} else if (AppTool.inOrder(nextTwo, currentOne, nextOne, currentTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(nextTwo, currentTwo, currentOne, nextOne)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nextTwo, currentTwo, nextOne, currentOne)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nextTwo, nextOne, currentOne, currentTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(nextTwo, nextOne, currentTwo, currentOne)) {
			return piCommandId.d(one).s(two);
		}

		return null;
	}
}
