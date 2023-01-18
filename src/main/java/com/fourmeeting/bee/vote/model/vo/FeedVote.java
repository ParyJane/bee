package com.fourmeeting.bee.vote.model.vo;

public class FeedVote {
	private int voteNo;
	private String voteTitle;
	private String voteItem;
	private char votePublicYN;
	private char voteEndYN;
	private int beesNo;
	private int boardNo;
	private int voteChoNo;
	private String voteChoItem;
	private String userName;
	private int userNo;
	private int memberNo;
	public int getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}
	public String getVoteTitle() {
		return voteTitle;
	}
	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}
	public String getVoteItem() {
		return voteItem;
	}
	public void setVoteItem(String voteItem) {
		this.voteItem = voteItem;
	}
	public char getVotePublicYN() {
		return votePublicYN;
	}
	public void setVotePublicYN(char votePublicYN) {
		this.votePublicYN = votePublicYN;
	}
	public char getVoteEndYN() {
		return voteEndYN;
	}
	public void setVoteEndYN(char voteEndYN) {
		this.voteEndYN = voteEndYN;
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
	public int getVoteChoNo() {
		return voteChoNo;
	}
	public void setVoteChoNo(int voteChoNo) {
		this.voteChoNo = voteChoNo;
	}
	public String getVoteChoItem() {
		return voteChoItem;
	}
	public void setVoteChoItem(String voteChoItem) {
		this.voteChoItem = voteChoItem;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public FeedVote(int voteNo, String voteTitle, String voteItem, char votePublicYN, char voteEndYN, int beesNo,
			int boardNo, int voteChoNo, String voteChoItem, String userName, int userNo, int memberNo) {
		super();
		this.voteNo = voteNo;
		this.voteTitle = voteTitle;
		this.voteItem = voteItem;
		this.votePublicYN = votePublicYN;
		this.voteEndYN = voteEndYN;
		this.beesNo = beesNo;
		this.boardNo = boardNo;
		this.voteChoNo = voteChoNo;
		this.voteChoItem = voteChoItem;
		this.userName = userName;
		this.userNo = userNo;
		this.memberNo = memberNo;
	}
	public FeedVote() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
