package com.kaifantech.component.service.pi.ctrl.dealer;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.cache.manager.AppCache;
import com.kaifantech.init.sys.params.CacheKeys;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.init.sys.params.SystemParameters;
import com.kaifantech.util.agv.msg.Direction;
import com.kaifantech.util.agv.msg.PiCommand;

@Component
public class HongfuPiTaskexeDealer {
	private static String CURRENT = "CURRENT";
	private static String NEXT = "NEXT";

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
		int i = 1;
		if (bb.currentYaxis < aa.currentYaxis) {
			i = -1;
		}
		double currentA = i * aa.currentYaxis, currentB = i * bb.currentYaxis;
		double nextA = i * aa.nextYaxis, nextB = i * bb.nextYaxis;

		Direction directionAa = aa.msg.getDirection(), directionBb = bb.msg.getDirection();

		boolean isAaLock = SystemParameters.flag(AppCache.worker().get(CacheKeys.ROAD_LOCKS, aa.getAgvId())),
				isBbLock = SystemParameters.flag(AppCache.worker().get(CacheKeys.ROAD_LOCKS, bb.getAgvId()));

		if (!isAaLock && directionAa.onXaxis() && !isBbLock && directionBb.onXaxis()) {
			HongfuTaskexeBean agv2 = aa.getAgvId().equals(2) ? aa : bb;
			HongfuTaskexeBean agv1 = aa.getAgvId().equals(2) ? bb : aa;
			return command.d(agv2).s(agv1);
		}

		if (!isAaLock && directionAa.onXaxis() || !isBbLock && directionBb.onXaxis()) {
			System.out.println("isAaLock:" + isAaLock + "," + "isBbLock:" + isBbLock);
		}

		if (AppTool.inOrder(currentA, currentB, nextA, nextB)) {
			command.setInfo(model(aa, CURRENT, bb, CURRENT, aa, NEXT, bb, NEXT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				return command.d(aa).s(bb);
			}
			return null;
		}

		if (AppTool.inOrder(currentA, currentB, nextB, nextA)) {
			command.setInfo(model(aa, CURRENT, bb, CURRENT, bb, NEXT, aa, NEXT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				return command.d(aa).s(bb);
			}
			return null;
		}

		if (AppTool.inOrder(currentA, nextA, currentB, nextB)) {
			command.setInfo(model(aa, CURRENT, aa, NEXT, bb, CURRENT, bb, NEXT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				return command.d(aa).s(bb);
			}
			command.setInfo("TOTAL SAFE 3!");
			return command.s(aa, bb);
		}

		if (AppTool.inOrder(currentA, nextA, nextB, currentB)) {
			command.setInfo(model(aa, CURRENT, aa, NEXT, bb, NEXT, bb, CURRENT));
			if (nextB - nextA <= SystemConfParameters.distanceTarget()) {
				if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
					if (!isBbLock && directionBb.onXaxis()) {
						return command.s(aa).d(bb);
					}
					if (!isAaLock && directionAa.onXaxis()) {
						return command.d(aa).s(bb);
					}
					if (currentB - nextB >= nextA - currentA) {
						return command.d(bb).s(aa);
					} else {
						return command.d(aa).s(bb);
					}
				}
			}
			command.setInfo("TOTAL SAFE 4!");
			return command.s(aa, bb);
		}

		if (AppTool.inOrder(currentA, nextB, currentB, nextA)) {
			command.setInfo(model(aa, CURRENT, bb, NEXT, bb, CURRENT, aa, NEXT));
			if (nextB - currentA <= SystemConfParameters.distanceTarget()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				command.setInfo(aa + "TO" + bb + "TOO CLOSE,DEADLOCK!");
				return command.d(aa, bb);
			} else if (nextB - currentA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				return command.d(aa).s(bb);
			}
			command.setInfo("TOTAL SAFE 5!");
			return command.s(aa, bb);
		}

		if (AppTool.inOrder(currentA, nextB, nextA, currentB)) {
			command.setInfo(model(aa, CURRENT, bb, NEXT, aa, NEXT, bb, CURRENT));
			if (nextB - currentA <= SystemConfParameters.distanceWaiting()
					|| currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				if (nextA - currentA <= currentB - nextB) {
					if (currentB - nextA <= SystemConfParameters.distanceTarget()) {
						command.setInfo(bb + "TO" + aa + "TOO CLOSE,DEADLOCK!");
						return command.d(aa, bb);
					}
					return command.s(aa).d(bb);
				} else {
					if (nextB - currentA <= SystemConfParameters.distanceTarget()) {
						command.setInfo(aa + "TO" + bb + "TOO CLOSE,DEADLOCK!");
						return command.d(aa, bb);
					}
					return command.d(aa).s(bb);
				}
			}
			command.setInfo("TOTAL SAFE 6!");
			return command.s(aa, bb);
		}

		if (AppTool.inOrder(nextA, currentA, currentB, nextB)) {
			command.setInfo(model(aa, NEXT, aa, CURRENT, bb, CURRENT, bb, NEXT));
			command.setInfo("TOTAL SAFE 7!");
			return command.s(aa, bb);
		}

		if (AppTool.inOrder(nextA, currentA, nextB, currentB)) {
			command.setInfo(model(aa, NEXT, aa, CURRENT, bb, NEXT, bb, CURRENT));
			if (nextB - nextA <= SystemConfParameters.distanceTarget()) {
				if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
					if (!isBbLock && directionBb.onXaxis()) {
						return command.s(aa).d(bb);
					}
					if (!isAaLock && directionAa.onXaxis()) {
						return command.d(aa).s(bb);
					}
					return command.s(aa).d(bb);
				}
			}
			command.setInfo("TOTAL SAFE 8!");
			return command.s(aa, bb);
		}

		if (AppTool.inOrder(nextA, nextB, currentA, currentB)) {
			command.setInfo(model(aa, NEXT, bb, NEXT, aa, CURRENT, bb, CURRENT));
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				return command.d(aa).s(bb);
			}
			return command.s(aa).d(bb);
		}

