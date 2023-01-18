package com.fourmeeting.bee.question.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.bees.model.vo.BeesAdmin;
import com.fourmeeting.bee.member.model.dao.MemberDAO;
import com.fourmeeting.bee.question.model.dao.QuestionDAO;
import com.fourmeeting.bee.question.model.vo.AdminQuestionSearch;
import com.fourmeeting.bee.question.model.vo.QnA;
import com.fourmeeting.bee.question.model.vo.Question;

@Service("questionService")
public class QuestionService {

	@Autowired
	@Qualifier(value="questionDAO")
	private QuestionDAO qDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	//사용자 ------------------------------------------------------------------------
	//1:1문의 작성
	public int insertQuestion(Question question) {
		
		int result = qDAO.insertQuestion(sqlSession, question);
		System.out.println("1:1문의 작성 service");
		
		return result;
		
	}

	
	//나의 문의 내역(리스트)
	public ArrayList<QnA> myQnaHistory(int memberNo) {
		
		System.out.println("나의 문의 내역 Service 까지 왔음");
		ArrayList<QnA> list = qDAO.myQnaHistory(sqlSession, memberNo);
		
		return list;
		
	}
	
	
	//나의 문의 내역 (하나만 불러오기)
	public Question selectOneQuestion(int questionNo) {
		
		
		System.out.println("하나만 불러오기-----"+questionNo);
		Question q = qDAO.selectOneQuestion(sqlSession,questionNo);
		
		return q;
	}
	
	
	
	
	//문의 내역 수정
	public int questionModify(Question q) {
		
		System.out.println("수정하기-----"+q.getQuestionNo());
		int result = qDAO.questionModify(sqlSession,q);
		
		return result;
	}
	
	
	
	//문의 내역 삭제
	public int questionDelete(int questionNo) {
		
		int result = qDAO.questionDelete(sqlSession,questionNo);
		
		return result;
	}
	
	//문의 내역 복구
	public int questionRollback(int questionNo) {
		
		int result = qDAO.questionRollback(sqlSession,questionNo);
		
		return result;
	}

	

	
	//관리자 ------------------------------------------------------------------------
	//관리자 1:1 문의 불러오기
	public ArrayList<QnA> adminQuestionList(PagingVO pv) {
		
		System.out.println("관리자  1:1문의 리스트 불러오기");
		ArrayList<QnA> list = qDAO.adminQuestionList(sqlSession,pv);
		
		return list;
		
	}

	//페이징처리(전체 question 개수)
	public int countQuestion() {

		int totalPage = qDAO.countQuestion(sqlSession);
		
		return totalPage;
	}

	
	//관리자 1:1 문의 검색
	public ArrayList<QnA> adminQuestionSearch(AdminQuestionSearch aqs) {

		ArrayList<QnA> list = qDAO.adminQuestionList(sqlSession,aqs);
		
		return list;
	}

	





	
	
}
