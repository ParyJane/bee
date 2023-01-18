package com.fourmeeting.bee.beesuser.model.vo;

public class UserSelect {
private int memberNo;
private int beesNo;
public int getMemberNo() {
	return memberNo;
}
public void setMemberNo(int memberNo) {
	this.memberNo = memberNo;
}
public int getBeesNo() {
	return beesNo;
}
public void setBeesNo(int beesNo) {
	this.beesNo = beesNo;
}
public UserSelect(int memberNo, int beesNo) {
	super();
	this.memberNo = memberNo;
	this.beesNo = beesNo;
}
public UserSelect() {
	super();
	// TODO Auto-generated constructor stub
}

}
