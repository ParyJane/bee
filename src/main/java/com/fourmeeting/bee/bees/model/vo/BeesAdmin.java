package com.fourmeeting.bee.bees.model.vo;

import java.sql.Timestamp;

public class BeesAdmin {
	private int beesNo;
	private String beesName;
	private String beesCover;
	private String beesCategory;
	private String beesHost;
	private char beesPublicYN;
	private String beesCont;
	private int beesUserLimit;
	private char beesDelYN;
	//private char beesGender;
	private int beesMaxBirth;
	private int beesMinBirth;
	private Timestamp beesDate;
	private Timestamp beesDelDate;
	private int memberCount;
	
	
	public BeesAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}


	public BeesAdmin(int beesNo, String beesName, String beesCover, String beesCategory, String beesHost,
			char beesPublicYN, String beesCont, int beesUserLimit, char beesDelYN, /*char beesGender,*/ int beesMaxBirth,
			int beesMinBirth, Timestamp beesDate, Timestamp beesDelDate, int memberCount) {
		super();
		this.beesNo = beesNo;
		this.beesName = beesName;
		this.beesCover = beesCover;
		this.beesCategory = beesCategory;
		this.beesHost = beesHost;
		this.beesPublicYN = beesPublicYN;
		this.beesCont = beesCont;
		this.beesUserLimit = beesUserLimit;
		this.beesDelYN = beesDelYN;
		//this.beesGender = beesGender;
		this.beesMaxBirth = beesMaxBirth;
		this.beesMinBirth = beesMinBirth;
		this.beesDate = beesDate;
		this.beesDelDate = beesDelDate;
		this.memberCount = memberCount;
	}


	public int getBeesNo() {
		return beesNo;
	}


	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}


	public String getBeesName() {
		return beesName;
	}


	public void setBeesName(String beesName) {
		this.beesName = beesName;
	}


	public String getBeesCover() {
		return beesCover;
	}


	public void setBeesCover(String beesCover) {
		this.beesCover = beesCover;
	}


	public String getBeesCategory() {
		return beesCategory;
	}


	public void setBeesCategory(String beesCategory) {
		this.beesCategory = beesCategory;
	}


	public String getBeesHost() {
		return beesHost;
	}


	public void setBeesHost(String beesHost) {
		this.beesHost = beesHost;
	}


	public char getBeesPublicYN() {
		return beesPublicYN;
	}


	public void setBeesPublicYN(char beesPublicYN) {
		this.beesPublicYN = beesPublicYN;
	}


	public String getBeesCont() {
		return beesCont;
	}


	public void setBeesCont(String beesCont) {
		this.beesCont = beesCont;
	}


	public int getBeesUserLimit() {
		return beesUserLimit;
	}


	public void setBeesUserLimit(int beesUserLimit) {
		this.beesUserLimit = beesUserLimit;
	}


	public char getBeesDelYN() {
		return beesDelYN;
	}


	public void setBeesDelYN(char beesDelYN) {
		this.beesDelYN = beesDelYN;
	}


/*	public char getBeesGender() {
		return beesGender;
	}


	public void setBeesGender(char beesGender) {
		this.beesGender = beesGender;
	}*/


	public int getBeesMaxBirth() {
		return beesMaxBirth;
	}


	public void setBeesMaxBirth(int beesMaxBirth) {
		this.beesMaxBirth = beesMaxBirth;
	}


	public int getBeesMinBirth() {
		return beesMinBirth;
	}


	public void setBeesMinBirth(int beesMinBirth) {
		this.beesMinBirth = beesMinBirth;
	}


	public Timestamp getBeesDate() {
		return beesDate;
	}


	public void setBeesDate(Timestamp beesDate) {
		this.beesDate = beesDate;
	}


	public Timestamp getBeesDelDate() {
		return beesDelDate;
	}


	public void setBeesDelDate(Timestamp beesDelDate) {
		this.beesDelDate = beesDelDate;
	}


	public int getMemberCount() {
		return memberCount;
	}


	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
	
	
	
	
	
}
