package com.fourmeeting.bee.vote.model.vo;

import java.sql.Date;

public class Vote {
	
	private int voteNo;
	private String voteTitle;
	private String voteItem;
	private char votePublicYN;
	private char voteEndYN;
	
	private int boardNo;
	private int beesNo;
	
	
	
	public Vote() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vote(int voteNo, String voteTitle, String voteItem, char votePublicYN, char voteEndYN, int boardNo,
			int beesNo) {
		super();
		this.voteNo = voteNo;
		this.voteTitle = voteTitle;
		this.voteItem = voteItem;
		this.votePublicYN = votePublicYN;
		this.voteEndYN = voteEndYN;
		this.boardNo = boardNo;
		this.beesNo = beesNo;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public String getVoteTitle() {
		return voteTitle;
	}

	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}

	public String getVoteItem() {
		return voteItem;
	}

	public void setVoteItem(String voteItem) {
		this.voteItem = voteItem;
	}

	public char getVotePublicYN() {
		return votePublicYN;
	}

	public void setVotePublicYN(char votePublicYN) {
		this.votePublicYN = votePublicYN;
	}

	public char getVoteEndYN() {
		return voteEndYN;
	}

	public void setVoteEndYN(char voteEndYN) {
		this.voteEndYN = voteEndYN;
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
