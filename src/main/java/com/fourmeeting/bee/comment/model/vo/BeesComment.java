package com.fourmeeting.bee.comment.model.vo;

import java.sql.Timestamp;

public class BeesComment {
	
	private int commentNo;
	private String commentCont;
	private Timestamp commentDate;
	private int recommentNo;
	private char commentDelYN;
	
	private int userNo;
	private int boardNo;
	private int beesNo;
	
	
	
	public BeesComment() {
		super();
		// TODO Auto-generated constructor stub
	}



	public BeesComment(int commentNo, String commentCont, Timestamp commentDate, int recommentNo, char commentDelYN,
			int userNo, int boardNo, int beesNo) {
		super();
		this.commentNo = commentNo;
		this.commentCont = commentCont;
		this.commentDate = commentDate;
		this.recommentNo = recommentNo;
		this.commentDelYN = commentDelYN;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.beesNo = beesNo;
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



	public int getRecommentNo() {
		return recommentNo;
	}



	public void setRecommentNo(int recommentNo) {
		this.recommentNo = recommentNo;
	}



	public char getCommentDelYN() {
		return commentDelYN;
	}



	public void setCommentDelYN(char commentDelYN) {
		this.commentDelYN = commentDelYN;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getBeesNo() {
		return beesNo;
	}



	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}

	
	
	
	
	
	

}
