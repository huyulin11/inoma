package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.Collections;

import org.springframework.stereotype.Component;

import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.agv.msg.PiCommandId;

@Component
public class HongfuPiTaskexeDealer {
	public PiCommandId check2Agvs(HongfuTaskexeBean one, HongfuTaskexeBean another) {
		PiCommandId piCommandId = new PiCommandId();

		double maxOne = Math.max(Collections.max(one.nextYaxisList), one.currentYaxis);
		double minOne = Math.min(Collections.min(one.nextYaxisList), one.currentYaxis);
		double maxAnother = Math.max(Collections.max(another.nextYaxisList), another.currentYaxis);
		double minAnother = Math.min(Collections.min(another.nextYaxisList), another.currentYaxis);

		if (maxOne < minAnother - SystemConfParameters.getDetaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.safe(one).safe(another);
		}
		if (maxAnother < minOne - SystemConfParameters.getDetaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.safe(one).safe(another);
		}
		if (one.currentYaxis <= another.currentYaxis && one.currentYaxis >= another.nextYaxis) {
			System.out.println("STOP " + another);
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
