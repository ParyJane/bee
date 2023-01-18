package com.fourmeeting.bee;

public class PagingVO {
	
	private int currentPage; //현재페이지
	private int start; 		 //시작페이지
	private int end;		 //마지막 페이지
	private int cntPage;	 //페이징 개수
	private int cntPerPage;  //페이지당 글 개수
	private int totalPage; 	 //전체 페이지
	
	
	public PagingVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PagingVO(int currentPage, int start, int end, int cntPage, int cntPerPage, int totalPage) {
		super();
		this.currentPage = currentPage;
		this.start = start;
		this.end = end;
		this.cntPage = cntPage;
		this.cntPerPage = cntPerPage;
		this.totalPage = totalPage;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	public int getCntPage() {
		return cntPage;
	}


	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}


	public int getCntPerPage() {
		return cntPerPage;
	}


	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
	
	
	
	
	

}
