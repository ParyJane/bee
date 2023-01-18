package com.fourmeeting.bee.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fourmeeting.bee.admin.model.service.AdminBoardService;
import com.fourmeeting.bee.admin.model.vo.Criteria;
import com.fourmeeting.bee.admin.model.vo.PageDTO;
import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.bees.model.service.BeesService;
import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.Setting;
import com.fourmeeting.bee.beesuser.model.service.BeesUserService;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.board.model.service.BoardService;
import com.fourmeeting.bee.board.model.vo.Feed;
import com.fourmeeting.bee.file.model.vo.BeesFile;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.notice.model.vo.Notice;



@Controller
public class AdminBoardController {
	
	@Autowired
	@Qualifier(value="adminBoardService")
	private AdminBoardService anService;
	
	@Resource(name="BeesUserService")
	private BeesUserService userService;
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	
	@Resource(name= "beesService")
	private BeesService bService;
	
	@RequestMapping(value="/beesUploadFile.do")
	public String uploadFile(@RequestParam int beesNo, HttpServletRequest request, HttpSession session) throws Exception {
		
		//서브바 필요정보들 // 
				Member member = (Member)session.getAttribute("member");
				int memberNo = member.getMemberNo();
				
				Bees bees = bService.beesSelectOne(beesNo);
				request.setAttribute("bees", bees);
				int userCount = userService.userCount(beesNo);
				request.setAttribute("userCount", userCount);
				//유저 정보 불러오기
				BeesUser user = userService.userSelectOne(memberNo, beesNo);
				request.setAttribute("user", user);
				
				//세팅 정보 불러오기
				Setting setting = bService.selectBeesSetting(beesNo);
				request.setAttribute("setting", setting);
				
				
				
				//
				
				ArrayList<Feed> feedList = boardService.boardSelectAll(beesNo);
				request.setAttribute("feedList", feedList);
		return "bees/board/beesFileBoard";
	}
	
	@RequestMapping(value="/image.do")
	public String image(){
		
		return "bees/board/uploadForm";
	}
	
	
	@RequestMapping(value="/sideInfo.do")
	public String sideInfo(@RequestParam int beesNo,HttpSession session,HttpServletRequest request){
		int memberCount = userService.userCount(beesNo);
		request.setAttribute("memberCount",memberCount);
		System.out.println(memberCount);
		Member member = (Member)session.getAttribute("member");
		int memberNo = member.getMemberNo();
		System.out.println(memberNo);
		
		BeesUser user = userService.userSelectOne(memberNo, beesNo);
		request.setAttribute("user", user);
		//서브바 필요정보들 // 
		
		
		Bees bees = bService.beesSelectOne(beesNo);
		request.setAttribute("bees", bees);
		int userCount = userService.userCount(beesNo);
		request.setAttribute("userCount", userCount);
		//유저 정보 불러오기
		
		//세팅 정보 불러오기
		Setting setting = bService.selectBeesSetting(beesNo);
		request.setAttribute("setting", setting);
		
		
		
		//
		
		ArrayList<Feed> feedList = boardService.boardSelectAll(beesNo);
		request.setAttribute("feedList", feedList);
		
		
		Bees beeInfo = bService.beesSelectOne(beesNo);
		request.setAttribute("beeInfo", beeInfo);
		System.out.println(beeInfo);
		
		return "/bees/board/beesFileBoard";
	}

	
	///////////////////////////////////////////////////////////
	@RequestMapping(value="/memberManagement.do")      //관리자 회원관리
	public ModelAndView memberManagement(Criteria cri, Model model){
		
		//이게 처음 로딩할때!
		//보면 ArrayList가 Member 타입이죠
		ArrayList<Member> list= anService.selectMemberAllList(cri);
		
		ModelAndView mav = new ModelAndView();
		System.out.println(cri);
		mav.addObject("list",list);
		
		int total = anService.getTotal(cri);
		mav.addObject("pageMaker", new PageDTO(cri,total));
		mav.setViewName("admin/memberManagement"); 
		
		//그리고 memberManagement page로 이동하구요
		return mav; 
	}
	
	
	@RequestMapping(value = {"/adminLogout.do", "/beeLogout.do", "/userLogout.do"})
	public String headerLogout(HttpSession session) {
		session.invalidate();

		return "redirect:/main.jsp";

	}
	
	@RequestMapping(value = "/withdrawalBtnChange.do") //관리자 회원관리 탈퇴/복구 버튼
	public String withdrawalBtnChange(@RequestParam char delVal, @RequestParam int memberNum, 
			HttpServletResponse response)throws IOException{
		System.out.println("delVal: " + delVal);    //   현재 버튼값 = deleteBtn(삭제) or restoreBtn(복구)
		System.out.println("memberNum : " + memberNum ); //현재 페이지 번호
		
		if(delVal=='N') delVal='Y';    //N->Y  삭제해
		else if(delVal=='Y') delVal='N'; //Y->N으로 버튼을 바꿔라  복구해
	
		int result = anService.withdrawalBtnChange(delVal,memberNum);
		if(result>0){
			System.out.println("삭제, 복구 버튼 변경 성공");
			response.getWriter().print(true); //입출력으로 IOException발생 , 그래서 위에 throws IOException 붙여줌
		}else{
			System.out.println("삭제, 복구 버튼 변경 성공");
			response.getWriter().print(false);
		}
		return null;
	}
	
	
	
	@RequestMapping(value = "/searchbar.do")
	public ModelAndView searchbar(@RequestParam String keyword,   //회원검색
			@RequestParam String category,
			@RequestParam String startDate,
			@RequestParam String endDate,
			 Criteria cri){
	
		
		if(category.equals("idMember")){
			
			category = "I";
			System.out.println(category );
		}else if(category.equals("nameMember")){
			
			category = "N";
			System.out.println(category );
		}else if(category.equals("withdrawalMember")){
			
			category = "W";
			System.out.println(category );
		}else if(category.equals("joinMember")){
			
			category = "J";
			System.out.println(category );
		}
		System.out.println(category);  //idMember 또는 nameMember 또는 withdrawalMember 또는 joinMember
		System.out.println(keyword);       //text형태
		System.out.println(startDate);   //2021-02-09이런 형태의 string
		System.out.println(endDate);
		
		cri.setStartDate(startDate);
		cri.setCategory(category);
		cri.setEndDate(endDate);
		cri.setKeyword(keyword);
		
		ArrayList<Notice> list = anService.searchbar(cri);    
		ModelAndView mav = new ModelAndView();     
		
		mav.addObject("list",list);
		
		int total = anService.getTotal(cri);
		mav.addObject("pageMaker", new PageDTO(cri,total));
		mav.setViewName("admin/memberManagement");  
	
		return mav; 
	}
	

	
	@RequestMapping("/searchInfo.do" )
	public ModelAndView searchMini(@RequestParam int beesNo, @RequestParam String keyword){
		 String originalFileName;
		Search s = new Search();
		s.setBeesNo(beesNo);
		s.setKeyword(keyword);
		System.out.println(beesNo);
		System.out.println(keyword);
		 ArrayList<Search> list= anService.searchMini(s);
		System.out.println(list);
		ModelAndView mav = new ModelAndView();  
		mav.addObject("list",list);
		mav.setViewName("bees/board/beesFileBoard");  
		
		return mav; 
		
	}
}
