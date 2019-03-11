package com.kaifantech.component.comm.manager.agv;

import org.springframework.stereotype.Service;

import com.kaifantech.bean.msg.fancy.agv.FancyAgvCacheCommand;
import com.kaifantech.bean.msg.fancy.agv.FancyAgvCmdBean;
import com.kaifantech.bean.msg.fancy.agv.FancyAgvCommand;
import com.kaifantech.bean.msg.fancy.agv.FancyAgvMsgBean;
import com.kaifantech.cache.manager.AppCacheManager;
import com.kaifantech.init.sys.params.CacheKeys;
import com.kaifantech.init.sys.params.FancyCacheKeys;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.constants.cmd.FancyAgvCmdConstant;
import com.kaifantech.util.hex.AppByteUtil;
import com.kaifantech.util.log.AppFileLogger;
import com.kaifantech.util.msg.agv.FancyAgvMsgGetter;
import com.kaifantech.util.thread.ThreadTool;
import com.ytgrading.util.AppTool;
import com.ytgrading.util.msg.AppMsg;

@Service
public interface IInomaAgvManager extends IAgvManager {
	default AppMsg sendNeedRtn(FancyAgvCommand command) {
		return sendNeedRtn(command, 0);
	}

	public AppMsg send(FancyAgvCommand command);

	default AppMsg cacheTask(FancyAgvCommand command) {
		return sendNeedRtn(command, 10);
	}

	default AppMsg cacheTask(FancyAgvCacheCommand command) {
		return sendNeedRtn(command, 10);
	}

	default AppMsg turnLeft(Integer agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_TURN_LEFT), 10);
	}

	default AppMsg hookUp(Integer agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_HOOK_UP), 10);
	}

	default AppMsg hookDown(Integer agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_HOOK_DOWN), 10);
	}

	default AppMsg turnRight(Integer agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_TURN_RIGHT), 10);
	}

	default AppMsg incaseofObstacleCorner(int agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_OBSTACLE_CHANNEL_CORNER), 10);
	}

	default AppMsg incaseofObstacleNormal(int agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_OBSTACLE_CHANNEL_NORMAL), 10);
	}

	default AppMsg cacheTask(Integer agvId, Integer tasksiteid, String... cmds) {
		return cacheTask(new FancyAgvCacheCommand(agvId, tasksiteid, cmds));
	}

	default AppMsg undoAllCache(int agvId) {
		AppCacheManager.getWorker().del(FancyCacheKeys.agvCmdCache(agvId));
		AppCacheManager.getWorker().del(FancyCacheKeys.agvMsgCache(agvId));
		return cacheTask(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_TASK_CLEAR_ALL_CACHE));
	}

	default AppMsg pause(int agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_STOP), 10);
	}

	default AppMsg startup(int agvId, boolean isSwitchAspect) {
		if (isSwitchAspect) {
			AppMsg appMsg = AppMsg.fail();
			FancyAgvMsgBean msg = FancyAgvMsgGetter.getAgvMsgBean(agvId);
			if (AppTool.isNull(msg) || !msg.isValid() || AppTool.isNull(msg.getAspect())) {
				return AppMsg.fail();
			}
			if (msg.getAspect().equals("1")) {
				appMsg = startupForward(agvId);
			} else {
				appMsg = startupReverse(agvId);
			}
			if (appMsg.isSuccess()) {
				return appMsg;
			} else {
				AppFileLogger.error(agvId + "号AGV换向失败！");
				return AppMsg.fail();
			}
		} else {
			return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_CONTINUE), 10);
		}
	}

	default AppMsg startupForward(int agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_CONTINUE_FORWARD), 10);
	}

	default AppMsg startupReverse(int agvId) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_CONTINUE_REVERSE), 10);
	}

	default AppMsg changeSpeed(int agvId, int speed) {
		return sendNeedRtn(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_SPEED, AppByteUtil.int2Str2(speed)), 10);
	}

	default AppMsg generalSearch(int agvId) {
		return send(new FancyAgvCommand(agvId, FancyAgvCmdConstant.CMD_GENERAL_SEARCH));
	}

	default AppMsg send(String cmd, Integer agvId) {
		String nextCmdIdStr = FancyAgvCmdBean.getnextCmdIdStr(agvId);
		AppCacheManager.getWorker().hset(CacheKeys.lastsendcmdid(), "" + agvId,
				"" + FancyAgvCmdBean.getNumId(nextCmdIdStr));
		String cmdgToSend = FancyAgvMsgBean.getAgvId(agvId) + nextCmdIdStr + cmd;
		return sendNeedRtn(new FancyAgvCommand(agvId, cmdgToSend));
	}

	default AppMsg sendNeedRtn(FancyAgvCommand command, int repeatTimes) {
		int times = 0;
		AppMsg appMsg = AppMsg.fail();
		while (true) {
			if (repeatTimes > 0 && times > repeatTimes) {
				return AppMsg.fail();
			}
			Integer agvId = command.getAgvId();
			appMsg = send(command);
			times++;
			if (!appMsg.isSuccess() || appMsg.getCode() < 0) {
				return appMsg;
			}
			FancyAgvCmdBean agvCmdBean = new FancyAgvCmdBean(appMsg.getMsg());
			ThreadTool.sleep(SystemConfParameters.getAgvJudgedTimesInteval());
			Integer msgId = agvCmdBean.getNumId();
			String rtnMsg = AppCacheManager.getWorker().get(FancyCacheKeys.agvMsgList(agvId, msgId), "" + msgId);
			if (!AppTool.isNull(rtnMsg)) {
				appMsg.setSuccess(true);
				break;
			} else {
				if (times >= 3) {
					AppFileLogger.error(agvId + "号AGV未收到发送指令的返回消息，" + "稍后" + "重试," + "重试次数：" + times + "！" + "CMDID:"
							+ agvCmdBean.getMsgID() + ";SITEID:" + agvCmdBean.getSiteId() + ";SENDMSG:" + appMsg + ";");
				}
			}
		}
		return appMsg;
	}

}
