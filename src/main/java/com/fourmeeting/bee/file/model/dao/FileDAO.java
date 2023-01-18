package com.fourmeeting.bee.file.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.file.model.vo.BeesFile;

@Repository("FileDAO")
public class FileDAO {

	public ArrayList<BeesFile> fileSelectAll(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("file.fileSelectAll",beesNo);
		return (ArrayList<BeesFile>)list;
	}

	public BeesFile fileSelectOne(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		BeesFile beesFile = sqlSession.selectOne("file.fileSelectOne",boardNo);
		return beesFile;
	}

	public int deleteFile(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("file.deleteFile",boardNo);
		return result;
	}

	public int insertBeesFile(SqlSessionTemplate sqlSession, BeesFile insertFile) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("file.insertFile", insertFile);
		return result;
	}

	public ArrayList<BeesFile> fileSelectAllMyBees(SqlSessionTemplate sqlSession, List<Integer> beesNo) {
		List list = sqlSession.selectList("file.fileSelectAllMyBees",beesNo);
		return (ArrayList<BeesFile>)list;
	}

	public BeesFile fileSelectForDown(SqlSessionTemplate sqlSession, int fileNo) {
		// TODO Auto-generated method stub
		BeesFile file = sqlSession.selectOne("file.fileSelectForDown", fileNo);
		return file;
	}

	

}
