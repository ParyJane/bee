package com.fourmeeting.bee.comment.model.vo;

import java.sql.Timestamp;

public class MyComment {

	private int beesNo;
	private String beesName;
	private int memberNo;
	private String userName;
	private int commentNo;
	private String commentCont;
	private Timestamp commentDate;
	private char commentDelYN;
	private String boardCont;
	
	
	public MyComment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MyComment(int beesNo, String beesName, int memberNo, String userName, int commentNo, String commentCont,
			Timestamp commentDate, char commentDelYN, String boardCont) {
		super();
		this.beesNo = beesNo;
		this.beesName = beesName;
		this.memberNo = memberNo;
		this.userName = userName;
		this.commentNo = commentNo;
		this.commentCont = commentCont;
		this.commentDate = commentDate;
		this.commentDelYN = commentDelYN;
		this.boardCont = boardCont;
	}


	public int getBeesNo() {
		return beesNo;
	}


	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}


	public String getBeesName() {
		return beesName;
	}


	public void setBeesName(String beesName) {
		this.beesName = beesName;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public String getCommentCont() {
		return commentCont;
	}


	public void setCommentCont(String commentCont) {
		this.commentCont = commentCont;
	}


	public Timestamp getCommentDate() {
		return commentDate;
	}


	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}


	public char getCommentDelYN() {
		return commentDelYN;
	}


	public void setCommentDelYN(char commentDelYN) {
		this.commentDelYN = commentDelYN;
	}


	public String getBoardCont() {
		return boardCont;
	}


	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont;
	}
	
	
	
}
