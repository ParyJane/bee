package com.fourmeeting.bee.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.schedule.model.dao.ScheduleDAO;
import com.fourmeeting.bee.schedule.model.vo.Schedule;
import com.fourmeeting.bee.schedule.model.vo.ScheduleDetail;
import com.fourmeeting.bee.schedule.model.vo.ScheduleInsert;
import com.fourmeeting.bee.schedule.model.vo.ScheduleList;


@Service("ScheduleService")
public class ScheduleService {
		
	@Resource(name="ScheduleDAO")
	private ScheduleDAO scheduleDAO;
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Schedule> scheduleSelectAll(int beesNo) {
		// TODO Auto-generated method stub
		ArrayList<Schedule> scheduleList = scheduleDAO.scheduleSelectAll(sqlSession, beesNo);
				
		return scheduleList;
	}

	public ScheduleDetail scheduleSelectOne(int scheduleNo) {
		// TODO Auto-generated method stub
		ScheduleDetail schedule = scheduleDAO.scheduleSelectOne(sqlSession, scheduleNo);
		return schedule;
	}

	public Schedule scheduleSelectOneFeed(int boardNo) {
		// TODO Auto-generated method stub
		
		Schedule schedule = scheduleDAO.scheduleSelectOneFeed(sqlSession, boardNo);
		return schedule;
	}

	public int deleteSchedule(int scheduleNo) {
		// TODO Auto-generated method stub
		int result = scheduleDAO.deleteSchedule(sqlSession, scheduleNo);
		return result;
	}

	public int insertSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		
		int result = scheduleDAO.insertSchedule(sqlSession, schedule);
		return result;
	}

	
	/*-------------------solm---------------------*/
	public ArrayList<Schedule> scheduleSelectAllMyBees(List<Integer> beesNo) {
		ArrayList<Schedule> scheduleList = scheduleDAO.scheduleSelectAllMyBees(sqlSession, beesNo);
		return scheduleList;
	}
	
	public ArrayList<ScheduleList> selectBeesSchedule(int beesNo) {
		ArrayList<ScheduleList> list = scheduleDAO.selectBeesSchedule(sqlSession, beesNo);
		return list;
	}

	
	public BeesUser selectUserNo(int memberNo) {
		BeesUser BU = scheduleDAO.selectUserNo(sqlSession, memberNo);
		return BU;
	}
	
	public int insetScheDate(ScheduleInsert SI) {
	int	result = scheduleDAO.insetScheDate(sqlSession, SI);
	
	return result;
		
	}


	public ScheduleDetail selectScheContList(int scheduleNo) {
		
		ScheduleDetail schedule =  scheduleDAO.selectScheContList(sqlSession, scheduleNo);
		return schedule;
	}


	public int[] deleteBeesSchedule(int scheduleNo) {
		int deleteResult = scheduleDAO.deleteBeesSchedule(sqlSession, scheduleNo);
		int updateResult = scheduleDAO.updateBeesBoard(sqlSession, scheduleNo);
		 
		int [] result = new int [2];
		result[0]=deleteResult;
		result[1]=updateResult;
		return result;
		
	}


	public int updateScheduleCont(ScheduleDetail scheDetail) {
		System.out.println("[updateScheduleCont-service] 확인");
		int result = scheduleDAO.updateScheduleCont(sqlSession, scheDetail);
		return result;
		
	}

	public BeesUser selectBeesUserInfo(BeesUser beesUser) {
		BeesUser Buser = scheduleDAO.selectBeesUserInfo(sqlSession, beesUser);
		return Buser;
	}

}
