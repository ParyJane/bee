package com.fourmeeting.bee.answer.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.answer.model.dao.AnswerDAO;
import com.fourmeeting.bee.answer.model.vo.Answer;
import com.fourmeeting.bee.question.model.dao.QuestionDAO;

@Service("answerService")
public class AnswerService {

	@Autowired
	@Qualifier(value="answerDAO")
	private AnswerDAO aDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	//관리자 ------------------------------------------------------------------------
	//관리자 1:1 질문 등록하기
	public int insertAnswer(Answer answer) {
		
		int result = aDAO.insertAnswer(sqlSession, answer);
		
		return result;
	}

	//관리자 1:1 질문 등록하기(questionReply_YN)
	public int questionReply(int questionNo) {
		int result = aDAO.questionReply(sqlSession, questionNo);
		return result;
	}
	
	
	//관리자 답변 (하나만 불러오기)
	public Answer selectOneAnswer(int questionNo) {
		
		Answer a = aDAO.selectOneAnswer(sqlSession, questionNo);
		
		return a;
	}
	
	
	//관리자 답변 삭제(a delYN)
	public int answerDelete(int questionNo) {

		int result = aDAO.answerDelete(sqlSession,questionNo);
		
		return result;
		
	}
	
	//관리자 답변 삭제(q replyYN)
	public int answerDeleteQ(int questionNo) {

		int result = aDAO.answerDeleteQ(sqlSession,questionNo);
		
		return result;
		
	}
	
	
	//관리자 답변 수정
	public int answerModify(Answer a) {

		int result = aDAO.answerModify(sqlSession,a);
		
		return result;
	}
	
	
}
