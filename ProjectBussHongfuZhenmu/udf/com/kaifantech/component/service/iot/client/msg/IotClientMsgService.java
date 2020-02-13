package com.kaifantech.component.service.iot.client.msg;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.component.dao.acs.AgvMsgDao;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.init.sys.qualifier.UdfQualifier;

@Service
public class IotClientMsgService {
	private Map<Integer, IotClientLatestMsg> latestMsgMap = new HashMap<Integer, IotClientLatestMsg>();

	@Autowired
	private AgvMsgDao msgDao;

	@Autowired
	@Qualifier(UdfQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	public IotClientLatestMsg getLatestMsg(Integer agvId) {
		IotClientLatestMsg latestMsgObj = latestMsgMap.get(agvId);
		if (latestMsgObj == null) {
			latestMsgMap.put(agvId, new IotClientLatestMsg(new HongfuAgvMsgBean("")));
		}
		return latestMsgMap.get(agvId);
	}

	public void setLatestMsg() {
		for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
			new Runnable() {
				public void run() {
					getLatestMsgFromDB(agvBean.getId());
				}
			}.run();
		}
	}

	private void getLatestMsgFromDB(Integer agvId) {
		try {
			Map<String, Object> msgFromAGVF = msgDao.getLatestMsgFromDB(agvId);

			if (AppTool.isNull(msgFromAGVF)) {
				return;
			}
			Object sFromAGV = msgFromAGVF.get("msg");
			if (AppTool.isNull(msgFromAGVF)) {
				return;
			}

			Object agvObjectId = msgFromAGVF.get("agvId");
			if (AppTool.isNull(agvObjectId)) {
				return;
			}

			String latestMsgStr = "";
			if (!AppTool.isNull(sFromAGV)) {
				latestMsgStr = sFromAGV.toString().trim();
			} else {
				return;
			}

			String finishStatus = "";
			String taskid = "";
			String battery = "";
			String x = "";
			String y = "";
			String time = msgFromAGVF.get("time").toString();

			if (sFromAGV.toString().trim().indexOf("task_isfinished=") >= 0) {
				finishStatus = latestMsgStr.substring(
						latestMsgStr.indexOf("task_isfinished=") + "task_isfinished=".length(),
						latestMsgStr.indexOf("task_isfinished=") + "task_isfinished=".length() + 1);
			}
			if (sFromAGV.toString().trim().indexOf(";task=") >= 0) {
				for (int i = 0; i < 10; i++) {
					String c = latestMsgStr.substring(latestMsgStr.indexOf(";task=") + ";task=".length() + i,
							latestMsgStr.indexOf(";task=") + ";task=".length() + i + 1);
					if (Character.isDigit(c.charAt(0))) {
						taskid += c;
					} else {
						break;
					}
				}
			}
			if (sFromAGV.toString().trim().indexOf(";battery=") >= 0) {
				for (int i = 0; i < 10; i++) {
					String c = latestMsgStr.substring(latestMsgStr.indexOf(";battery=") + ";battery=".length() + i,
							latestMsgStr.indexOf(";battery=") + ";battery=".length() + i + 1);
					if (Character.isDigit(c.charAt(0)) || c.charAt(0) == '.') {
						battery += c;
					} else {
						break;
					}
				}
			}
			if (sFromAGV.toString().trim().indexOf(";x=") >= 0) {
				for (int i = 0; i < 10; i++) {
					String c = latestMsgStr.substring(latestMsgStr.indexOf(";x=") + ";x=".length() + i,
							latestMsgStr.indexOf(";x=") + ";x=".length() + i + 1);
					if (Character.isDigit(c.charAt(0)) || c.charAt(0) == '.' || c.charAt(0) == '-') {
						x += c;
					} else {
						break;
					}
				}
			}
			if (sFromAGV.toString().trim().indexOf(";y=") >= 0) {
				for (int i = 0; i < 10; i++) {
					String c = latestMsgStr.substring(latestMsgStr.indexOf(";y=") + ";y=".length() + i,
							latestMsgStr.indexOf(";y=") + ";y=".length() + i + 1);
					if (Character.isDigit(c.charAt(0)) || c.charAt(0) == '.' || c.charAt(0) == '-') {
						y += c;
					} else {
						break;
					}
				}
			}

			HongfuAgvMsgBean latestMsg = new HongfuAgvMsgBean(latestMsgStr);
			latestMsg.setTaskid(taskid);
			latestMsg.setTaskIsfinished(finishStatus);
			latestMsg.setBattery(battery);
			latestMsg.setX(Integer.parseInt(x));
			latestMsg.setY(Integer.parseInt(y));
			latestMsg.setTime(time);

			IotClientLatestMsg latestMsgObj = latestMsgMap.get(agvObjectId);

			if (latestMsgObj == null) {
				latestMsgMap.put((Integer) agvObjectId, new IotClientLatestMsg(latestMsg));
			} else {
				latestMsgObj.setAGVMsg(latestMsg);
			}
		} catch (Exception e) {
			return;
		}
	}

}
