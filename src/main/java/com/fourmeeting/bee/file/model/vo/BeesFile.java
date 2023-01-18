package com.fourmeeting.bee.file.model.vo;

public class BeesFile {
	private int fileNo;
	private String originalFileName;
	private String changeFileName;
	private String filePath;
	private int fileSize;
	private int boardNo;
	private char fileDelYN;

	public BeesFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BeesFile(int fileNo, String originalFileName, String changeFileName, String filePath, int fileSize, int boardNo,
			char fileDelYN) {
		super();
		this.fileNo = fileNo;
		this.originalFileName = originalFileName;
		this.changeFileName = changeFileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.boardNo = boardNo;
		this.fileDelYN = fileDelYN;
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

	public String getChangeFileName() {
		return changeFileName;
	}

	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public char getFileDelYN() {
		return fileDelYN;
	}

	public void setFileDelYN(char fileDelYN) {
		this.fileDelYN = fileDelYN;
	}
}
