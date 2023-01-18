package com.fourmeeting.bee.userpage.model.vo;

public class RecommendBees {
	private String[] interest;
	private int sessionMemberNo;

	public RecommendBees() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecommendBees(String[] interest, int sessionMemberNo) {
		super();
		this.interest = interest;
		this.sessionMemberNo = sessionMemberNo;
	}

	public String[] getInterest() {
		return interest;
	}

	public void setInterest(String[] interest) {
		this.interest = interest;
	}

	public int getSessionMemberNo() {
		return sessionMemberNo;
	}

	public void setSessionMemberNo(int sessionMemberNo) {
		this.sessionMemberNo = sessionMemberNo;
	}

}
