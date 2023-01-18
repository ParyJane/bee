package com.fourmeeting.bee.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.admin.model.dao.AdminBoardDAO;
import com.fourmeeting.bee.admin.model.vo.Criteria;
import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.file.model.vo.BeesFile;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.notice.model.vo.Notice;


@Service("adminBoardService")
public class AdminBoardService {

	@Autowired
	@Qualifier(value="adminBoardDAO")
	private AdminBoardDAO abDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	public ArrayList<Member> selectMemberAllList(Criteria cri) {     //관리자 회원전체 리스트 조회용입니다.
		ArrayList<Member> list = abDAO.selectMemberAllList(sqlSession, cri);
		return list;
		
	}


	public int withdrawalBtnChange(char delVal, int memberNum) {
		int result = abDAO.withdrawalBtnChange(sqlSession, delVal, memberNum);
		return result;
	}


	public int getTotal(Criteria cri) {
		int total = abDAO.getTotal(cri, sqlSession);
		return total;
	}


	


	public ArrayList<Notice> searchbar(Criteria cri) {
		ArrayList<Notice> list = abDAO.searchbar(cri, sqlSession);
		return list;
	}


	public ArrayList<Search> searchMini(Search s) {
		 ArrayList<Search> list= abDAO.searchMini(s, sqlSession);
	 return list;
	}



	
}
