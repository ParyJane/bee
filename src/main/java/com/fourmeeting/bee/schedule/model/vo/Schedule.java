package com.fourmeeting.bee.schedule.model.vo;

import java.sql.Timestamp;

public class Schedule {
	private int userNo;
	private int beesNo;
	private String scheduleTitle;
	private String scheduleCont;
	private Timestamp scheduleStartDate;
	private Timestamp scheduleEndDate;
	private int scheduleNo;
	private int boardNo;
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Schedule(int userNo, int beesNo, String scheduleTitle, String scheduleCont, Timestamp scheduleStartDate,
			Timestamp scheduleEndDate, int scheduleNo, int boardNo) {
		super();
		this.userNo = userNo;
		this.beesNo = beesNo;
		this.scheduleTitle = scheduleTitle;
		this.scheduleCont = scheduleCont;
		this.scheduleStartDate = scheduleStartDate;
		this.scheduleEndDate = scheduleEndDate;
		this.scheduleNo = scheduleNo;
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBeesNo() {
		return beesNo;
	}
	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}
	public String getScheduleTitle() {
		return scheduleTitle;
	}
	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}
	public String getScheduleCont() {
		return scheduleCont;
	}
	public void setScheduleCont(String scheduleCont) {
		this.scheduleCont = scheduleCont;
	}
	public Timestamp getScheduleStartDate() {
		return scheduleStartDate;
	}
	public void setScheduleStartDate(Timestamp scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}
	public Timestamp getScheduleEndDate() {
		return scheduleEndDate;
	}
	public void setScheduleEndDate(Timestamp scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
}
