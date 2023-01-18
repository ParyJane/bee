package com.fourmeeting.bee.image.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fourmeeting.bee.file.model.vo.BeesFile;
import com.fourmeeting.bee.image.model.service.ImageService;
import com.fourmeeting.bee.image.model.vo.Image;
import com.google.gson.Gson;

@Controller
public class ImageController {

	@Resource(name="ImageService")
	private ImageService imageService;
	
	@Autowired
	ServletContext context; 
	
	@RequestMapping(value="/uploadBeesImages.do", method=RequestMethod.POST)
	@ResponseBody
	public void multipartUpload(MultipartHttpServletRequest request, HttpSession session) throws IOException, UnsupportedEncodingException { 
		
		
		Gson gson = new Gson();
		List<MultipartFile> fileList = request.getFiles("image[]"); 
		
		System.out.println(fileList.size());
		String path = context.getRealPath("/resources/image/bees/feedImage/");
		System.out.println(path);
		File fileDir = new File(path); 
		long time = System.currentTimeMillis(); 
		String imageNoList = request.getParameter("imageList");
		StringTokenizer st = new StringTokenizer(imageNoList,",");
		
		int result = 0;
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		for (MultipartFile mf : fileList) { 
			
			String originalImageName = mf.getOriginalFilename(); // 원본 파일 명 
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //포맷 만들기
            long currentTime = Calendar.getInstance().getTimeInMillis(); //시간값 가져오기
            String ext = originalImageName.substring(originalImageName.lastIndexOf('.'));
            
			String changeImageName = currentTime + "bee" + ext;
			System.out.println(originalImageName+"/"+changeImageName);
			
			File serverFile = new File(path+File.separator+changeImageName);
			
			try {
				mf.transferTo(serverFile); 
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			
			
			Image image =  new Image();
			image.setImgNo(Integer.parseInt(st.nextToken()));
			image.setOriginalImageName(originalImageName);
			image.setChangeImageName(changeImageName);
			image.setImgPath(serverFile.getAbsolutePath());
			image.setImgSize((int)serverFile.length());
			image.setBoardNo(boardNo);
			
			result = imageService.insertImage(image);
				
		}
		
		
	}
			

}

