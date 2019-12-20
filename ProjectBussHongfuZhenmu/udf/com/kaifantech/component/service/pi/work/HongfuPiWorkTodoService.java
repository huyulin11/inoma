package com.kaifantech.component.service.pi.work;

import java.util.List;

import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.component.service.taskexe.module.HongfuTaskexeModule;
import com.kaifantech.init.sys.qualifier.HongfuQualifier;
import com.kaifantech.util.log.AppFileLogger;

@Service(HongfuQualifier.PI_WORK_TODO_SERVICE)
public class HongfuPiWorkTodoService extends AcsPiWorkTodoService {
	public void doControl() {
		List<IotClientBean> agvs = iotClientService.getAgvCacheList();

		Integer errAgvId = HongfuTaskexeModule.anyOutOfInitPlaceWhenNoTask();
		if (!AppTool.isNull(errAgvId)) {
			for (IotClientBean agv : agvs) {
				piWorkDoneService.addToStop(agv.getId());
			}
			AppFileLogger.setPiTips(0, errAgvId, "号AGV无任务，且不处在正常的初始区域或充电，系统暂停所有AGV的运行！");
			return;
		}
		for (int i = 0; i < agvs.size(); i++) {
			IotClientBean one = agvs.get(i);
			for (int j = i + 1; j < agvs.size(); j++) {
				IotClientBean another = agvs.get(j);
				control2Agvs(one, another);
			}
		}
	}
}