package com.fourmeeting.bee.vote.model.vo;

import java.sql.Date;

public class VoteChoice {
	
	private int voteChoNo;
	private String voteChoItem;
	
	private int userNo;
	private String userName;
	
	private int voteNo;

	
	
	public VoteChoice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VoteChoice(int voteChoNo, String voteChoItem, int userNo, String userName, int voteNo) {
		super();
		this.voteChoNo = voteChoNo;
		this.voteChoItem = voteChoItem;
		this.userNo = userNo;
		this.userName = userName;
		this.voteNo = voteNo;
	}

	public int getVoteChoNo() {
		return voteChoNo;
	}

	public void setVoteChoNo(int voteChoNo) {
		this.voteChoNo = voteChoNo;
	}

	public String getVoteChoItem() {
		return voteChoItem;
	}

	public void setVoteChoItem(String voteChoItem) {
		this.voteChoItem = voteChoItem;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	
	
}
