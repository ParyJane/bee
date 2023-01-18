package com.fourmeeting.bee.bees.model.vo;

public class Bees {
	private int beesNo;
	private String beesName;
	private String beesCover;
	private String beesCategory;
	private String beesHost;
	private int beesHostNo;
	private String beesHostName;
	private char beesPublicYN;
	private String beesCont;
	private int beesUserLimit;
	private char beesDelYN;
	private char beesGender;
	private int beesMaxBirth;
	private int beesMinBirth;

	public Bees() {
		super();
		// TODO Auto-generated constructor stub
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

	public int getBeesHostNo() {
		return beesHostNo;
	}

	public void setBeesHostNo(int beesHostNo) {
		this.beesHostNo = beesHostNo;
	}

	public String getBeesHostName() {
		return beesHostName;
	}

	public void setBeesHostName(String beesHostName) {
		this.beesHostName = beesHostName;
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

	public char getBeesGender() {
		return beesGender;
	}

	public void setBeesGender(char beesGender) {
		this.beesGender = beesGender;
	}

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

	public Bees(int beesNo, String beesName, String beesCover, String beesCategory, String beesHost, int beesHostNo,
			String beesHostName, char beesPublicYN, String beesCont, int beesUserLimit, char beesDelYN, char beesGender,
			int beesMaxBirth, int beesMinBirth) {
		super();
		this.beesNo = beesNo;
		this.beesName = beesName;
		this.beesCover = beesCover;
		this.beesCategory = beesCategory;
		this.beesHost = beesHost;
		this.beesHostNo = beesHostNo;
		this.beesHostName = beesHostName;
		this.beesPublicYN = beesPublicYN;
		this.beesCont = beesCont;
		this.beesUserLimit = beesUserLimit;
		this.beesDelYN = beesDelYN;
		this.beesGender = beesGender;
		this.beesMaxBirth = beesMaxBirth;
		this.beesMinBirth = beesMinBirth;
	}
	
	
}
