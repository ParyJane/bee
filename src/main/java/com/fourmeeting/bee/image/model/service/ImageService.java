package com.fourmeeting.bee.image.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.image.model.dao.ImageDAO;
import com.fourmeeting.bee.image.model.vo.AttachFileDTO;
import com.fourmeeting.bee.image.model.vo.Image;


@Service("ImageService")
public class ImageService {

	@Resource(name="ImageDAO")
	private ImageDAO imageDAO;
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Image> imageSelectAll(int beesNo) {
		// TODO Auto-generated method stub
		ArrayList<Image> imageList = imageDAO.imageSelectAll(sqlSession, beesNo);
		return imageList;
	}

	public ArrayList<Image> imageSelectOneFeed(int boardNo) {
		// TODO Auto-generated method stub
		ArrayList<Image> imageList = imageDAO.imageSelectOneFeed(sqlSession, boardNo);
		return imageList;
	}

	public int deleteImage(int boardNo) {
		// TODO Auto-generated method stub
		int result = imageDAO.deleteImage(sqlSession, boardNo);
		return result;
	}

	public int deleteImageSeparate(int imgNo) {
		// TODO Auto-generated method stub
		int result = imageDAO.deleteImageSeparate(sqlSession, imgNo);
		return result;
	}

	public int insertImage(Image insertImage) {
		// TODO Auto-generated method stub
		int result = imageDAO.insertImage(sqlSession,insertImage);
		return result;
	}

	public int selectImageNo() {
		// TODO Auto-generated method stub
		int imageNo = imageDAO.selectImageNo(sqlSession);
		return imageNo;
	}

	public ArrayList<Image> imageSelectAllMyBees(List<Integer> beesNo) {
		ArrayList<Image> imageList = imageDAO.imageSelectAllMyBees(sqlSession, beesNo);
		return imageList;
	}

	public ArrayList<Image> imageSelectAllBees() {
		ArrayList<Image> imageList = imageDAO.imageSelectAllBees(sqlSession);
		return imageList;
	}

	
}
