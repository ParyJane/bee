package com.fourmeeting.bee.notice.model.vo;

import java.sql.Timestamp;

public class Notice {
	private int noticeNo;
	private int memberNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeCont;
	private Timestamp noticeDate;
	private char noticeDelYN;
	private String memberId;

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeNo, int memberNo, String noticeCategory, String noticeTitle, String noticeCont,
			Timestamp noticeDate, char noticeDelYN, String memberId) {
		super();
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeCont = noticeCont;
		this.noticeDate = noticeDate;
		this.noticeDelYN = noticeDelYN;
		this.memberId = memberId;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeCont() {
		return noticeCont;
	}

	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}

	public Timestamp getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}

	public char getNoticeDelYN() {
		return noticeDelYN;
	}

	public void setNoticeDelYN(char noticeDelYN) {
		this.noticeDelYN = noticeDelYN;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	
	
	
}
