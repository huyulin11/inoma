package com.kaifantech.component.service.buss.taskexe.auto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.taskexe.auto.IAutoTaskexeModule;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;

@Component
@Lazy(false)
public class HongfuAutoTaskexeModule implements IAutoTaskexeModule {
	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	public synchronized void doWork() {
		toCharge();
		toInit();
		toDeliver();
		toTransport();
	}

	private synchronized void toDeliver() {
	}

	private synchronized void toTransport() {
	}

	private synchronized void toCharge() {
	}

	private synchronized void toInit() {
	}

}
