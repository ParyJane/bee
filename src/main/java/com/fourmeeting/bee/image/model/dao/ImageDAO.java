package com.fourmeeting.bee.image.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.image.model.vo.Image;

@Repository("ImageDAO")
public class ImageDAO {

	public ArrayList<Image> imageSelectAll(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		List imageList = sqlSession.selectList("image.imageSelectAll", beesNo);
		return (ArrayList<Image>)imageList;
	}

	public ArrayList<Image> imageSelectOneFeed(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		List imageList = sqlSession.selectList("image.imageSelectOneFeed",boardNo);
		return (ArrayList<Image>)imageList;
	}

	public int deleteImage(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("image.deleteImage", boardNo);
		return result;
	}

	public int deleteImageSeparate(SqlSessionTemplate sqlSession, int imgNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("image.deleteImageSeparate",imgNo);
		return result;
	}

	public int selectImageNo(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int imageNo = sqlSession.selectOne("image.selectImageNo");
		return imageNo;
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image insertImage) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("image.insertImage",insertImage);
		return result;
	}

	public ArrayList<Image> imageSelectAllMyBees(SqlSessionTemplate sqlSession, List<Integer> beesNo) {
		// TODO Auto-generated method stub
		List imageList = sqlSession.selectList("image.imageSelectAllMyBees", beesNo);
		return (ArrayList<Image>)imageList;
	}

	public ArrayList<Image> imageSelectAllBees(SqlSessionTemplate sqlSession) {
		List imageList = sqlSession.selectList("image.imageSelectAllBees");
		return (ArrayList<Image>)imageList;
	}

}
