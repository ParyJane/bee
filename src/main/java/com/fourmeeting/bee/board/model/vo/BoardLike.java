package com.fourmeeting.bee.board.model.vo;

public class BoardLike {
	private int memberNo;
	private int boardNo;
	
	
	public BoardLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardLike(int memberNo, int boardNo) {
		super();
		this.memberNo = memberNo;
		this.boardNo = boardNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	

}
