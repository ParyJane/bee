package com.fourmeeting.bee.schedule.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.schedule.model.vo.Schedule;
import com.fourmeeting.bee.schedule.model.vo.ScheduleDetail;
import com.fourmeeting.bee.schedule.model.vo.ScheduleInsert;
import com.fourmeeting.bee.schedule.model.vo.ScheduleList;


@Repository("ScheduleDAO")
public class ScheduleDAO {

	public ArrayList<Schedule> scheduleSelectAll(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("schedule.scheduleSelectAll", beesNo);
		return (ArrayList<Schedule>)list;
	}

	public ScheduleDetail scheduleSelectOne(SqlSessionTemplate sqlSession, int scheduleNo) {
		// TODO Auto-generated method stub
		ScheduleDetail schedule = sqlSession.selectOne("schedule.scheduleSelectOne",scheduleNo);
		return schedule;
	}

	public Schedule scheduleSelectOneFeed(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		Schedule schedule = sqlSession.selectOne("schedule.scheduleSelectOneFeed",boardNo);
		return schedule;
	}

	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("schedule.deleteSchedule",scheduleNo);
		return result;
	}

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule schedule) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("schedule.insertSchedule",schedule);
		return result;
	}

	public ArrayList<Schedule> scheduleSelectAllMyBees(SqlSessionTemplate sqlSession, List<Integer> beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("schedule.scheduleSelectAllMyBees", beesNo);
		return (ArrayList<Schedule>)list;
	}

	/*---------------solm-----------------*/
	
	public ArrayList<ScheduleList> selectBeesSchedule(SqlSessionTemplate sqlSession, int beesNo) {
		List list = sqlSession.selectList("bees.selectBeesSchedule", beesNo);
		return (ArrayList<ScheduleList>) list;
		
	}
	
	public BeesUser selectUserNo(SqlSessionTemplate sqlSession, int memberNo) {
		BeesUser BU = sqlSession.selectOne("beesUser.selectUserNo", memberNo);
		return BU;
		
	}
	
	public int insetScheDate(SqlSessionTemplate sqlSession, ScheduleInsert SI) {

		int result = sqlSession.insert("bees.insertScheDate", SI);
		System.out.println("일정 들어갔니? : " + result);
		return result;
	}

	public ScheduleDetail selectScheContList(SqlSessionTemplate sqlSession, int scheduleNo) {
		ScheduleDetail schedule = sqlSession.selectOne("bees.selectScheContList", scheduleNo);
		return schedule;
	}

	public int deleteBeesSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		int result = sqlSession.delete("bees.deleteBeesSchedule", scheduleNo);
		return result;
		
	}
	
	public int updateBeesBoard(SqlSessionTemplate sqlSession, int scheduleNo) {
		int result = sqlSession.update("bees.updateBeesBoard", scheduleNo);
		return result ;
		
	}

	public int updateScheduleCont(SqlSessionTemplate sqlSession, ScheduleDetail scheDetail) {
		System.out.println("[updateScheduleCont-DAO] 확인");
		int result = sqlSession.update("bees.updateScheduleCont", scheDetail);
		System.out.println("오류라도 나라 : "+result);
		return result;
	}

	public BeesUser selectBeesUserInfo(SqlSessionTemplate sqlSession, BeesUser beesUser) {
		BeesUser Buser = sqlSession.selectOne("bees.selectBeesUserInfo", beesUser);
		return Buser;
	}

	
}
