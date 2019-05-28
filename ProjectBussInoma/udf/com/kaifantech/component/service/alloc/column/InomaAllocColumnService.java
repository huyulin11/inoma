package com.kaifantech.component.service.alloc.column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.wms.alloc.AllocColumnInfoBean;
import com.kaifantech.bean.wms.alloc.AllocItemInfoBean;
import com.kaifantech.component.dao.alloc.AllocItemDao;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;

@Service
public class InomaAllocColumnService extends AllocColumnService {
	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	private AllocItemDao allocItemDao;

	@Override
	public AllocColumnInfoBean getBeanByTaskid(String taskid) {
		SingletaskBean singletaskOfOne = singleTaskInfoService.getSingletask(taskid);
		AllocItemInfoBean allocItemOfOne = allocItemDao.getAllocationInfoBean(singletaskOfOne.getAllocid());
		return getBeanBy(allocItemOfOne.getAreaId(), allocItemOfOne.getColId());
	}
}