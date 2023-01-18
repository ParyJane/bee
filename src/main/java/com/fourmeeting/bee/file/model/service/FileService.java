package com.fourmeeting.bee.file.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.file.model.dao.FileDAO;
import com.fourmeeting.bee.file.model.vo.BeesFile;


@Service("FileService")
public class FileService {
	
	
	@Resource (name="FileDAO")
	private FileDAO fileDAO;
	
	@Resource (name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	public ArrayList<BeesFile> fileSelectAll(int beesNo) {
		// TODO Auto-generated method stub
		
		ArrayList<BeesFile> fileList = fileDAO.fileSelectAll(sqlSession, beesNo);
		return fileList;
	}


	public BeesFile fileSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		BeesFile beesFile = fileDAO.fileSelectOne(sqlSession, boardNo);
		return beesFile;
	}
	
	public BeesFile fileSelectForDown(int fileNo) {
		BeesFile beesFile = fileDAO.fileSelectForDown(sqlSession, fileNo);
		return beesFile;
	}

	public int deleteFile(int boardNo) {
		// TODO Auto-generated method stub
		int result = fileDAO.deleteFile(sqlSession, boardNo);
		return result;
	}


	public int insertBeesFile(BeesFile insertFile) {
		// TODO Auto-generated method stub
		int result = fileDAO.insertBeesFile(sqlSession, insertFile);
		return result;
	}


	public ArrayList<BeesFile> fileSelectAllMyBees(List<Integer> beesNo) {
		ArrayList<BeesFile> fileList = fileDAO.fileSelectAllMyBees(sqlSession, beesNo);
		return fileList;
	}


	

}
