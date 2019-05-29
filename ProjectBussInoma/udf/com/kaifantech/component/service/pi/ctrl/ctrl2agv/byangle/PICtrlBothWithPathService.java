package com.kaifantech.component.service.pi.ctrl.ctrl2agv.byangle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kaifantech.bean.msg.agv.LaserAgvMsgBean;
import com.kaifantech.bean.msg.agv.TaskPathInfoPointBean;
import com.kaifantech.component.service.pi.path.intersection.IntersectionService;
import com.kaifantech.util.agv.msg.PiCommandMsg;

@Component
public class PICtrlBothWithPathService {

	@Autowired
	private IntersectionService intersectionService;

	public PiCommandMsg check2Agvs(List<TaskPathInfoPointBean> pathOne, List<TaskPathInfoPointBean> pathAnother,
			LaserAgvMsgBean msgOne, LaserAgvMsgBean msgAnother) {
		return intersectionService.check2Agvs(pathOne, pathAnother, msgOne, msgAnother);
	}

}
