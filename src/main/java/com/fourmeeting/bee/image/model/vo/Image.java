package com.fourmeeting.bee.image.model.vo;

public class Image {
	private int imgNo;
	private String originalImageName;
	private String changeImageName;
	private String imgPath;
	private int imgSize;
	private int boardNo;
	private char imgDelYN;
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getOriginalImageName() {
		return originalImageName;
	}
	public void setOriginalImageName(String originalImageName) {
		this.originalImageName = originalImageName;
	}
	public String getChangeImageName() {
		return changeImageName;
	}
	public void setChangeImageName(String changeImageName) {
		this.changeImageName = changeImageName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getImgSize() {
		return imgSize;
	}
	public void setImgSize(int imgSize) {
		this.imgSize = imgSize;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public char getImgDelYN() {
		return imgDelYN;
	}
	public void setImgDelYN(char imgDelYN) {
		this.imgDelYN = imgDelYN;
	}
	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Image(int imgNo, String originalImageName, String changeImageName, String imgPath, int imgSize, int boardNo,
			char imgDelYN) {
		super();
		this.imgNo = imgNo;
		this.originalImageName = originalImageName;
		this.changeImageName = changeImageName;
		this.imgPath = imgPath;
		this.imgSize = imgSize;
		this.boardNo = boardNo;
		this.imgDelYN = imgDelYN;
	}

}
