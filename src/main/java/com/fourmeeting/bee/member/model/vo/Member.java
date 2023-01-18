package com.fourmeeting.bee.member.model.vo;

import java.sql.Timestamp;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private Timestamp memberDate;     
	private char delYN;
	private Timestamp memberEndDate; 
	private int memberBirth;
	private String memberAddr;
	private String interest;
	private String profileImg;
	private char memberGender;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberEmail,
			String memberPhone, Timestamp memberDate, char delYN, Timestamp memberEndDate, int memberBirth,
			String memberAddr, String interest, String profileImg, char memberGender) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberDate = memberDate;
		this.delYN = delYN;
		this.memberEndDate = memberEndDate;
		this.memberBirth = memberBirth;
		this.memberAddr = memberAddr;
		this.interest = interest;
		this.profileImg = profileImg;
		this.memberGender = memberGender;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Timestamp getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	public Timestamp getMemberEndDate() {
		return memberEndDate;
	}
	public void setMemberEndDate(Timestamp memberEndDate) {
		this.memberEndDate = memberEndDate;
	}
	public int getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(int memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	
	
	
}
