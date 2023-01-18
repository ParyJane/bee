package com.fourmeeting.bee.question.model.vo;

import java.sql.Timestamp;

public class QnA {

	private int questionNo;
	private int memberNo;
	private String questionCategory;
	private String questionTitle;
	private String questionCont;
	private Timestamp questionDate;
	private char replyYN;
	private char questionDelYN;
	
	private int answerNo;
	private int adminNo;
	private String answerCont;
	private Timestamp answerDate;
	private char answerDelYN;
	
	
	public QnA() {
		super();
		// TODO Auto-generated constructor stub
	}


	public QnA(int questionNo, int memberNo, String questionCategory, String questionTitle, String questionCont,
			Timestamp questionDate, char replyYN, char questionDelYN, int answerNo, int adminNo, String answerCont,
			Timestamp answerDate, char answerDelYN) {
		super();
		this.questionNo = questionNo;
		this.memberNo = memberNo;
		this.questionCategory = questionCategory;
		this.questionTitle = questionTitle;
		this.questionCont = questionCont;
		this.questionDate = questionDate;
		this.replyYN = replyYN;
		this.questionDelYN = questionDelYN;
		this.answerNo = answerNo;
		this.adminNo = adminNo;
		this.answerCont = answerCont;
		this.answerDate = answerDate;
		this.answerDelYN = answerDelYN;
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


	public int getAnswerNo() {
		return answerNo;
	}


	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}


	public int getAdminNo() {
		return adminNo;
	}


	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
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
