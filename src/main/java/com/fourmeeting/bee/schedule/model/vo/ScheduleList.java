package com.fourmeeting.bee.schedule.model.vo;

import java.sql.Timestamp;

public class ScheduleList {
	private int userNo;
	private int beesNo;
	private String scheduleTitle;
	private String scheduleCont;
	private Timestamp scheduleStartDate;
	private Timestamp scheduleEndDate;
	private int scheduleNo;
	private int boardNo;
	private int memberNo;
	private String profileImg;
	private String userName;
	

	public ScheduleList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ScheduleList(int userNo, int beesNo, String scheduleTitle, String scheduleCont, Timestamp scheduleStartDate,
			Timestamp scheduleEndDate, int scheduleNo, int boardNo, int memberNo, String profileImg, String userName) {
		super();
		this.userNo = userNo;
		this.beesNo = beesNo;
		this.scheduleTitle = scheduleTitle;
		this.scheduleCont = scheduleCont;
		this.scheduleStartDate = scheduleStartDate;
		this.scheduleEndDate = scheduleEndDate;
		this.scheduleNo = scheduleNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.profileImg = profileImg;
		this.userName = userName;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}
