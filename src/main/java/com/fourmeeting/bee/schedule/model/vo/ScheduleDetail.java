package com.fourmeeting.bee.schedule.model.vo;

import java.sql.Timestamp;

public class ScheduleDetail {

	private int scheduleNo;
	private int userNo;
	private String userName;
	private int beesNo;
	private int boardNo;
	private String scheduleTitle;
	private String scheduleCont;
	private Timestamp scheduleStartDate;
	private String transStartDate;
	private Timestamp scheduleEndDate;
	private String transEndDate;
	private String profileImg;
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
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
	public int getBeesNo() {
		return beesNo;
	}
	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getTransStartDate() {
		return transStartDate;
	}
	public void setTransStartDate(String transStartDate) {
		this.transStartDate = transStartDate;
	}
	public Timestamp getScheduleEndDate() {
		return scheduleEndDate;
	}
	public void setScheduleEndDate(Timestamp scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}
	public String getTransEndDate() {
		return transEndDate;
	}
	public void setTransEndDate(String transEndDate) {
		this.transEndDate = transEndDate;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public ScheduleDetail(int scheduleNo, int userNo, String userName, int beesNo, int boardNo, String scheduleTitle,
			String scheduleCont, Timestamp scheduleStartDate, String transStartDate, Timestamp scheduleEndDate,
			String transEndDate, String profileImg) {
		super();
		this.scheduleNo = scheduleNo;
		this.userNo = userNo;
		this.userName = userName;
		this.beesNo = beesNo;
		this.boardNo = boardNo;
		this.scheduleTitle = scheduleTitle;
		this.scheduleCont = scheduleCont;
		this.scheduleStartDate = scheduleStartDate;
		this.transStartDate = transStartDate;
		this.scheduleEndDate = scheduleEndDate;
		this.transEndDate = transEndDate;
		this.profileImg = profileImg;
	}
	public ScheduleDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
}
