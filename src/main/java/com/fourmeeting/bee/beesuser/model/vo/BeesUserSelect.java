package com.fourmeeting.bee.beesuser.model.vo;

public class BeesUserSelect {
	private String keyword;
	private String option;
	private int beesNo;
	
	
	
	
	
	public BeesUserSelect() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BeesUserSelect(String keyword, String option, int beesNo) {
		super();
		this.keyword = keyword;
		this.option = option;
		this.beesNo = beesNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getBeesNo() {
		return beesNo;
	}
	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}
	
	
}
