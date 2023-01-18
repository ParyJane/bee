package com.fourmeeting.bee.answer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.answer.model.vo.Answer;

@Repository("answerDAO")
public class AnswerDAO {
	
	
	//관리자 ------------------------------------------------------------------------
	//관리자 1:1 질문 등록하기
	public int insertAnswer(SqlSessionTemplate sqlSession, Answer answer) {

		int result = sqlSession.insert("answer.insertAnswer", answer);
		
		return result;
	}
	
	
	//관리자 1:1 질문 등록하기(questionReply_YN)
	public int questionReply(SqlSessionTemplate sqlSession, int questionNo) {
		
		int result = sqlSession.update("answer.questionReply", questionNo);
		
		return result;
	}

	
	//관리자 답변 (하나만 불러오기)
	public Answer selectOneAnswer(SqlSessionTemplate sqlSession, int questionNo) {

		Answer a = sqlSession.selectOne("answer.selectOneAnswer",questionNo);
		
		return a;
	}

	
	//관리자 답변 삭제(a delYN)
	public int answerDelete(SqlSessionTemplate sqlSession, int questionNo) {

		int result = sqlSession.update("answer.answerDelete",questionNo);
		
		return result;
	}
	
	//관리자 답변 삭제(q replyYN)
	public int answerDeleteQ(SqlSessionTemplate sqlSession, int questionNo) {

		int result = sqlSession.update("answer.answerDeleteQ",questionNo);
		
		return result;
	}

	//관리자 답변 수정
	public int answerModify(SqlSessionTemplate sqlSession, Answer a) {
		
		int result = sqlSession.update("answer.answerModify",a);
		
		return result;
		
	}

}
