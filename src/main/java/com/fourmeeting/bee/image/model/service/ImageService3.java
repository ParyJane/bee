package com.fourmeeting.bee.image.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fourmeeting.bee.image.model.dao.ImageDAO2;
import com.fourmeeting.bee.image.model.dao.ImageDAO3;
@Service("imageService3")
public class ImageService3 {
	@Autowired
	@Qualifier(value="imageDAO3")
	private ImageDAO3 iDAO3;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
}

		
		