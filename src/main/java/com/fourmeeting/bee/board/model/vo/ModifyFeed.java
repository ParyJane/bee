package com.fourmeeting.bee.board.model.vo;

import java.sql.Timestamp;

public class ModifyFeed {
	private int boardNo;
	private int beesNo;
	private Timestamp boardDate;
	private String boardCont;
	private int voteNo;
	private String voteTitle;
	private char voteEndYN;
	private int scheduleNo;
	private String scheduleTitle;
	private String transStartDate;
	private String transEndDate;
	private int fileNo;
	private String originalFileName;
	private String imgNo;
	private String changeImageName;
	private char boardNoticeYN;
	private char boardDelYN;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBeesNo() {
		return beesNo;
	}
	public void setBeesNo(int beesNo) {
		this.beesNo = beesNo;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardCont() {
		return boardCont;
	}
	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont;
	}
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
	public char getVoteEndYN() {
		return voteEndYN;
	}
	public void setVoteEndYN(char voteEndYN) {
		this.voteEndYN = voteEndYN;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getScheduleTitle() {
		return scheduleTitle;
	}
	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}
	public String getTransStartDate() {
		return transStartDate;
	}
	public void setTransStartDate(String transStartDate) {
		this.transStartDate = transStartDate;
	}
	public String getTransEndDate() {
		return transEndDate;
	}
	public void setTransEndDate(String transEndDate) {
		this.transEndDate = transEndDate;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getImgNo() {
		return imgNo;
	}
	public void setImgNo(String imgNo) {
		this.imgNo = imgNo;
	}
	public String getChangeImageName() {
		return changeImageName;
	}
	public void setChangeImageName(String changeImageName) {
		this.changeImageName = changeImageName;
	}
	public char getBoardNoticeYN() {
		return boardNoticeYN;
	}
	public void setBoardNoticeYN(char boardNoticeYN) {
		this.boardNoticeYN = boardNoticeYN;
	}
	public char getBoardDelYN() {
		return boardDelYN;
	}
	public void setBoardDelYN(char boardDelYN) {
		this.boardDelYN = boardDelYN;
	}
	public ModifyFeed(int boardNo, int beesNo, Timestamp boardDate, String boardCont, int voteNo, String voteTitle,
			char voteEndYN, int scheduleNo, String scheduleTitle, String transStartDate, String transEndDate,
			int fileNo, String originalFileName, String imgNo, String changeImageName, char boardNoticeYN,
			char boardDelYN) {
		super();
		this.boardNo = boardNo;
		this.beesNo = beesNo;
		this.boardDate = boardDate;
		this.boardCont = boardCont;
		this.voteNo = voteNo;
		this.voteTitle = voteTitle;
		this.voteEndYN = voteEndYN;
		this.scheduleNo = scheduleNo;
		this.scheduleTitle = scheduleTitle;
		this.transStartDate = transStartDate;
		this.transEndDate = transEndDate;
		this.fileNo = fileNo;
		this.originalFileName = originalFileName;
		this.imgNo = imgNo;
		this.changeImageName = changeImageName;
		this.boardNoticeYN = boardNoticeYN;
		this.boardDelYN = boardDelYN;
	}
	public ModifyFeed() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
