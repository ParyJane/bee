package com.fourmeeting.bee.admin.model.vo;

public class MemberManagement {

	private char userBlockYN;
	private char userDelYN;
	private int memberNo;
	public MemberManagement() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberManagement(char userBlockYN, char userDelYN, int memberNo) {
		super();
		this.userBlockYN = userBlockYN;
		this.userDelYN = userDelYN;
		this.memberNo = memberNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
}
