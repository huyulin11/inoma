package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.ArrayList;
import java.util.List;

public class PiLine {
	private Double start, end;

	PiLine(Double start, Double end) {
		this.start = start;
		this.end = end;
	}

	public boolean equals(Object b) {
		if (b instanceof PiLine) {
			PiLine bb = (PiLine) b;
			if (bb.start == start && bb.end == end) {
				return true;
			}
			if (bb.start == end && bb.end == start) {
				return true;
			}
		}
		return false;
	}

	public static List<PiLine> toLines(List<Double> points) {
		List<PiLine> piLines = new ArrayList<>();
		for (int i = 0; i < points.size() - 1; i++) {
			piLines.add(new PiLine(points.get(i), points.get(i + 1)));
		}
		return piLines;
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
