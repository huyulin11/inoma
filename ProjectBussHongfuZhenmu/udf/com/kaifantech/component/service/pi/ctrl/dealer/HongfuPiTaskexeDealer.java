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

		if (maxOne < minAnother - SystemConfParameters.getDetaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.s(one).s(two);
		}
		if (maxAnother < minOne - SystemConfParameters.getDetaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.s(one).s(two);
		}
		double cOne = one.currentYaxis, cTwo = two.currentYaxis, nOne = one.nextYaxis, nTwo = two.nextYaxis;
		if (AppTool.inOrder(cOne, cTwo, nOne, nTwo)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(cOne, cTwo, nTwo, nOne)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(cOne, nOne, cTwo, nTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(cOne, nOne, nTwo, cTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(cOne, nTwo, cTwo, nOne)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(cOne, nTwo, nOne, cTwo)) {
			return piCommandId.d(one).s(two);
		} else/** 2 */
		if (AppTool.inOrder(cTwo, cOne, nOne, nTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(cTwo, cOne, nTwo, nOne)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(cTwo, nOne, nTwo, cOne)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(cTwo, nOne, cOne, nTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(cTwo, nTwo, cOne, nOne)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(cTwo, nTwo, nOne, cOne)) {
			return piCommandId.s(one).d(two);
		} else/** 3 */
		if (AppTool.inOrder(nOne, cOne, cTwo, nTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nOne, cOne, nTwo, cTwo)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nOne, cTwo, cOne, nTwo)) {//
		} else if (AppTool.inOrder(nOne, cTwo, nTwo, cOne)) {
			return piCommandId.d(one).s(two);
		} else if (AppTool.inOrder(nOne, nTwo, cOne, cTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(nOne, nTwo, cTwo, cOne)) {
			return piCommandId.d(one).s(two);
		} else/** 4 */
		if (AppTool.inOrder(nTwo, cOne, cTwo, nOne)) {//
		} else if (AppTool.inOrder(nTwo, cOne, nOne, cTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(nTwo, cTwo, cOne, nOne)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nTwo, cTwo, nOne, cOne)) {
			return piCommandId.s(one).s(two);
		} else if (AppTool.inOrder(nTwo, nOne, cOne, cTwo)) {
			return piCommandId.s(one).d(two);
		} else if (AppTool.inOrder(nTwo, nOne, cTwo, cOne)) {
			return piCommandId.d(one).s(two);
		}

		if (cOne < nOne) {
		}

		if (cOne <= cTwo && cOne >= nTwo) {
			System.out.println("STOP " + two);
		}
		return null;
	}

	// public void test() {
	// Set<Double> points = new HashSet<>();
	// points.addAll(one.nextYaxisList);
	// points.addAll(another.nextYaxisList);
	// points.add(one.currentYaxis);
	// points.add(another.currentYaxis);
	// List<Double> list = new ArrayList<>(points);
	// Collections.sort(list);
	// List<PiLine> piLines = PiLine.toLines(list);
	// }
}
