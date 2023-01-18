package com.fourmeeting.bee.beesuser.model.vo;

import java.sql.Date;

public class BeesUser {
	private int userNo;
	private int beesNo;
	private int memberNo;
	private String userName;
	private String userClass;
	private char userBlockYN;
	private char userDelYN;
	private char userAuthYN;
	private Date userAuthDate;
	private Date userAskDate;
	
	
	public Date getUserAuthDate() {
		return userAuthDate;
	}
	public void setUserAuthDate(Date userAuthDate) {
		this.userAuthDate = userAuthDate;
	}
	public Date getUserAskDate() {
		return userAskDate;
	}
	public void setUserAskDate(Date userAskDate) {
		this.userAskDate = userAskDate;
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
	
	
	public BeesUser(int userNo, int beesNo, int memberNo, String userName, String userClass, char userBlockYN,
			char userDelYN, char userAuthYN, Date userAuthDate, Date userAskDate) {
		super();
		this.userNo = userNo;
		this.beesNo = beesNo;
		this.memberNo = memberNo;
		this.userName = userName;
		this.userClass = userClass;
		this.userBlockYN = userBlockYN;
		this.userDelYN = userDelYN;
		this.userAuthYN = userAuthYN;
		this.userAuthDate = userAuthDate;
		this.userAskDate = userAskDate;
	}
	
	public BeesUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
