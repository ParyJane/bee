package com.fourmeeting.bee.question.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.bees.model.vo.BeesAdmin;
import com.fourmeeting.bee.bees.model.vo.BeesAdminSearch;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.question.model.service.QuestionService;
import com.fourmeeting.bee.question.model.vo.AdminQuestionSearch;
import com.fourmeeting.bee.question.model.vo.QnA;
import com.fourmeeting.bee.question.model.vo.Question;
import com.google.gson.Gson;


@Controller
public class QuestionController {

	@Autowired
	@Qualifier(value="questionService")
	private QuestionService qService;
	
	
	
	//사용자 ------------------------------------------------------------------------
	
	//1:1문의 페이지 이동
	@RequestMapping(value="/myPageAsk.do")
	public String myask(){
		return "user/myPage/ask";
	}
	
	//1:1문의 작성
	@RequestMapping(value="/insertQuestion.do")
	public String insertQuestion(@RequestParam int ask_select,
							   @RequestParam String myquestion, 
							   @RequestParam String myquestion_title,
							   @SessionAttribute("member")Member sessionMember,
							   Model model){
		
		
		//숫자로 받아온 분류 한글로 다시 저장
		String questionCategory = null;
		switch(ask_select){
		case 1 : questionCategory = "비즈 건의사항"; break;
		case 2 : questionCategory = "비즈 오류"; break;
		case 3 : questionCategory = "기타"; break;
		}
		System.out.println("분류 : "+questionCategory);
		
		
		//textarea 엔터값 <br>로  치환
		String questionContOne = myquestion.replace("\r\n", "<br>");
		String questionCont = questionContOne.replace("&#10;", "<br>");
		System.out.println("질문내용 : "+questionCont);
		
		
		//세션에서 memberNo번호 받아오기
		int memberNo = sessionMember.getMemberNo();
		System.out.println("회원 번호 : "+memberNo);
		
		
		//Question 객체에 data 담아서 넘기기
		Question question = new Question();
		question.setQuestionCategory(questionCategory);
		question.setQuestionCont(questionCont);
		question.setMemberNo(memberNo);
		question.setQuestionTitle(myquestion_title);
		
		
		//비즈니스 로직 처리
		int result = qService.insertQuestion(question);
		if(result>0){
			System.out.println("1:1문의 등록 성공");
		} else{
			System.out.println("1:1문의 등록 실패");
		}
		return "user/myPage/ask";
		
	}
	
	
	//나의 문의 내역 (리스트 불러오기)
	@RequestMapping(value="/myPageQnaHistory.do")
	public String myQnaHistory(@SessionAttribute("member")Member sessionMember,
							   Model model){
		
		int memberNo = sessionMember.getMemberNo();
		System.out.println("나의 문의 내역 : "+memberNo);
		
		ArrayList<QnA> list = qService.myQnaHistory(memberNo);
		
		model.addAttribute("list",list);
		return "user/myPage/qnaHistory";
	}
	
	
	//나의 문의 내역 (하나만 불러오기)
	@RequestMapping(value="/selectOneQuestion.do")
	public void selectOneQuestion(@RequestParam int questionNo,
								HttpServletResponse response) throws IOException{
		
		System.out.println("selectOneQ : "+questionNo);
		
		Question q = qService.selectOneQuestion(questionNo);
		String qTitle = q.getQuestionTitle();
		String qCont = q.getQuestionCont();
		String qContRe = qCont.replace("<br>", "&#10;");
		char qReply = q.getReplyYN();
		int qMemebrNo = q.getMemberNo();
		
		ArrayList list = new ArrayList();
		list.add(qTitle);
		list.add(qContRe);
		list.add(qReply);
		list.add(qMemebrNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		PrintWriter out = response.getWriter();
		new Gson().toJson(list, out);
		
	}
	
	//문의 내역 수정
	@RequestMapping(value="/questionModify.do")
	public void questionModify(@RequestParam String questionCont,
								@RequestParam int questionNo,
								HttpServletResponse response) throws IOException {
		
		Question q = new Question();
		q.setQuestionNo(questionNo);
		q.setQuestionCont(questionCont);
		
		System.out.println("수정하기-----"+questionNo);
		String questionContOne = questionCont.replace("\r\n", "<br>");
		//여기서 이게 안먹어요
		
		int result = qService.questionModify(q);
		if (result>0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
		
		
	}
	
	
	
	//문의 내역 삭제
	@RequestMapping(value="/questionDelete.do")
	public void questionDelete(@RequestParam int questionNo,
								HttpServletResponse response) throws IOException{
		
		System.out.println("내역삭제-----"+questionNo);
		int result = qService.questionDelete(questionNo);
		
		if (result>0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}
	
	//문의 내역 복구
	@RequestMapping(value="/questionRollback.do")
	public void questionRollback(@RequestParam int questionNo,
								HttpServletResponse response) throws IOException{
		
		System.out.println("내역삭제-----"+questionNo);
		int result = qService.questionRollback(questionNo);
		
		if (result>0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}
	
	
	
	//관리자 ------------------------------------------------------------------------
	//관리자 1:1 문의 불러오기
	@RequestMapping(value="/adminQuestion.do")
	public String adminQuestion(Model model,
								HttpServletRequest request){
		
		
		
		//현재페이지 받아오기 ****************
		int currentPage;
		
		if(request.getParameter("currentPage") == null){
			currentPage = 1;
		} else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int cntPage = 5;
		int cntPerPage = 10; //recordPerPage
		int start = currentPage*cntPerPage-(cntPerPage-1);
		int end = currentPage*cntPerPage;
		
		PagingVO pv = new PagingVO();
		pv.setCurrentPage(currentPage);
		pv.setCntPage(cntPage);
		pv.setCntPerPage(cntPerPage);
		pv.setStart(start);
		pv.setEnd(end);
		
		
		//페이징 네비 ****************
		int totalPage = qService.countQuestion();
		
		int naviCntPerPage = 5; //페이징 네비에 보여줄 개수
		int lastPage; 			//마지막 페이지를 저장하는 변수
		if(totalPage % cntPerPage>0){
			lastPage = totalPage / cntPerPage +1;
		}else{
			lastPage = totalPage / cntPerPage;
		}
		
		//현재 페이지 중심으로 pageNavi를 계산 해야함
		int startNavi = ((currentPage-1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage -1;
		
		if(endNavi > lastPage){
			endNavi = lastPage;
		}
		
		
		//pageNavi 모양 구성 ****************
		StringBuilder sb = new StringBuilder();
		
		if(startNavi != 1){
			sb.append("<a href='/adminQuestion.do?currentPage="+(startNavi-1)+"'>< </a> ");
		}
		for(int i=startNavi; i<=endNavi; i++){
			if(i==currentPage){
				sb.append("<a href='/adminQuestion.do?currentPage="+i+"'><b> "+i+"</b></a> ");
			}else{
				sb.append("<a href='/adminQuestion.do?currentPage="+i+"'> "+i+"</a> ");
			}
		}
		if(endNavi != lastPage){
			sb.append("<a href='/adminQuestion.do?currentPage="+(endNavi+1)+"'> ></a> ");
		}
		
		
		
		//리스트 불러오기  ****************
		ArrayList<QnA> list = qService.adminQuestionList(pv);
		
		
		model.addAttribute("sb",sb.toString());
		model.addAttribute("list",list);
		return "admin/adminQuestion";
	}
	
	
	//관리자 1:1 문의 검색
	@RequestMapping(value="/adminQuestionSearch.do")
	public String adminQuestionSearch(@RequestParam String startDate,
								@RequestParam String endDate,
								@RequestParam int searchSelect,
								@RequestParam String search,
								HttpServletRequest request,
								Model model){
		
		
		AdminQuestionSearch aqs = new AdminQuestionSearch();
		aqs.setStartDate(startDate);
		aqs.setEndDate(endDate);
		aqs.setSearchSelect(searchSelect);
		aqs.setSearch(search);
		
		//전체 리스트 불러오기 ****************
		ArrayList<QnA> list = qService.adminQuestionSearch(aqs);
		System.out.println(list.size());
		
		//현재페이지 받아오기 ****************
		int currentPage;
						
		if(request.getParameter("currentPage") == null){
			currentPage = 1;
		} else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		int cntPage = 5;
		int cntPerPage = 10; //recordPerPage
		int start = currentPage*cntPerPage-(cntPerPage-1);
		int end = currentPage*cntPerPage;
						
		PagingVO pv = new PagingVO();
		pv.setCurrentPage(currentPage);
		pv.setCntPage(cntPage);
		pv.setCntPerPage(cntPerPage);
		pv.setStart(start);
		pv.setEnd(end);
						
						
		//페이징 네비 ****************
		int totalPage = list.size();
						
		int naviCntPerPage = 5; //페이징 네비에 보여줄 개수
		int lastPage; 			//마지막 페이지를 저장하는 변수
		if(totalPage % cntPerPage>0){
			lastPage = totalPage / cntPerPage +1;
		}else{
			lastPage = totalPage / cntPerPage;
		}
						
		//현재 페이지 중심으로 pageNavi를 계산 해야함
		int startNavi = ((currentPage-1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage -1;
						
						
		if(endNavi > lastPage){
			endNavi = lastPage;
		}
						
		//pageNavi 모양 구성 ****************
		StringBuilder sb = new StringBuilder();
		
		if(startNavi != 1){
			sb.append("<a href='/adminQuestion.do?currentPage="+(startNavi-1)+"'>< </a> ");
		}
		for(int i=startNavi; i<=endNavi; i++){
			if(i==currentPage){
				sb.append("<a href='/adminQuestion.do?currentPage="+i+"'><b> "+i+"</b></a> ");
			}else{
				sb.append("<a href='/adminQuestion.do?currentPage="+i+"'> "+i+"</a> ");
			}
		}
		if(endNavi != lastPage){
			sb.append("<a href='/adminQuestion.do?currentPage="+(endNavi+1)+"'> ></a> ");
		}
		
		
		model.addAttribute("sb",sb.toString());
		model.addAttribute("list",list);
		
		return "admin/adminQuestion";
		
	};
	
	
	
}
