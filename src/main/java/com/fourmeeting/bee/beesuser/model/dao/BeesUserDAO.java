package com.fourmeeting.bee.beesuser.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.admin.model.vo.Criteria;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.beesuser.model.vo.BeesUserList;
import com.fourmeeting.bee.beesuser.model.vo.BeesUserSelect;
import com.fourmeeting.bee.beesuser.model.vo.MyBeesUser;
import com.fourmeeting.bee.beesuser.model.vo.UserSelect;


@Repository("BeesUserDAO")
public class BeesUserDAO {

	public int userCount(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		int userCount = sqlSession.selectOne("beesUser.userCount", beesNo);
		
		return userCount;
	}

	public BeesUser userSelectOne(SqlSessionTemplate sqlSession, int memberNo, int beesNo) {
		// TODO Auto-generated method stub
		
		UserSelect userSelect = new UserSelect(memberNo, beesNo);
		BeesUser user = sqlSession.selectOne("beesUser.userSelectOne", userSelect);
		return user;
	}

	public int insertBeesUser(SqlSessionTemplate sqlSession, BeesUser user) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("beesUser.insertBeesUser",user);
		return result;
	}

	public List<Integer> selectAllBeesNo(SqlSessionTemplate sqlSession, int memberNo) {
		// TODO Auto-generated method stub
		List<Integer> beesNo = sqlSession.selectList("beesUser.selectAllBeesNo",memberNo);
		
		return (List<Integer>)beesNo;
	}
	
	
	
	/*------------solm----------*/
	
public ArrayList<BeesUserList> selectBeesUser(SqlSessionTemplate splSession, int beesNo) {
		
		System.out.println("[BeesUser-DAO] 호출");
		
		List list = splSession.selectList("beesUserList.selectBeesUser", beesNo);
		
		/*
		System.out.println("----------------------------------------------");
		for(BeesUserList b : (ArrayList<BeesUserList>)list)
		{
			System.out.println(b.getUserName() + " / " + b.getUserAuthDate());
		}
		System.out.println("----------------------------------------------");
		*/
		
		return (ArrayList<BeesUserList>)list;
		
	}

	public ArrayList<BeesUserList> selectBeesUserSearch(SqlSessionTemplate splSession, String keyword, String option, int beesNo) {
		System.out.println("[BeesUserSearch-DAO] 호출");
		
		BeesUserSelect buSelect = new BeesUserSelect();
		buSelect.setKeyword(keyword);
		buSelect.setOption(option);
		buSelect.setBeesNo(beesNo);
		
		List list = splSession.selectList("beesUserList.selectBeesUserSearch", buSelect);
		
		System.out.println("----------------------------------------------");
		for(BeesUserList b : (ArrayList<BeesUserList>)list)
		{
			System.out.println(b.getUserName() + " / " + b.getUserAuthDate());
		}
		System.out.println("----------------------------------------------");
		
		
		return (ArrayList<BeesUserList>)list;
		
	}

	public ArrayList<BeesUserList> selectBeesApplicant(SqlSessionTemplate splSession, int beesNo) {
		System.out.println("[beesApplicant-DAO] 호출");
		List list = splSession.selectList("beesUserList.selectBeesApplicant", beesNo);
		
		return (ArrayList<BeesUserList>)list;
		
	}

	public int updateBeesUserRefusal(String userName, SqlSessionTemplate splSession) {
		System.out.println("[BeesUserRefusal-DAO] 호출");
		
		int result = splSession.update("beesUser.updateBeesUserRefusal", userName);
		System.out.println("updateBeesUserRefusal" + result);
		System.out.println(userName);
		return result;
		
	}

	public int updateBeesUserApproval(String userName, SqlSessionTemplate splSession) {
		int result = splSession.update("beesUser.updateBeesUserApproval", userName);
		System.out.println("승인 성공 : " + result);
		return result;
	}

	public BeesUser selectBeesUserClass(SqlSessionTemplate splSession, BeesUser beesUserClass) {
		
		BeesUser beesUser = splSession.selectOne("beesUser.selectBeesUserClass", beesUserClass);
		return beesUser;
	}

	public ArrayList<BeesUserList> selectBeesUserWaiters(SqlSessionTemplate splSession, int beesNo) {
		List WaitersList = splSession.selectList("beesUser.selectBeesUserWaiters", beesNo);
		return (ArrayList<BeesUserList>)WaitersList;
		
	}
	
		//사용자------------------------------------------------------------------------------
		//비즈가입확인(가입 신청중인 비즈)
		public ArrayList<MyBeesUser> beesJoinAsk(int memberNo, SqlSessionTemplate sqlSession) {

			List list = sqlSession.selectList("beesUser.beesJoinAsk", memberNo);
			
			return (ArrayList<MyBeesUser>)list;
		}
		
		
		//비즈가입확인(가입신청내역)
		public ArrayList<MyBeesUser> beesJoinHistory(MyBeesUser mbu, SqlSessionTemplate sqlSession) {
		
			List list = sqlSession.selectList("beesUser.beesJoinHistory",mbu);
			
			return (ArrayList<MyBeesUser>)list;
		}



		
		
		//비즈가입취소
		public int joinQnaCancel(SqlSessionTemplate sqlSession, int userNo) {
			
			int result = sqlSession.delete("beesUser.joinQnaCancel",userNo);
			return result;
		}

		
		
		//가입내역 페이징
		public int totalbeesJoinHistory(SqlSessionTemplate sqlSession, int memberNo) {

			PagingVO pv = sqlSession.selectOne("beesUser.totalbeesJoinHistory",memberNo);
			
			int totalPage = pv.getTotalPage();
			
			return totalPage;
		}
		
	
	
	

}
