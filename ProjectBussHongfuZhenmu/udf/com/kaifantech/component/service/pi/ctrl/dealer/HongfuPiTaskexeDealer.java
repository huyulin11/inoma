package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.Collections;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.agv.msg.PiCommand;

@Component
public class HongfuPiTaskexeDealer {
	private static String CURRENT = "CURRENT";
	private static String NEXT = "NEXT";

	public PiCommand check2Agvs(HongfuTaskexeBean aa, HongfuTaskexeBean bb) {
		PiCommand command = new PiCommand();

		double maxOne = Math.max(Collections.max(aa.nextYaxisList), aa.currentYaxis);
		double minOne = Math.min(Collections.min(aa.nextYaxisList), aa.currentYaxis);
		double maxAnother = Math.max(Collections.max(bb.nextYaxisList), bb.currentYaxis);
		double minAnother = Math.min(Collections.min(bb.nextYaxisList), bb.currentYaxis);

		if (maxOne < minAnother - SystemConfParameters.detaJudgeSite()) {
			command.setInfo("路径计算无重叠！");
			return command.s(aa).s(bb);
		}
		if (maxAnother < minOne - SystemConfParameters.detaJudgeSite()) {
			command.setInfo("路径计算无重叠！");
			return command.s(aa).s(bb);
		}
		return calculate(aa, bb);
	}

	private PiCommand calculate(HongfuTaskexeBean aa, HongfuTaskexeBean bb) {
		PiCommand command = new PiCommand();
		int i = 1;
		if (bb.currentYaxis < aa.currentYaxis) {
			i = -1;
		}
		double currentA = i * aa.currentYaxis, currentB = i * bb.currentYaxis;
		double nextA = i * aa.nextYaxis, nextB = i * bb.nextYaxis;

		if (AppTool.inOrder(currentA, currentB, nextA, nextB)) {
			command.setInfo(model(aa, CURRENT, bb, CURRENT, aa, NEXT, bb, NEXT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return command.d(aa).s(bb);
			}
			return null;
		}

		if (AppTool.inOrder(currentA, currentB, nextB, nextA)) {
			command.setInfo(model(aa, CURRENT, bb, CURRENT, bb, NEXT, aa, NEXT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return command.d(aa).s(bb);
			}
			return null;
		}

		if (AppTool.inOrder(currentA, nextA, currentB, nextB)) {
			command.setInfo(model(aa, CURRENT, aa, NEXT, bb, CURRENT, bb, NEXT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return command.d(aa).s(bb);
			}
			return command.s(aa).s(bb);
		}

		if (AppTool.inOrder(currentA, nextA, nextB, currentB)) {
			command.setInfo(model(aa, CURRENT, aa, NEXT, bb, NEXT, bb, CURRENT));
			if (nextB - nextA <= SystemConfParameters.distanceTarget()) {
				if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
					if (currentB - nextB >= nextA - currentA) {
						return command.d(bb).s(aa);
					} else {
						return command.d(aa).s(bb);
					}
				}
			}
			return command.s(aa).s(bb);
		}

		if (AppTool.inOrder(currentA, nextB, currentB, nextA)) {
			command.setInfo(model(aa, CURRENT, bb, NEXT, bb, CURRENT, aa, NEXT));
			if (nextB - currentA <= SystemConfParameters.distanceTarget()) {
				command.setInfo(aa + "距离" + bb + "下一目标站点位置过近，形成死锁！");
				return command.d(aa).d(bb);
			} else if (nextB - currentA <= SystemConfParameters.distanceWaiting()) {
				return command.d(aa).s(bb);
			}
			return command.s(aa).s(bb);
		}

		if (AppTool.inOrder(currentA, nextB, nextA, currentB)) {
			command.setInfo(model(aa, CURRENT, bb, NEXT, aa, NEXT, bb, CURRENT));
			if (nextB - currentA <= SystemConfParameters.distanceWaiting()
					|| currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				if (nextA - currentA <= currentB - nextB) {
					if (currentB - nextA <= SystemConfParameters.distanceTarget()) {
						command.setInfo(bb + "距离" + aa + "下一目标站点位置过近，形成死锁！");
						return command.d(aa).d(bb);
					}
					return command.s(aa).d(bb);
				} else {
					if (nextB - currentA <= SystemConfParameters.distanceTarget()) {
						command.setInfo(aa + "距离" + bb + "下一目标站点位置过近，形成死锁！");
						return command.d(aa).d(bb);
					}
					return command.d(aa).s(bb);
				}
			}
			return command.s(aa).s(bb);
		}

		if (AppTool.inOrder(nextA, currentA, currentB, nextB)) {
			command.setInfo(model(aa, NEXT, aa, CURRENT, bb, CURRENT, bb, NEXT));
			return command.s(aa).s(bb);
		}

		if (AppTool.inOrder(nextA, currentA, nextB, currentB)) {
			command.setInfo(model(aa, NEXT, aa, CURRENT, bb, NEXT, bb, CURRENT));
			if (nextB - nextA <= SystemConfParameters.distanceTarget()) {
				if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
					return command.s(aa).d(bb);
				}
			}
			return command.s(aa).s(bb);
		}

		if (AppTool.inOrder(nextA, nextB, currentA, currentB)) {
			command.setInfo(model(aa, NEXT, bb, NEXT, aa, CURRENT, bb, CURRENT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return command.d(aa).s(bb);
			}
			return command.s(aa).d(bb);
		}

		if (AppTool.inOrder(nextB, currentA, currentB, nextA)) {
			command.setInfo(model(bb, NEXT, aa, CURRENT, bb, CURRENT, aa, NEXT));
			return command.d(aa).d(bb);
		}

		if (AppTool.inOrder(nextB, currentA, nextA, currentB)) {
			command.setInfo(model(bb, NEXT, aa, CURRENT, aa, NEXT, bb, CURRENT));
			if (currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				return command.s(aa).d(bb);
			}
			return command.s(aa).d(bb);
		}

		if (AppTool.inOrder(nextB, nextA, currentA, currentB)) {
			command.setInfo(model(bb, NEXT, aa, NEXT, aa, CURRENT, bb, CURRENT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return command.s(aa).d(bb);
			}
			return null;
		}

		return null;
	}

	private String model(Object... objs) {
		StringBuffer sb = new StringBuffer();
		for (Object obj : objs) {
			if (obj instanceof HongfuTaskexeBean) {
				sb.append(((HongfuTaskexeBean) obj).getAgvId());
			} else {
				sb.append(obj + "_");
			}
		}
		return sb.toString();
	}
}
