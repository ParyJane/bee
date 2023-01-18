package com.fourmeeting.bee.image.controller;
import org.springframework.core.io.FileSystemResource;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.net.SyslogAppender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fourmeeting.bee.bees.model.service.BeesService;
import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.Setting;
import com.fourmeeting.bee.beesuser.model.service.BeesUserService;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.board.model.service.BoardService;
import com.fourmeeting.bee.board.model.vo.Feed;
import com.fourmeeting.bee.image.model.service.ImageService;
import com.fourmeeting.bee.image.model.service.ImageService2;
import com.fourmeeting.bee.image.model.vo.AttachFileDTO;
import com.fourmeeting.bee.member.model.vo.Member;
import com.google.gson.JsonIOException;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ImageController2 {

	

	@Autowired
	ServletContext context;
	
	 @Autowired
	@Qualifier(value="imageService2")
	private ImageService2 iService2;
	 
	
		
		@Resource(name="BeesUserService")
		private BeesUserService userService;
		
		@Resource(name="BoardService")
		private BoardService boardService;
		
		
		@Resource(name= "beesService")
		private BeesService bService;
	 
	 
	 
	 
	 @RequestMapping(value="/selectAllImage.do")
		@ResponseBody
		public ModelAndView selectAllImage(@SessionAttribute("member") Member m, HttpServletRequest request, HttpSession session, HttpServletResponse response,@RequestParam int beesNo) throws Exception {
        
		 
				
		 
		 System.out.println(beesNo);	
			int memberNo = m.getMemberNo();
			System.out.println(memberNo);
			BeesUser b = new BeesUser();
			b.setBeesNo(beesNo);
			b.setMemberNo(memberNo);
			
			//서브바 필요정보들 // 
			Member member = (Member)session.getAttribute("member");
			int memberNo2 = member.getMemberNo();
			
			Bees bees = bService.beesSelectOne(beesNo);
			request.setAttribute("bees", bees);
			int userCount = userService.userCount(beesNo);
			request.setAttribute("userCount", userCount);
			//유저 정보 불러오기
			BeesUser user = userService.userSelectOne(memberNo2, beesNo);
			request.setAttribute("user", user);
			
			//세팅 정보 불러오기
			Setting setting = bService.selectBeesSetting(beesNo);
			request.setAttribute("setting", setting);
			
			
			
			//
			
			ArrayList<Feed> feedList = boardService.boardSelectAll(beesNo);
			request.setAttribute("feedList", feedList);
			
			
		ArrayList<AttachFileDTO> list = iService2.selectAllImage(b);
System.out.println("cont list"+list);
			ModelAndView mav = new ModelAndView();
			
		mav.addObject("list", list);
		mav.setViewName("bees/board/beesUploadImage"); 	
			return mav;
			
			
		}
			
		
// /////////////////////////////////////////////////////////////////// 


@PostMapping("/uploadFormAction")
public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

	String uploadFolder = "C:\\upload";

	for (MultipartFile multipartFile : uploadFile) {

		
		System.out.println("Upload File Name: " + multipartFile.getOriginalFilename());
		System.out.println("Upload File Size: " + multipartFile.getSize());

		File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

		try {
			multipartFile.transferTo(saveFile);
		} catch (Exception e) {
			
		} // end catch
	} // end for

}

@PostMapping("/image.do")
public String enroll(MultipartFile[] uploadFile,@RequestParam int beesNo){
	 System.out.println(beesNo);
   System.out.println(uploadFile);
	
   return "bees/board/uploadForm";
	
}


