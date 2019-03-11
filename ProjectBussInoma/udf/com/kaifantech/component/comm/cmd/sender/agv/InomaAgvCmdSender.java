package com.kaifantech.component.comm.cmd.sender.agv;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.msg.fancy.agv.FancyAgvCmdBean;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.log.AgvStatusDBLogger;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constants.cmd.FancyAgvCmdConstant;
import com.kaifantech.util.log.AppFileLogger;
import com.ytgrading.util.msg.AppMsg;

@Service
public class InomaAgvCmdSender implements IAgvCmdSender {
	@Autowired
	private AgvStatusDBLogger dbLogger;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_CLIENT_WORKER)
	private IConnectWorker agvClientMgr;

	public synchronized AppMsg send(Integer agvId, String... cmds) {
		String finalCmd = FancyAgvCmdBean.getTaskCmd(agvId, cmds);
		String cmd = String.join("", cmds).toUpperCase();
		try {
			AppMsg appMsg = agvClientMgr.get(agvId).sendCmd(finalCmd);
			if (appMsg.isSuccess()) {
				sysout(agvId, cmd);
				appMsg.setCode(0);
			}
			return appMsg;
		} catch (Exception e) {
			String msg = "发送指令（" + cmd + "）失败：" + e.getMessage();
			System.out.println(msg);
			return new AppMsg(-1, msg);
		}
	}

	private Map<Integer, String> lastCmdMap = new HashMap<>();

	private void sysout(Integer agvId, String cmd) {
		if (FancyAgvCmdConstant.CMD_GENERAL_SEARCH.equals(cmd)) {
			return;
		}
		String msg = "向" + agvId + "号AGV下达命令: " + cmd;
		if (FancyAgvCmdConstant.isCacheCmd(cmd)) {
			AppFileLogger.siteCacheInfo(msg);
			return;
		}
		if (FancyAgvCmdConstant.CMD_CONTINUE.equals(cmd)) {
			msg = msg + "-启动";
		} else if (FancyAgvCmdConstant.CMD_STOP.equals(cmd)) {
			msg = msg + "-停止";
		} else if (FancyAgvCmdConstant.CMD_OBSTACLE_CHANNEL_NORMAL.equals(cmd)) {
			msg = msg + "-切换长距离避障";
		} else if (FancyAgvCmdConstant.CMD_OBSTACLE_CHANNEL_CORNER.equals(cmd)) {
			msg = msg + "-切换短距离避障";
		} else if (cmd.startsWith(FancyAgvCmdConstant.CMD_SPEED)) {
			msg = msg + "-速度控制";
		} else if (FancyAgvCmdConstant.CMD_TURN_LEFT.equals(cmd)) {
			msg = msg + "-左转";
		} else if (FancyAgvCmdConstant.CMD_TURN_RIGHT.equals(cmd)) {
			msg = msg + "-右转";
		}
		lastCmdMap.put(agvId, cmd);
		dbLogger.warning(msg, agvId, AgvStatusDBLogger.MSG_LEVEL_WARNING);
	}

}
