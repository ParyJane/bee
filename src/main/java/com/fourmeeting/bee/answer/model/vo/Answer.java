package com.fourmeeting.bee.answer.model.vo;

import java.sql.Timestamp;

public class Answer {
	private int answerNo;
	private int questionNo;
	private int adminNo;
	private int memberNo;
	private String answerCont;
	private Timestamp answerDate;
	private char answerDelYN;
	
	
	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Answer(int answerNo, int questionNo, int adminNo, int memberNo, String answerCont, Timestamp answerDate,
			char answerDelYN) {
		super();
		this.answerNo = answerNo;
		this.questionNo = questionNo;
		this.adminNo = adminNo;
		this.memberNo = memberNo;
		this.answerCont = answerCont;
		this.answerDate = answerDate;
		this.answerDelYN = answerDelYN;
	}
	
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getAnswerCont() {
		return answerCont;
	}
	public void setAnswerCont(String answerCont) {
		this.answerCont = answerCont;
	}
	public Timestamp getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Timestamp answerDate) {
		this.answerDate = answerDate;
	}
	public char getAnswerDelYN() {
		return answerDelYN;
	}
	public void setAnswerDelYN(char answerDelYN) {
		this.answerDelYN = answerDelYN;
	}
	
	
	
}
