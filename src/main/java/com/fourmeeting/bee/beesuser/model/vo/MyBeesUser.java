package com.fourmeeting.bee.beesuser.model.vo;

import java.sql.Timestamp;

public class MyBeesUser {
	private int userNo;
	private int beesNo;
	private int memberNo;
	private String userName;
	private String userClass;
	private char userBlockYN;
	private char userDelYN;
	private char userAuthYN;
	private Timestamp userAskDate;
	private Timestamp userAuthDate;
	
	private String hostName;
	private String beesName;
	
	private int start;
	private int end;
	
	public MyBeesUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyBeesUser(int userNo, int beesNo, int memberNo, String userName, String userClass, char userBlockYN,
			char userDelYN, char userAuthYN, Timestamp userAskDate, Timestamp userAuthDate, String hostName,
			String beesName, int start, int end) {
		super();
		this.userNo = userNo;
		this.beesNo = beesNo;
		this.memberNo = memberNo;
		this.userName = userName;
		this.userClass = userClass;
		this.userBlockYN = userBlockYN;
		this.userDelYN = userDelYN;
		this.userAuthYN = userAuthYN;
		this.userAskDate = userAskDate;
		this.userAuthDate = userAuthDate;
		this.hostName = hostName;
		this.beesName = beesName;
		this.start = start;
		this.end = end;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public char getUserBlockYN() {
		return userBlockYN;
	}
	public void setUserBlockYN(char userBlockYN) {
		this.userBlockYN = userBlockYN;
	}
	public char getUserDelYN() {
		return userDelYN;
	}
	public void setUserDelYN(char userDelYN) {
		this.userDelYN = userDelYN;
	}
	public char getUserAuthYN() {
		return userAuthYN;
	}
	public void setUserAuthYN(char userAuthYN) {
		this.userAuthYN = userAuthYN;
	}
	public Timestamp getUserAskDate() {
		return userAskDate;
	}
	public void setUserAskDate(Timestamp userAskDate) {
		this.userAskDate = userAskDate;
	}
	public Timestamp getUserAuthDate() {
		return userAuthDate;
	}
	public void setUserAuthDate(Timestamp userAuthDate) {
		this.userAuthDate = userAuthDate;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getBeesName() {
		return beesName;
	}
	public void setBeesName(String beesName) {
		this.beesName = beesName;
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
	
	
	
	
	
	
	
}
