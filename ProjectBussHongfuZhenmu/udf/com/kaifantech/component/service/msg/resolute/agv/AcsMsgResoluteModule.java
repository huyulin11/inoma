package com.kaifantech.component.service.msg.resolute.agv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.singletask.SingletaskGroupBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.business.msg.resolute.agv.IMsgResoluteModule;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.dao.singletask.SingletaskDao;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.log.AgvStatusDBLogger;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.lap.LapInfoService;
import com.kaifantech.component.service.msg.info.agv.IAgvMsgInfoModule;
import com.kaifantech.component.service.singletask.group.SingletaskGroupService;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.add.ITaskexeAddService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.taskexe.status.ITaskexeStatusService;
import com.kaifantech.init.sys.qualifier.AcsSystemQualifier;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.constant.taskexe.ctrl.AgvMoveStatus;
import com.kaifantech.util.constant.taskexe.ctrl.AgvTaskType;
import com.kaifantech.util.thread.ThreadTool;

@Service(AcsSystemQualifier.AGV_MSG_RESOLUTE_MODULE)
public class AcsMsgResoluteModule implements IMsgResoluteModule {

	@Autowired
	private TaskexeOpDao taskexeTaskDao;

	@Autowired
	private TaskexeInfoService taskInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_TASKEXE_ADD_SERVICE)
	private ITaskexeAddService taskexeService;

	@Autowired
	private ITaskexeStatusService taskexeStatusService;

	@Autowired
	private IAgvMsgInfoModule msgService;

	@Autowired
	private SingletaskDao singletaskDao;

	@Autowired
	private SingletaskGroupService singletaskGroupService;

	@Autowired
	private AgvStatusDBLogger dbLogger;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	private LapInfoService lapInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	@Transactional(propagation = Propagation.REQUIRED)
	public void resoluteMsg() {
		for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
			TaskexeBean latestTaskexe = taskInfoService.getNotOverOneF(agvBean.getId());
			AppMsg msg = resoluteTaskexe(latestTaskexe);
			if (latestTaskexe != null) {
				if (!AppTool.isNull(msg)) {
					if (!AppTool.isNullStr(msg.getMsg())) {
						dbLogger.info(msg.getMsg(), latestTaskexe.getAgvId());
					}
				}
			}
			ThreadTool.sleep(500);
		}
	}

	public AppMsg resoluteTaskexe(TaskexeBean taskexeBean) {
		if (taskexeBean != null) {
			if (AgvMoveStatus.CONTINUE.equals(agvInfoDao.getMoveStatus(taskexeBean.getAgvId()))
					&& !TaskexeOpFlag.OVER.equals(taskexeBean.getOpflag())) {
				SingletaskBean singletaskBean = singleTaskInfoService.get(taskexeBean.getJsonItem("taskid"));
				if (!AgvTaskType.ZUHE_RENWU.equals(singletaskBean.getTasktype())) {
					AppMsg msg = resoluteGroupTask(taskexeBean);
					if (msg.getCode() < 0) {
						return msg;
					}
				} else {
					AppMsg msg = resoluteTask(taskexeBean, singletaskBean);
					if (msg.getCode() < 0) {
						return msg;
					}
				}
				return new AppMsg(0, "当前AGV任务执行结束！");
			}
		}
		return new AppMsg(0, "");
	}

	private AppMsg resoluteTask(TaskexeBean latestTaskexe, Object obj) {
		SingletaskBean singletaskBean = (SingletaskBean) obj;
		if (issend(singletaskBean)) {
			if (!TaskexeOpFlag.SEND.equals(latestTaskexe.getOpflag())) {
				return new AppMsg(-1, "任务尚未发送，不能解析！");
			}
			if (!msgService.getLatestMsgBean(latestTaskexe.getAgvId()).isSuccessDone(latestTaskexe)) {
				return new AppMsg(-1, "任务：" + singletaskBean.getTasktext() + "，尚未执行结束！");
			}
		}

		if (lapInfoService.getLapInUsed(latestTaskexe.getLapId())) {
			lapInfoService.setLapInUsed(latestTaskexe.getLapId(), false);
		}
		if (issend(singletaskBean)) {
			taskexeStatusService.changeStatusWhenOver(singletaskBean.getId());
			taskexeTaskDao.overASendTask(latestTaskexe.getUuid());
		} else {
			taskexeTaskDao.overANormalTask(latestTaskexe.getUuid());
		}
		dbLogger.warning(latestTaskexe.getAgvId() + "号AGV任务：" + singletaskBean.getTasktext() + "执行完毕！ ",
				latestTaskexe.getAgvId(), AgvStatusDBLogger.MSG_LEVEL_WARNING);
		return new AppMsg(0, "可以继续解析！");
	}

	private AppMsg resoluteGroupTask(TaskexeBean latestTaskexe) {
		List<TaskexeBean> latestTaskexeList = taskInfoService.getNewList();

		List<SingletaskBean> singletaskBeanList = null;
		String parentTaskid = "";
		for (TaskexeBean tmpTaskBean : latestTaskexeList) {
			List<SingletaskGroupBean> groupList = singletaskGroupService
					.getSingletaskGroupListByTask(tmpTaskBean.getTaskexesid());
			if (groupList != null && groupList.size() == 1) {
				parentTaskid = groupList.get(0).getParentTaskid();
				singletaskBeanList = singletaskDao.getSingletaskBeanListByGroup(parentTaskid);
			}
		}

		if (latestTaskexeList != null && latestTaskexeList.size() > 0) {
			if (singletaskBeanList != null && singletaskBeanList.size() > 0) {
				boolean flag = true;
				StringBuffer msgStr = new StringBuffer();
				msgStr.append("等待执行下列任务：");
				for (SingletaskBean tmpBean : singletaskBeanList) {
					if (!(latestTaskexeList.stream().filter((bean) -> bean.getTaskexesid().equals(tmpBean.getId()))
							.count() == 1)) {
						flag = false;
						msgStr.append(tmpBean.getTasktext() + ",");
					}
				}
				if (!flag) {
					return new AppMsg(-1, msgStr.append("执行完成后下达到AGV！").toString());
				}
				for (TaskexeBean tmpTaskBean : latestTaskexeList) {
					taskexeTaskDao.overANormalTask(tmpTaskBean.getUuid());
				}
				taskexeService.addTask(new TaskexeBean(parentTaskid, latestTaskexe.getAgvId(), 1));
			}
		}
		return new AppMsg(0, "可以继续解析！");
	}

	private boolean issend(SingletaskBean singletaskBean) {
		if (AppTool.isNull(singletaskBean)) {
			return false;
		} else {
			return singletaskBean.getIssend() == 1;
		}

	}
}
