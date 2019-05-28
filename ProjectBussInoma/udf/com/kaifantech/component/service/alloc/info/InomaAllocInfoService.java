package com.kaifantech.component.service.alloc.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;

@Service
public class InomaAllocInfoService extends AllocInfoService {
	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Override
	public AllocItemInfoBean getByTaskid(String taskid) {
		SingletaskBean singletaskBean = singleTaskInfoService.getSingletask(taskid);
		if (singletaskBean == null) {
			return null;
		}
		return allocDao.getAllocationInfoBean(singletaskBean.getAllocid());
	}
}