		if (AppTool.inOrder(nextB, currentA, currentB, nextA)) {
			command.setInfo(model(bb, NEXT, aa, CURRENT, bb, CURRENT, aa, NEXT));
			if (!isBbLock && directionBb.onXaxis()) {
				return command.s(aa).d(bb);
			}
			if (!isAaLock && directionAa.onXaxis()) {
				return command.d(aa).s(bb);
			}
			return command.d(aa, bb);
		}

		if (AppTool.inOrder(nextB, currentA, nextA, currentB)) {
			command.setInfo(model(bb, NEXT, aa, CURRENT, aa, NEXT, bb, CURRENT));
			if (currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				if (!isBbLock && directionBb.onXaxis()) {
					return command.s(aa).d(bb);
				}
				if (!isAaLock && directionAa.onXaxis()) {
					return command.d(aa).s(bb);
				}
				return command.s(aa).d(bb);
			}
			return command.s(aa).d(bb);
		}

		if (AppTool.inOrder(nextB, nextA, currentA, currentB)) {
			command.setInfo(model(bb, NEXT, aa, NEXT, aa, CURRENT, bb, CURRENT));
			if (AppTool.isNull(aa.nextYaxisList)
					|| aa.nextYaxisList.get(0) - currentB > SystemConfParameters.distanceTarget()) {
				if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
					if (!isBbLock && directionBb.onXaxis()) {
						return command.s(aa).d(bb);
					}
					if (!isAaLock && directionAa.onXaxis()) {
						return command.d(aa).s(bb);
					}
					return command.s(aa).d(bb);
				}
			}
			command.setInfo(aa + "BLOCK" + bb + ",STOP" + bb + "!");
			return command.s(aa).d(bb);
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
