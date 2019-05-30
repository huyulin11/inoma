package com.kaifantech.component.comm.cmd.sender.agv;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.log.AgvStatusDBLogger;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;

@Service
public class InomaAgvCmdSender implements IAgvCmdSender {
	@Autowired
	private AgvStatusDBLogger dbLogger;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_CLIENT_WORKER)
	private IConnectWorker agvClientMgr;

	public synchronized AppMsg send(Integer agvId, String... cmds) {
		String finalCmd = String.join("", cmds).toUpperCase();
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
		String msg = "向" + agvId + "号AGV下达命令: " + cmd;
		lastCmdMap.put(agvId, cmd);
		dbLogger.warning(msg, agvId, AgvStatusDBLogger.MSG_LEVEL_WARNING);
	}

}
