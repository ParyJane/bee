package com.fourmeeting.bee.board.model.vo;

public class BoardPaging {
	
	private int start;
	private int end;
	private int beesNo;
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
	public int getBeesNo() {
		return beesNo;
	}
	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}
	public BoardPaging(int start, int end, int beesNo) {
		super();
		this.start = start;
		this.end = end;
		this.beesNo = beesNo;
	}
	public BoardPaging() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
