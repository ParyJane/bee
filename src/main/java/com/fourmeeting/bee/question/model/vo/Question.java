package com.fourmeeting.bee.question.model.vo;

import java.sql.Timestamp;

public class Question {

	private int questionNo;
	private int memberNo;
	private String questionCategory;
	private String questionTitle;
	private String questionCont;
	private Timestamp questionDate;
	private char replyYN;
	private char questionDelYN;
	
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Question(int questionNo, int memberNo, String questionCategory, String questionTitle, String questionCont,
			Timestamp questionDate, char replyYN, char questionDelYN) {
		super();
		this.questionNo = questionNo;
		this.memberNo = memberNo;
		this.questionCategory = questionCategory;
		this.questionTitle = questionTitle;
		this.questionCont = questionCont;
		this.questionDate = questionDate;
		this.replyYN = replyYN;
		this.questionDelYN = questionDelYN;
	}


	public int getQuestionNo() {
		return questionNo;
	}


	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getQuestionCategory() {
		return questionCategory;
	}


	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}


	public String getQuestionTitle() {
		return questionTitle;
	}


	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}


	public String getQuestionCont() {
		return questionCont;
	}


	public void setQuestionCont(String questionCont) {
		this.questionCont = questionCont;
	}


	public Timestamp getQuestionDate() {
		return questionDate;
	}


	public void setQuestionDate(Timestamp questionDate) {
		this.questionDate = questionDate;
	}


	public char getReplyYN() {
		return replyYN;
	}


	public void setReplyYN(char replyYN) {
		this.replyYN = replyYN;
	}


	public char getQuestionDelYN() {
		return questionDelYN;
	}


	public void setQuestionDelYN(char questionDelYN) {
		this.questionDelYN = questionDelYN;
	}

	
}
