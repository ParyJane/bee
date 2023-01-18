package com.fourmeeting.bee.beesuser.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.fourmeeting.bee.admin.model.vo.PageDTO;
import com.fourmeeting.bee.bees.model.service.BeesService;
import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.Setting;
import com.fourmeeting.bee.beesuser.model.service.BeesUserService;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.beesuser.model.vo.BeesUserList;
import com.fourmeeting.bee.beesuser.model.vo.MyBeesUser;
import com.fourmeeting.bee.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class BeesUserController {

	@Resource(name = "BeesUserService")
	private BeesUserService userService;

	@Autowired
	@Qualifier(value = "beesService")
	private BeesService bService;

	@RequestMapping("/insertBeesUser.do")
	private void insertBeesUser(@RequestParam String userName, @RequestParam int beesNo, @RequestParam int memberNo,
			HttpServletResponse response) throws Exception {

		BeesUser user = new BeesUser();
		user.setBeesNo(beesNo);
		user.setUserName(userName);
		user.setMemberNo(memberNo);
		int result = userService.insertBeesUser(user);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(result, out);

	}

	/*------------solm----------*/
	@RequestMapping(value = "/inviteMember.do")
	public ModelAndView selectMemberInvite(HttpSession session, HttpServletRequest request) {

		int beesNo = (int) session.getAttribute("beesNo");

		// 서브바 필요정보들 //
		Member member = (Member) session.getAttribute("member");
		int memberNo = member.getMemberNo();

		Bees bees = bService.beesSelectOne(beesNo);
		request.setAttribute("bees", bees);
		int userCount = userService.userCount(beesNo);
		request.setAttribute("userCount", userCount);
		// 유저 정보 불러오기
		BeesUser user = userService.userSelectOne(memberNo, beesNo);
		request.setAttribute("user", user);

		// 세팅 정보 불러오기
		Setting setting = bService.selectBeesSetting(beesNo);
		request.setAttribute("setting", setting);

		ModelAndView mav = new ModelAndView();
		mav.addObject("memberNo", memberNo);
		mav.addObject("beesNo", beesNo);
		mav.setViewName("bees/beesInvite");

		return mav;
	}

	@RequestMapping(value = "/beesMember.do")

	public ModelAndView selectBeesUser(HttpSession session, HttpServletRequest request) {

		// 서브바 필요정보들 //
		Member member = (Member) session.getAttribute("member");
		int memberNo = member.getMemberNo();

		// BeesNo Session에서 가져오기
		int beesNo = (int) session.getAttribute("beesNo");
		System.out.println("selectBeesUser BeesNo : " + beesNo);

		Bees bees = bService.beesSelectOne(beesNo);
		request.setAttribute("bees", bees);
		int userCount = userService.userCount(beesNo);
		request.setAttribute("userCount", userCount);
		// 유저 정보 불러오기
		BeesUser user = userService.userSelectOne(memberNo, beesNo);
		request.setAttribute("user", user);

		// 세팅 정보 불러오기
		Setting setting = bService.selectBeesSetting(beesNo);
		request.setAttribute("setting", setting);

		System.out.println("[beesUser-controller] 호출");
		String mainpage_option = request.getParameter("option");
		if (mainpage_option == null || mainpage_option.length() == 0) {
			mainpage_option = "user_name";
		}

		System.out.println("BeesMember로 넘어오는지 확인 : " + mainpage_option);

		/*
		 * 로그인한 memberNo 받아오는 코드 Member m = (Member)session.getAttribute("member"); int
		 * memberNo = m.getMemberNo();
		 */

		BeesUser beesUserClass = new BeesUser();
		beesUserClass.setBeesNo(beesNo);
		beesUserClass.setMemberNo(memberNo);

		// memberNo를 통해 beesUser 정보 넘겨받는 코드
		BeesUser beesUser = userService.selectBeesUserClass(beesUserClass);

		// 첫 페이지에서 보이는 BeesUser List 받아오는 코드
		ArrayList<BeesUserList> list = userService.selectBeesUser(beesNo);

		// 가입신청자 몇명 있는지 받아오는 코드
		ArrayList<BeesUserList> WaitersList = userService.selectBeesUserWaiters(beesNo);
		System.out.println("null확인 : " + beesNo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("WaitersList", WaitersList);
		session.setAttribute("BeesUser", beesUser);
		mav.setViewName("bees/beesUser"); // viewResolve를 통해 경로 최종 완성

		return mav;

		// return "bees/beesUser";
	}

	@RequestMapping(value = "/beesApplicant.do")
	public ModelAndView selectBeesApplicant(HttpSession session, HttpServletRequest request) {

		// BeesNo Session에서 가져오기
		int beesNo = (int) session.getAttribute("beesNo");
		// System.out.println("[beesApplicant]selectBeesUser BeesNo : "+ beesNo);

		// 서브바 필요정보들 //
		Member member = (Member) session.getAttribute("member");
		int memberNo = member.getMemberNo();

		Bees bees = bService.beesSelectOne(beesNo);
		request.setAttribute("bees", bees);
		int userCount = userService.userCount(beesNo);
		request.setAttribute("userCount", userCount);
		// 유저 정보 불러오기
		BeesUser user = userService.userSelectOne(memberNo, beesNo);
		request.setAttribute("user", user);

		// 세팅 정보 불러오기
		Setting setting = bService.selectBeesSetting(beesNo);
		request.setAttribute("setting", setting);

		System.out.println("[beesApplicant-controller] 호출");
		ArrayList<BeesUserList> list = userService.selectBeesApplicant(beesNo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("bees/beesApplicant"); // viewResolve를 통해 경로 최종 완성

		return mav;

	}

	@RequestMapping(value = "/beesUserSearch.do")

	public ModelAndView selectBeesUserSearch(HttpSession session, @RequestParam String keyword,
			HttpServletRequest request) {

		// BeesNo Session에서 가져오기
		int beesNo = (int) session.getAttribute("beesNo");
		System.out.println("selectBeesUser BeesNo : " + beesNo);

		// 서브바 필요정보들 //
		Member member = (Member) session.getAttribute("member");
		int memberNo = member.getMemberNo();

		Bees bees = bService.beesSelectOne(beesNo);
		request.setAttribute("bees", bees);
		int userCount = userService.userCount(beesNo);
		request.setAttribute("userCount", userCount);
		// 유저 정보 불러오기
		BeesUser user = userService.userSelectOne(memberNo, beesNo);
		request.setAttribute("user", user);

		// 세팅 정보 불러오기
		Setting setting = bService.selectBeesSetting(beesNo);
		request.setAttribute("setting", setting);

		System.out.println("[beesUserSearch-Controller] 호출");
		// System.out.println(beesMemberSearchKeyword);

		String option = request.getParameter("option");
		if (option == null || option.length() == 0) {
			option = "user_name";
		}

		System.out.println(option);

		// 가입신청자 몇명 있는지 받아오는 코드
		ArrayList<BeesUserList> WaitersList = userService.selectBeesUserWaiters(beesNo);

		ArrayList<BeesUserList> SearchList = userService.selectBeesUserSearch(keyword, option, beesNo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", SearchList); // ddfdsㅇ여기만 서치리스트로 바꾸시면기존에 만드신 로직으로 사용이 가능합니다.
		mav.addObject("WaitersList", WaitersList);
		mav.addObject("keyword", keyword);
		mav.addObject("option", option);
		mav.setViewName("bees/beesUser"); // viewResolve를 통해 경로 최종 완성

		return mav;

	}

	@RequestMapping(value = "/BeesUserRefusal.do")
	public String updateBeesUserRefusal(@RequestParam String userName, HttpServletResponse response)
			throws IOException {
		System.out.println("[BeesUserRefusal-conroller] 호출");

		int result = userService.updateBeesUserRefusal(userName);

		if (result > 0) {
			System.out.println("승인 거부 성공");
			response.getWriter().print(true);

		} else {
			System.out.println("승인 거부 실패");
			response.getWriter().print(false);
		}
		return null;
	}

	@RequestMapping(value = "/BeesUserApproval.do")
	public void updateBeesUserApproval(@RequestParam String userName, HttpServletResponse response) throws IOException {
		System.out.println("[BeesUserApproval-conroller] 호출");

		int result = userService.updateBeesUserApproval(userName);

		if (result > 0) {
			System.out.println("승인 승낙 성공");
			response.getWriter().print(true);

		} else {
			System.out.println("승인 승낙 실패");
			response.getWriter().print(false);
		}
	}

	// 사용자------------------------------------------------------------------------------
	// 비즈가입확인(가입 신청중인 비즈&가입신청내역)
	@RequestMapping(value = "/myPageBeesJoinQnas.do")
	public String mybeesJoinQnas(@SessionAttribute("member") Member m, HttpServletRequest request, Model model) {

		// 현재페이지 받아오기 ****************
		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int cntPage = 5;
		int cntPerPage = 5; // recordPerPage
		int start = currentPage * cntPerPage - (cntPerPage - 1);
		int end = currentPage * cntPerPage;

		int memberNo = m.getMemberNo();

		MyBeesUser mbu = new MyBeesUser();
		mbu.setMemberNo(memberNo);
		mbu.setStart(start);
		mbu.setEnd(end);

		ArrayList<MyBeesUser> askList = userService.beesJoinAsk(memberNo);
		ArrayList<MyBeesUser> askHistroyList = userService.beesJoinHistory(mbu);

		model.addAttribute("askList", askList);
		model.addAttribute("askHistroyList", askHistroyList);

		// 페이징 네비 ****************
		int totalPage = userService.totalbeesJoinHistory(memberNo);

		int naviCntPerPage = 5; // 페이징 네비에 보여줄 개수
		int lastPage; // 마지막 페이지를 저장하는 변수
		if (totalPage % cntPerPage > 0) {
			lastPage = totalPage / cntPerPage + 1;
		} else {
			lastPage = totalPage / cntPerPage;
		}

		// 현재 페이지 중심으로 pageNavi를 계산 해야함
		int startNavi = ((currentPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;

		if (endNavi > lastPage) {
			endNavi = lastPage;
		}

		// pageNavi 모양 구성 ****************
		StringBuilder sbH = new StringBuilder();

		if (startNavi != 1) {
			sbH.append("<a href='/myPageBeesJoinQnas.do?currentPage=" + (startNavi - 1) + "'>< </a> ");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sbH.append("<a href='/myPageBeesJoinQnas.do?currentPage=" + i + "'><b> " + i + "</b></a> ");
			} else {
				sbH.append("<a href='/myPageBeesJoinQnas.do?currentPage=" + i + "'> " + i + "</a> ");
			}
		}
		if (endNavi != lastPage) {
			sbH.append("<a href='/myPageBeesJoinQnas.do?currentPage=" + (endNavi + 1) + "'> ></a> ");
		}

		model.addAttribute("sbH", sbH.toString());
		return "user/myPage/beesJoinQnas";
	}

	// 비즈가입취소
	@RequestMapping(value = "/joinQnaCancel.do")
	public void joinQnaCancel(@RequestParam int userNo, HttpServletResponse response) throws IOException {

		int result = userService.joinQnaCancel(userNo);
		if (result > 0) {
			response.getWriter().print(0);
		} else {
			response.getWriter().print(1);
		}

	}

}