@PostMapping(value = "/uploadAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@ResponseBody
public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest request,@RequestParam int beesNo) {

	List<AttachFileDTO> list = new ArrayList<>();
	 Map<String, Object> map = new HashMap<String, Object>();

	 String uploadPath="/resources/file/";          //Wepapp이하 부터 파일명 앞까지 실제 경로
	 String realUploadPath = context.getRealPath(uploadPath);
		System.out.println("1.IMG real path: " + realUploadPath);     //파일명 전까지 전체 경로
	 
		 HttpSession session = request.getSession();
           Member m = (Member)session.getAttribute("member");
           
           int fileUser = m.getMemberNo();  //userId가 업로드 유저 (fileUser)
           
           
           AttachFileDTO attachDTO = new AttachFileDTO();
     		
     		

	for (MultipartFile multipartFile : uploadFile) {

		System.out.println("2.Original File Name: " + multipartFile.getOriginalFilename());		//실제 파일명
  		System.out.println("3.IMG Size: " + multipartFile.getSize());							//파일 사이즈
  		
  		
  		 String uploadFileName = multipartFile.getOriginalFilename();  //실제 파일명.

  	// // IE has file path
   		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);	//IE는 전체 파일 경로가 전송되므로 마지막 \를 기준으로 잘라낸게 실제 파일이름임.
   		System.out.println("only file name: " + uploadFileName);
   		attachDTO.setFileName(uploadFileName);       //filename= 진짜 파일명
   		//
   		 UUID uuid = UUID.randomUUID();      //동일한 파일명이 업로드 되면 기존에 등록된게 지워지므로 이름이 같으면 안됨. 따라서 랜덤문자열을 생성하여 유니크 이름 지정
 		 
 		 uploadFileName = uuid.toString() + "_" + uploadFileName;  //파일 이름 바꾸기   ,  랜덤문자열_실제이름

		try {
			

			 File saveFile = new File(realUploadPath, uploadFileName);  		//file객체 생성
			 saveFile.getParentFile().mkdirs();
    		 multipartFile.transferTo(saveFile);		//saveFile 지정한 저장 위치에 저장하기
    		 System.out.println("실험"+saveFile.getPath());
    		 attachDTO.setUuid(uuid.toString());          //uuid에 랜덤 문자열 저장
    			attachDTO.setUploadPath(saveFile.getPath());    //
    		 
    			attachDTO.setChangeFileName(saveFile.getName());
    			attachDTO.setMemberNo(fileUser);
    			attachDTO.setImgSIze(multipartFile.getSize());
    			
    			attachDTO.setImgDelYN('N');
    			File thumbnailFileName = new File(realUploadPath, "s_" + uploadFileName);
    			attachDTO.setThumbnailFileName(thumbnailFileName.getPath());
    			//FileOutputStream thumbnail = new FileOutputStream(thumbnailFileName);
    		
    			// //  Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 500, 500);
    		 
    		// thumbnail.close();
    			
    			//Thumbnails.of(thumbnailFileName).size(100,100).outputFormat("png").toOutputStream(out);
    			//byte[] buffer = new byte[1024*8];
    		//out.write(buffer);
    		 list.add(attachDTO);
    		 System.out.println("1" + attachDTO.getFileName());  //beeLogo.png
    		 System.out.println("2" + attachDTO.getUploadPath()); //C:\java_all\springWorkSpace\bee3\src\main\webapp\resources\file\
    		System.out.println("3" + attachDTO.getChangeFileName()); 
    		System.out.println("4" + attachDTO.getMemberNo());
    		System.out.println("5" + attachDTO.getImgSIze()); 
    		System.out.println("6" + attachDTO.getBoardNo()); 
    		System.out.println("7" + attachDTO.getImgDelYN()); 
    		System.out.println("8" + attachDTO.getThumbnailFileName()); 
    		System.out.println("beesNo" + beesNo);
    		} catch (Exception e) {
			e.printStackTrace();
		}
	}	map.put("list", list);
  		int result = iService2.insertOnlyImage( map);
 
  	if(result > 0){
 			System.out.println("이미지 등록 성공");
  		}else{
  			attachDTO.setImgDelYN('Y');
  			iService2.updateDeleteImage(attachDTO);
  	}
	
 return new ResponseEntity<>(list, HttpStatus.OK);
}

@GetMapping("/display")
@ResponseBody
public ResponseEntity<byte[]> getFile(String fileName) {

	System.out.println("fileName: " + fileName);

	File file = new File( fileName);
	file.getParentFile().mkdirs();
	System.out.println("file: " + file);

	ResponseEntity<byte[]> result = null;

	try {
		HttpHeaders header = new HttpHeaders();

		header.add("Content-Type", Files.probeContentType(file.toPath()));
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return result;
}



@PostMapping("/deleteFile")
@ResponseBody
public ResponseEntity<String> deleteFile(String fileName, String type) {

	System.out.println("deleteFile: " + fileName);

	File file;

	try {
		file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

		file.delete();

		if (type.equals("image")) {

			String largeFileName = file.getAbsolutePath().replace("s_", "");

			System.out.println("largeFileName: " + largeFileName);

			file = new File(largeFileName);

			file.delete();
		}

	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}

	return new ResponseEntity<String>("deleted", HttpStatus.OK);

}
}
