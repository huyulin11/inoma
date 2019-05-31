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
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBeanTransfer;
import com.kaifantech.bean.msg.agv.LaserAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.dao.AgvMsgDao;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.init.sys.params.SystemAutoParameters;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.agv.msg.MsgCompare;
import com.kaifantech.util.thread.ThreadTool;

@Service(HongfuSystemQualifier.AGV_MSG_INFO_MODULE)
public class AcsAgvMsgInfoModule implements IAgvMsgInfoModule {
	private Map<Integer, LaserAgvMsgBean> latestMsgMap = new HashMap<>();

	@Autowired
	private AgvMsgDao msgDao;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	private Map<Integer, Deque<LaserAgvMsgBean>> msgQueues = new HashMap<>();

	public LaserAgvMsgBean getLatestMsgBean(Integer agvId) {
		LaserAgvMsgBean latestMsgObj = latestMsgMap.get(agvId);
		if (latestMsgObj == null) {
			latestMsgMap.put(agvId, new LaserAgvMsgBean());
		}
		LaserAgvMsgBean msg = latestMsgMap.get(agvId);

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

	private void getLatestMsgFromMM(Integer agvId) {
		try {
			if (AppTool.isNull(agvId)) {
				return;
			}

			String sFromAGV = msgDao.getLatestMsg(agvId);

			LaserAgvMsgBean agvMsgBean = latestMsgMap.get(agvId);
			LaserAgvMsgBean lastAGVMsgBean = null;
			Deque<LaserAgvMsgBean> msgQueue = msgQueues.get(agvId);
			if (!AppTool.isNull(agvMsgBean)) {
				lastAGVMsgBean = (LaserAgvMsgBean) agvMsgBean.clone();
				lastAGVMsgBean.setLast(null);
			}
			agvMsgBean = HongfuAgvMsgBeanTransfer.transToBean(agvId, sFromAGV, agvMsgBean);
			if (!AppTool.isNull(lastAGVMsgBean) && !AppTool.isNull(lastAGVMsgBean.getAGVId())) {
				if (AppTool.isNull(msgQueue)) {
					msgQueue = new ArrayDeque<>();
					msgQueues.put(agvId, msgQueue);
				}
				while (msgQueue.size() > 15) {
					msgQueue.removeLast();
				}
				if (msgQueue.size() == 0 || (msgQueue.size() > 0
						&& new MsgCompare<LaserAgvMsgBean>(msgQueue.getFirst(), lastAGVMsgBean).getDistance() > 20)) {
					msgQueue.push(lastAGVMsgBean);
				}
			}
			agvMsgBean.setLast(msgQueue.size() > 0 ? msgQueue.getLast() : lastAGVMsgBean);
			agvMsgBean.calDirection();
			latestMsgMap.put(agvId, agvMsgBean);
			LaserAgvMsgBean msg = latestMsgMap.get(agvId);
			msg.setTaskid(singleTaskInfoService.getSingletaskByTaskName(msg.getTaskName()).getId());

			// ThreadTool.getThreadPool().execute(new Runnable() {
			// public void run() {
			// storeMsgToPath(msg);
			// }
			// });

			ThreadTool.getThreadPool().execute(new Runnable() {
				public void run() {
					if (!SystemAutoParameters.isAutoTask()) {
						return;
					}
					TaskexeBean taskBean = taskexeInfoService.getNotOverOne(msg.getTaskid());
					if (AppTool.isNull(taskBean)) {
						return;
					}
				}
			});

		} catch (Exception e) {
			return;
		}
	}
}
