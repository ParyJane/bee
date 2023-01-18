package com.fourmeeting.bee.admin.model.vo;

public class Search {
	private String category;
	private String keyword;
	private String startDate;
	private String endDate;
	private int beesNo;
	private String originalFileName;
	
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Search(String category, String keyword, String startDate, String endDate, int beesNo,
			String originalFileName) {
		super();
		this.category = category;
		this.keyword = keyword;
		this.startDate = startDate;
		this.endDate = endDate;
		this.beesNo = beesNo;
		this.originalFileName = originalFileName;
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

	public int getBeesNo() {
		return beesNo;
	}

	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	
	
	
}
