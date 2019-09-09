package com.kaifantech.component.dao.taskexe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.msg.agv.IXYBean;
import com.kaifantech.bean.msg.agv.TaskPathInfoPointBean;
import com.kaifantech.init.sys.dao.AppTables;

@Service
public class TaskPathInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<TaskPathInfoPointBean> selectPath(Integer agvId, String taskid) {
		return (List<TaskPathInfoPointBean>) jdbcTemplate.query(
				"select `uuid`,agvId,taskid,x,y,angle,secondToStart,taskStep from " + AppTables.TASK_PATH_INFO
						+ " where agvId=" + agvId + " and taskid=" + taskid,
				new BeanPropertyRowMapper<TaskPathInfoPointBean>(TaskPathInfoPointBean.class));
	}

	public Integer getPointCount(Integer agvId, String taskid) {
		return jdbcTemplate.queryForObject(
				"select count(*) from " + AppTables.TASK_PATH_INFO + " where agvId=" + agvId + " and taskid=" + taskid,
				Integer.class);
	}

	public void addAPoint(Integer agvId, String taskid, double x, double y, Long startMoveSecond, Float angle,
			Integer taskStep) {
		jdbcTemplate.execute("insert into " + AppTables.TASK_PATH_INFO
				+ " (`uuid`,agvId,taskid,x,y,angle,secondToStart,taskStep) " + "values(uuid()," + agvId + ",'" + taskid
				+ "','" + x + "','" + y + "'," + angle + "," + startMoveSecond + "," + taskStep + ")");
	}

	public void addAPoint(IXYBean msg, Long startMoveSecond) {
		addAPoint(msg.getAgvId(), msg.getTaskid(), msg.getX(), msg.getY(), startMoveSecond, msg.getAngle(),
				msg.getTaskStep());
	}

}
