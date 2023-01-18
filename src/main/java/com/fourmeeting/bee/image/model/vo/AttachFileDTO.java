package com.fourmeeting.bee.image.model.vo;

public class AttachFileDTO {
	private String fileName;
	private String changeFileName;
	private String uploadPath;
	private String uuid;
	private int memberNo;
	private long imgSIze;
	private int boardNo;
	private char imgDelYN;
	private String thumbnailFileName;
	
	
	public AttachFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AttachFileDTO(String fileName, String changeFileName, String uploadPath, String uuid, int memberNo,
			long imgSIze, int boardNo, char imgDelYN, String thumbnailFileName) {
		super();
		this.fileName = fileName;
		this.changeFileName = changeFileName;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.memberNo = memberNo;
		this.imgSIze = imgSIze;
		this.boardNo = boardNo;
		this.imgDelYN = imgDelYN;
		this.thumbnailFileName = thumbnailFileName;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getChangeFileName() {
		return changeFileName;
	}


	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
	}


	public String getUploadPath() {
		return uploadPath;
	}


	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}


	public String getUuid() {
		return uuid;
	}


	public void setUuid(String uuid) {
		this.uuid = uuid;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public long getImgSIze() {
		return imgSIze;
	}


	public void setImgSIze(long imgSIze) {
		this.imgSIze = imgSIze;
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


	public String getThumbnailFileName() {
		return thumbnailFileName;
	}


	public void setThumbnailFileName(String thumbnailFileName) {
		this.thumbnailFileName = thumbnailFileName;
	}


	
	
	
}
