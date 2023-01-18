package com.fourmeeting.bee.image.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.image.model.dao.ImageDAO;
import com.fourmeeting.bee.image.model.dao.ImageDAO2;
import com.fourmeeting.bee.image.model.vo.AttachFileDTO;
import com.fourmeeting.bee.notice.model.dao.NoticeDAO;

@Service("imageService2")
public class ImageService2 {

		
		@Autowired
		@Qualifier(value="imageDAO2")
		private ImageDAO2 iDAO2;
		
		@Autowired
		@Qualifier(value="sqlSessionTemplate")
		private SqlSessionTemplate sqlSession;

		public int insertOnlyImage(Map<String, Object> map) {
			System.out.println("왔냐?");
			int result = iDAO2.insertOnlyImage(map, sqlSession);
			System.out.println(result);
			return result;
			
		}
		
		public int updateDeleteImage(AttachFileDTO aDTO) {
			System.out.println("삭제하러 왔니?서비스");
			int result =iDAO2.updateDeleteImage(aDTO, sqlSession);
			System.out.println("삭제하고간다.서비스");
			return result;
		}

		public ArrayList<AttachFileDTO> selectAllImage(BeesUser b) {
			ArrayList<AttachFileDTO> list = iDAO2.selectAllImage(sqlSession,b);
			return list;
			
		}
		
	
	
}

