package com.fourmeeting.bee.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.fourmeeting.bee.admin.model.vo.Criteria;
import com.fourmeeting.bee.admin.model.vo.PageDTO;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.notice.model.service.NoticeService;
import com.fourmeeting.bee.notice.model.vo.Notice;



@Controller
public class NoticeController {

	@Autowired
	@Qualifier(value="noticeService")
	private NoticeService nService;
	
	
	@RequestMapping(value="/adminNoticeBoard.do")    //공지사항 전체 게시글조회
	public ModelAndView adminNoticeBoard(Criteria cri){
		ArrayList<Notice> list= nService.noticeSelectAll(cri);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		int total = nService.getTotal(cri);
		mav.addObject("pageMaker", new PageDTO(cri,total));
		mav.setViewName("admin/adminNoticeBoard"); 	
		return mav; 
	}	
	
	
	
	@RequestMapping(value="/delBtnChange.do") //삭제, 복구 버튼 수정
	public String delBtnChange(@RequestParam char btnVal, @RequestParam int boardNum,
			HttpServletResponse response)throws IOException{
		System.out.println("btnVal: " + btnVal);    //   현재 버튼값 = deleteBtn(삭제) or restoreBtn(복구)
		System.out.println("boardNum : " + boardNum ); //현재 페이지 번호
		
		if(btnVal=='N') btnVal='Y';    //N->Y
		else if(btnVal=='Y') btnVal='N'; //Y->N으로 버튼을 바꿔라
		
		int result = nService.deleteBtnChange(btnVal,boardNum);
		if(result>0){
			System.out.println("삭제, 복구 버튼 변경 성공");
			response.getWriter().print(true); //입출력으로 IOException발생 , 그래서 위에 throws IOException 붙여줌
		}else{
			System.out.println("삭제, 복구 버튼 변경 성공");
			response.getWriter().print(false);
		}
		return null;
	}
	
	
	@RequestMapping(value="/noticeInsert.do")       //공지사항,FAQ 등록
	public ModelAndView noticeInsert(Notice n, @SessionAttribute("member") Member m,Criteria cri){
		//세션에서 회원no가져와야함.
//		System.out.println(n.getNoticeTitle());
//		System.out.println(n.getNoticeCont());
//		System.out.println(m.getMemberId());
		String memberId = m.getMemberId();
		int memberNo = m.getMemberNo();
		n.setMemberNo(memberNo);
		String category="";
//		System.out.println("memberno:" + n.getMemberNo());
//		System.out.println("memberId" + memberId);
		if(n.getNoticeCategory().equals("noticeModal")){
			category="공지사항";
			n.setNoticeCategory(category);
//			System.out.println(n.getNoticeCategory());
		}else if(n.getNoticeCategory().equals("faqModal")){
			category="FAQ";
			n.setNoticeCategory(category);
//			System.out.println(n.getNoticeCategory());
		}
		
		int result = nService.noticeInsert(n);
		
		ModelAndView mav = new ModelAndView();
		//결과처리
		if(result>0){
			System.out.println("글을 등록 하였습니다.");
			ArrayList<Notice> list= nService.noticeSelectAll(cri);
			mav.addObject("list",list);
			System.out.println(list.get(1));
		}else{
			System.out.println("글을 등록 실패하였습니다.");
		}
				
		//	model.addAttribute("title",n.getNoticeTitle());
		//	model.addAttribute("noticeNo",n.getNoticeNo());
		//	model.addAttribute("noticeCont",n.getNoticeCont());
		//	model.addAttribute("category",n.getNoticeCategory());
		//	model.addAttribute("enrollDate",n.getNoticeDate());
		//	model.addAttribute("memberId",memberId);
			mav.setViewName("admin/adminNoticeBoard"); 	
			return mav; 
		
		
	}
	
	@RequestMapping(value = "/modifyChange.do")
	@ResponseBody
	public Map<String, Object> modifyChange(@RequestParam int num, HttpServletResponse response
)throws IOException{
		
		System.out.println("num"+num);
		 Map<String, Object> map = new HashMap<String, Object>();
		Notice notice = nService.modifyChange(num);
		map.put("category", notice.getNoticeCategory());
		map.put("title", notice.getNoticeTitle());
		map.put("cont", notice.getNoticeCont());
		map.put("memberNo", notice.getMemberNo());
		
		//String title = notice.getNoticeTitle();
		//String category = notice.getNoticeCategory();
		//String cont = notice.getNoticeCont();
	//	
		//System.out.println(title);
		//System.out.println(category);
		//System.out.println(cont);
		
		//mav.addObject("title",notice.getNoticeTitle());
	//mav.addObject("category",notice.getNoticeCategory());
	//mav.addObject("cont",notice.getNoticeCont());
		
		//mav.setViewName("admin/adminNoticeBoard");
		return map;

	
		
		
	}
	
	@RequestMapping(value ="/modifyUpdate.do")
	public ModelAndView modifyInsert(@RequestParam String modifyInsertCategory,@RequestParam String modifyInsertTitle,@RequestParam String modifyInsertCont,@RequestParam int modifyInsertNoticeNo,Criteria cri){
		
		Notice n = new Notice();
		n.setNoticeNo(modifyInsertNoticeNo);
		n.setNoticeCategory(modifyInsertCategory);
		n.setNoticeTitle(modifyInsertTitle);
		n.setNoticeCont(modifyInsertCont);
		n.setNoticeDelYN('N');
		int result = nService.modifyUpdate(n);
		
		ModelAndView mav = new ModelAndView();
		//결과처리
		if(result>0){
			System.out.println("글을 수정 하였습니다.");
			ArrayList<Notice> list= nService.noticeSelectAll(cri);
			mav.addObject("list",list);
			System.out.println(list.get(1));
		}else{
			System.out.println("수정을 실패하였습니다.");
		}
		mav.setViewName("admin/adminNoticeBoard"); 	
		return mav; 
	}
	
	@RequestMapping(value = "/searchbarBtn.do")  //공지사항 검색
	public ModelAndView searchbarBtn(@RequestParam String btnKeyword,
			@RequestParam String btnCategory,
			@RequestParam String btnStartDate,
			@RequestParam String btnEndDate,
			 Criteria cri){
	
		if(btnCategory.equals("faq")){
			
			btnCategory = "F";
			System.out.println(btnCategory);
		}else if(btnCategory.equals("notice")){
			
			btnCategory = "N";
			System.out.println(btnCategory);
		}
		System.out.println(btnStartDate);
		
		
		System.out.println(btnCategory);   //faq 또는 notice
		System.out.println(btnKeyword);       //text형태
	
		
		cri.setStartDate(btnStartDate);
		cri.setCategory(btnCategory);
		cri.setEndDate(btnEndDate);
		cri.setKeyword(btnKeyword);
	
			
		
		ArrayList<Notice> list = nService.searchBtn(cri);    
		ModelAndView mav = new ModelAndView();     
		
		mav.addObject("list",list);
		
		int total = nService.getTotal(cri);
		mav.addObject("pageMaker", new PageDTO(cri,total));
		mav.setViewName("admin/adminNoticeBoard");  
	
		return mav; 
		
	}
	
		//사용자 -------------------------------------------------------
		//마이페이지 공지사항 리스트
		@RequestMapping(value="/myPageNotice.do")
		public String mynotice(Model model){
			
			ArrayList<Notice> list = nService.myNoticeList();
			
			model.addAttribute("list", list);
			
			return "user/myPage/notice";
		}
		
	
	
}
