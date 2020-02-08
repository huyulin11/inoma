package com.kaifantech.component.controller.json.op;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.calculatedfun.util.AppTool;
import com.calculatedfun.util.msg.AppMsg;
import com.kaifantech.component.service.taskexe.auto.IAutoService;

@Controller
@RequestMapping("/json/op/")
public class AcsAutoController {
	@Autowired
	private IAutoService taskexeAutoService;

	@RequestMapping("addATaskBySystem")
	@ResponseBody
	public Object addATaskBySystem(Integer lapId) {
		if (AppTool.isNull(lapId)) {
			return new AppMsg(-1, "机械手编号为空");
		} else if (!(lapId.equals(1) || lapId.equals(2) || lapId.equals(3) || lapId.equals(4) || lapId.equals(5))) {
			return new AppMsg(-1, "非法的机械手编号");
		}
		return JSONArray.toJSON(taskexeAutoService.addTask(lapId, -1));
	}
}
