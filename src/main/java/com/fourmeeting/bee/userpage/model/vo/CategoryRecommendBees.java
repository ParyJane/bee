package com.fourmeeting.bee.userpage.model.vo;

public class CategoryRecommendBees {
	private String category;
	private int sessionMemberNo;
	public CategoryRecommendBees() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryRecommendBees(String category, int sessionMemberNo) {
		super();
		this.category = category;
		this.sessionMemberNo = sessionMemberNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getSessionMemberNo() {
		return sessionMemberNo;
	}
	public void setSessionMemberNo(int sessionMemberNo) {
		this.sessionMemberNo = sessionMemberNo;
	}
	
	
}
