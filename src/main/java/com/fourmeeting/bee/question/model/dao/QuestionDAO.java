package com.fourmeeting.bee.question.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.question.model.vo.AdminQuestionSearch;
import com.fourmeeting.bee.question.model.vo.QnA;
import com.fourmeeting.bee.question.model.vo.Question;

@Repository("questionDAO")
public class QuestionDAO {

	
	//사용자 ------------------------------------------------------------------------
	//1:1문의 작성
	public int insertQuestion(SqlSessionTemplate sqlSession, Question question) {
		
		int result = sqlSession.insert("question.insertQuestion", question);
		
		return result;
		
	}

	
	//나의 문의 내역(리스트)
	public ArrayList<QnA> myQnaHistory(SqlSessionTemplate sqlSession, int memberNo) {
		
		
		List list = sqlSession.selectList("question.myQnaHistory", memberNo);
		
		
		return (ArrayList<QnA>)list;
		
	}
	
	
	
	//나의 문의 내역 (하나만 불러오기)
	public Question selectOneQuestion(SqlSessionTemplate sqlSession, int questionNo) {
		
		Question q = sqlSession.selectOne("question.selectOneQuestion",questionNo);
		
		return q;
	}
	
	
	
	//문의 내역 수정
	public int questionModify(SqlSessionTemplate sqlSession, Question q) {
		
		int result = sqlSession.update("question.questionModify",q);
		
		return result;
	}
	
	
	//문의 내역 삭제
	public int questionDelete(SqlSessionTemplate sqlSession, int questionNo) {
		
		int result = sqlSession.update("question.questionDelete",questionNo);
		
		return result;
		
	}
	
	//문의 내역 복구
	public int questionRollback(SqlSessionTemplate sqlSession, int questionNo) {
		
		int result = sqlSession.update("question.questionRollback",questionNo);
		
		return result;
		
	}
	

	
	//관리자 ------------------------------------------------------------------------
	//관리자 1:1 문의 불러오기
	public ArrayList<QnA> adminQuestionList(SqlSessionTemplate sqlSession, PagingVO pv) {
		
		List list = sqlSession.selectList("question.adminQuestionList", pv);
		
		return (ArrayList<QnA>)list;
		
	}

	
	//페이징처리(전체 question 개수)
	public int countQuestion(SqlSessionTemplate sqlSession) {
		
		PagingVO pv = sqlSession.selectOne("question.countQuestion");
		
		int totalPage = pv.getTotalPage();
		
		return totalPage;
	}

	//관리자 1:1 문의 검색
	public ArrayList<QnA> adminQuestionList(SqlSessionTemplate sqlSession, AdminQuestionSearch aqs) {

		List list = sqlSession.selectList("question.adminQuestionSearch", aqs);
		
		return (ArrayList<QnA>)list;
	}







}
