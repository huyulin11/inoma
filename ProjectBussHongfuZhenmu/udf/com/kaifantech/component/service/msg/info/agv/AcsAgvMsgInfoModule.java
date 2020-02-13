package com.kaifantech.component.service.msg.info.agv;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBeanTransfer;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.dao.acs.AgvMsgDao;
import com.kaifantech.component.dao.ControlInfoDao;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.lap.LapAgvInfoService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.init.sys.params.AppAutoParameters;
import com.kaifantech.init.sys.qualifier.UdfQualifier;
import com.kaifantech.init.sys.qualifier.HongfuQualifier;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.socket.iot.client.RoboticArmMsgStr;
import com.kaifantech.util.thread.ThreadTool;

@Service(HongfuQualifier.AGV_MSG_INFO_MODULE)
public class AcsAgvMsgInfoModule implements IAgvMsgInfoModule {
	private Map<Integer, HongfuAgvMsgBean> latestMsgMap = new HashMap<>();

	@Autowired
	private AgvMsgDao msgDao;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	private LapAgvInfoService lapInfoService;

	@Autowired
	@Qualifier(UdfQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	private ControlInfoDao controlInfoDao;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	private Map<Integer, Deque<HongfuAgvMsgBean>> msgQueues = new HashMap<>();

	public HongfuAgvMsgBean getLatestMsgBean(Integer agvId) {
		HongfuAgvMsgBean latestMsgObj = latestMsgMap.get(agvId);
		if (latestMsgObj == null) {
			latestMsgMap.put(agvId, new HongfuAgvMsgBean(null));
		}
		HongfuAgvMsgBean msg = latestMsgMap.get(agvId);

		if (AppTool.isNull(msg) || AppTool.isNull(msg.getX()) || AppTool.isNull(msg.getY())) {
			return null;
		} else {
			return msg;
		}
	}

	public void setLatestMsg() {
		for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
			getLatestMsgFromMM(agvBean.getId());
		}
	}

	private static Map<Integer, Boolean> lightedMap = new HashMap<Integer, Boolean>();

	private void getLatestMsgFromMM(Integer agvId) {
		try {
			if (AppTool.isNull(agvId)) {
				return;
			}

			String sFromAGV = msgDao.getLatestMsg(agvId);

			HongfuAgvMsgBean agvMsgBean = latestMsgMap.get(agvId);
			agvMsgBean.setStr(sFromAGV);
			HongfuAgvMsgBean lastAGVMsgBean = null;
			Deque<HongfuAgvMsgBean> msgQueue = msgQueues.get(agvId);
			if (!AppTool.isNull(agvMsgBean)) {
				lastAGVMsgBean = (HongfuAgvMsgBean) agvMsgBean.clone();
				lastAGVMsgBean.setLast(null);
			}
			agvMsgBean = HongfuAgvMsgBeanTransfer.transToBean(agvId, sFromAGV);
			if (!AppTool.isNull(lastAGVMsgBean) && !AppTool.isNull(lastAGVMsgBean.getAgvId())) {
				if (AppTool.isNull(msgQueue)) {
					msgQueue = new ArrayDeque<>();
					msgQueues.put(agvId, msgQueue);
				}
				while (msgQueue.size() > 15) {
					msgQueue.removeLast();
				}
				if (msgQueue.size() == 0 || (msgQueue.size() > 0
						&& new MsgCompare<HongfuAgvMsgBean>(msgQueue.getFirst(), lastAGVMsgBean).getDistance() > 20)) {
					msgQueue.push(lastAGVMsgBean);
				}
			}
			agvMsgBean.setLast(msgQueue.size() > 0 ? msgQueue.getLast() : lastAGVMsgBean);
			agvMsgBean.calDirection();
			latestMsgMap.put(agvId, agvMsgBean);
			HongfuAgvMsgBean msg = latestMsgMap.get(agvId);
			msg.setTaskid(singleTaskInfoService.getByTaskName(msg.getTaskName()).getId());

			// ThreadTool.getThreadPool().execute(new Runnable() {
			// public void run() {
			// storeMsgToPath(msg);
			// }
			// });

			ThreadTool.getThreadPool().execute(new Runnable() {
				public void run() {
					if (!AppAutoParameters.isAutoTask()) {
						return;
					}
					TaskexeBean taskBean = taskexeInfoService.getNotOverOne(msg.getTaskid());
					if (AppTool.isNull(taskBean)) {
						return;
					}
					if (msg.getTaskStep() == controlInfoDao.getSayGoToRobaticArmStep()) {
						if (!isLighted(taskBean.getLapId())) {
							sayGoToRobaticArm(taskBean.getLapId());
						}
					} else {
						setLighted(taskBean.getLapId(), false);
					}
				}
			});

		} catch (Exception e) {
			return;
		}
	}

	public void sayGoToRobaticArm(Integer lapId) {
		String msgToRobotic = "";
		if (lapId.equals(1)) {
			msgToRobotic = RoboticArmMsgStr.O_OVER_FROM_LAP1;
		} else if (lapId.equals(2)) {
			msgToRobotic = RoboticArmMsgStr.O_OVER_FROM_LAP2;
		} else if (lapId.equals(3)) {
			msgToRobotic = RoboticArmMsgStr.O_OVER_FROM_LAP3;
		}

		lapInfoService.setLapInUsed(lapId, true);
	}

	private Boolean isLighted(Integer lapId) {
		Boolean lighted = lightedMap.get(lapId);
		if (AppTool.isNull(lighted)) {
			lighted = false;
			lightedMap.put(lapId, lighted);
		}
		return lighted;
	}

	private void setLighted(Integer lapId, Boolean flag) {
		lightedMap.put(lapId, flag);
	}

	// public void storeMsgToPath(AGVMsgBean msg) {
	// if ("0".equals(msg.getTaskIsfinished())) {
	// TaskexeBean latestTaskexe =
	// taskexeInfoService.getNotOverOne(msg.getTaskid());
	// if (Tool.isNull(latestTaskexe)) {
	// return;
	// }
	// if (TaskexeOpFlag.SEND.equals(latestTaskexe.getOpflag())) {
	// Long startMoveSecond = startMoveSecondMap.get(msg.getAGVId());
	// if (Tool.isNull(startMoveSecond) || startMoveSecond == 0) {
	// startMoveSecond = DateFactory.getCurrentUnixTime();
	// startMoveSecondMap.put(msg.getAGVId(), startMoveSecond);
	// }
	// if (!getLatestMsgBean(msg.getAGVId()).isAGVPause()) {
	// taskPathMemoryDao.addAPoint(msg, startMoveSecond);
	// }
	// }
	// } else if ("1".equals(msg.getTaskIsfinished())) {
	// Long startMoveSecond = startMoveSecondMap.get(msg.getAGVId());
	// if (!(Tool.isNull(startMoveSecond) || startMoveSecond == 0)) {
	// taskPathInfoOpService.transToInfo(msg.getAGVId(), msg.getTaskid());
	// startMoveSecondMap.put(msg.getAGVId(), (long) 0);
	// }
	// }
	// }
}
