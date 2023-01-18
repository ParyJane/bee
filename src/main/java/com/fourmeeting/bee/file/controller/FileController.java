package com.fourmeeting.bee.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.file.model.service.FileService;
import com.fourmeeting.bee.file.model.vo.BeesFile;
import com.google.gson.Gson;

@Controller
public class FileController {
	
	
	@Autowired
	@Qualifier(value="FileService")
	private FileService fileService;
	
		
	@RequestMapping(value = "/uploadBeesFile.do", method=RequestMethod.POST)
    public void uploadBeesFile(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
        
         
        String path = session.getServletContext().getRealPath("/resources/file");
        //파일이 저장될 패스 생성

        	// MultipartHttpServletRequest 생성 
            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request;
            
            Iterator iter = mhsr.getFileNames(); 
            MultipartFile mfile = null; 
            String fieldName = ""; 
            List resultList = new ArrayList(); // 디레토리가 없다면 생성 
            
            File dir = new File(path); 
            if (!dir.isDirectory()) { 
                dir.mkdirs(); 
            } 
            
            BeesFile insertFile = new BeesFile();
            int boardNo = Integer.parseInt(request.getParameter("boardNo"));
            int fileNo = Integer.parseInt(request.getParameter("fileNo"));
            // 값이 나올때까지
            while (iter.hasNext()) { 
                fieldName = iter.next().toString(); 
                mfile = mhsr.getFile(fieldName); 
                String originalName = new String(mfile.getOriginalFilename()); 
            	
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //포맷 만들기
                long currentTime = Calendar.getInstance().getTimeInMillis(); //시간값 가져오기
                String ext = originalName.substring(originalName.lastIndexOf('.')); // 확장자
                
                String saveFileName = currentTime + "bee" + ext;// 새로운 이름 짓기
                File serverFile = new File(path + File.separator + saveFileName); 
                mfile.transferTo(serverFile); 
                
                
                insertFile.setBoardNo(boardNo);
                insertFile.setFileNo(fileNo);
                insertFile.setOriginalFileName(originalName);
                insertFile.setChangeFileName(saveFileName);
                insertFile.setFileSize((int)serverFile.length());
                insertFile.setFilePath(serverFile.getAbsolutePath());
                
                
            }
            	
            int result = fileService.insertBeesFile(insertFile);
            
            response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		PrintWriter out = response.getWriter();
    		
    		new Gson().toJson(result,out);
       
            }
	
	
	@RequestMapping(value="/downloadBeesFile.do")
	@ResponseBody
	public void downloadBeesFile(@RequestParam int fileNo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		
		BeesFile fileData = fileService.fileSelectForDown(fileNo);
		System.out.println(fileData);
		File file = new File(fileData.getFilePath());
		System.out.println(file);
		String fileName = null;
		String browser = request.getHeader("User-Agent");
        //파일 인코딩
        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
            
            fileName = URLEncoder.encode(fileData.getOriginalFileName(),"UTF-8").replaceAll("\\+", "%20");
            
        }else{
            
            fileName = new String(fileData.getOriginalFileName().getBytes("UTF-8"), "ISO-8859-1");
            
        }

		System.out.println(fileName);
		//response.setContentType("application/download; charset=utf-8");         
        response.setContentLength((int)fileData.getFileSize());//콘텐트 크기 지정
        response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName +"\"");
        response.setHeader("Access-Control-Expose-Headers", "Filename");
        response.setHeader("Filename", fileName);
		response.setContentType("appliction/octet-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b [] = new byte[4096];
		int data =0;
		
		while((data=(fileInputStream.read(b,0,4096))) !=-1) {
			servletOutputStream.write(b,0,data);
		}
		
		
		servletOutputStream.flush(); // 출력
		//servletOutputStream.close();
		
		System.out.println("완료");
		
	}
	
	@RequestMapping(value="/fileList.do")
	 @ResponseBody
	public ArrayList<BeesFile> fileList(@RequestParam int beesNo,HttpServletRequest request, HttpServletResponse response){
		//HashMap<String,ArrayList<BeesFile>> map = new HashMap<>(); 
		
		System.out.println(beesNo);
		
		ArrayList<BeesFile> fileList = fileService.fileSelectAll(beesNo);
		System.out.println(fileList);
		
		
		response.setHeader("Cache-Control", "no-cache");
	/*	for(BeesFile b : fileList){
			b.getOriginalFileName()
		}
			map.put("fileList", fileList);
			
		
		/*for(int i=0; i < fileList.size(); i++)

		{

			map.put(i, value)list.get(i);

		System.out.println("index >>" + i);

		}*/

		
		

		
			return fileList;
	}
	
	

	
	      
}
        
        
	
        
	


	
	


