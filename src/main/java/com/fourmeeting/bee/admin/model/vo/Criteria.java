package com.fourmeeting.bee.admin.model.vo;

public class Criteria {
	private int pageNum;
	private int amount;
	private String category;
	private String keyword;
	private String startDate;
	private String endDate;
	public Criteria() {
		this.pageNum=1;
		this.amount=10;
		// TODO Auto-generated constructor stub
	}
	public Criteria(int pageNum, int amount, String category, String keyword, String startDate, String endDate) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
		this.keyword = keyword;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	
	
	
	


	
	
}
