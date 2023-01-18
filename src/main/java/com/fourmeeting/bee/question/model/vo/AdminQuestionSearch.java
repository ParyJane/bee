package com.fourmeeting.bee.question.model.vo;

public class AdminQuestionSearch {

	private String startDate;
	private String endDate;
	private int searchSelect; //검색카테고리(전체보기, 카테고리, 비즈이름, 비즈장ID)
	private String search; //검색어
	
	
	public AdminQuestionSearch() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AdminQuestionSearch(String startDate, String endDate, int searchSelect, String search) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.searchSelect = searchSelect;
		this.search = search;
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


	public int getSearchSelect() {
		return searchSelect;
	}


	public void setSearchSelect(int searchSelect) {
		this.searchSelect = searchSelect;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}
	
	
	
}
