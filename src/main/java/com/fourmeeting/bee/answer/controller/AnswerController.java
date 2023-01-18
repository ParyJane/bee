package com.fourmeeting.bee.answer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fourmeeting.bee.answer.model.service.AnswerService;
import com.fourmeeting.bee.answer.model.vo.Answer;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.question.model.vo.Question;
import com.google.gson.Gson;

@Controller
public class AnswerController {

	
	@Autowired
	@Qualifier(value="answerService")
	private AnswerService aService;
	
	//관리자 ------------------------------------------------------------------------
	//관리자 1:1 질문 등록하기
	@RequestMapping(value="/insertAnswer.do")
	public void insertAnswer(@RequestParam int questionNo,
							 @RequestParam int memberNo,
							 @RequestParam String answerCont, 
							 @SessionAttribute("member")Member sessionMember,
							 HttpServletResponse response) throws IOException{
		
		int adminNo = sessionMember.getMemberNo();
		
		System.out.println("Answer 여기까진 나오나?");
		System.out.println("Answer : "+questionNo);
		System.out.println("Answer : "+answerCont);
		System.out.println("answer질문번호 : "+adminNo);
		
		//textarea 엔터값 <br>로  치환
		String cont = answerCont.replace("\r\n", "<br>");
		String adminAnswerCont = cont.replace("&#10;", "<br>");
		System.out.println("answer질문내용 : "+adminAnswerCont);
		

		
		//Answer 객체에 data 담아서 넘기기
		Answer answer = new Answer();
		answer.setQuestionNo(questionNo);
		answer.setAdminNo(adminNo);
		answer.setMemberNo(memberNo);
		answer.setAnswerCont(adminAnswerCont);
		
		
		
		//비즈니스 로직 처리
		int result1 = aService.insertAnswer(answer);
		//비즈니스 로직 처리
		int result2 = aService.questionReply(questionNo);
		
		if(result1>0 && result2>0){
			System.out.println("1:1답변 등록 성공");
			response.getWriter().print(0);
		} else{
			System.out.println("1:1답변 등록 실패");
			response.getWriter().print(1);
		}
		
		
	}
	
	
	
	
	//관리자 답변 (하나만 불러오기)
	@RequestMapping(value="/selectOneAnswer.do")
	public void selectOneAnswer(@RequestParam int questionNo,
								HttpServletResponse response) throws IOException{
		
		System.out.println("selectOneAnswer : "+questionNo);
		
		Answer a = aService.selectOneAnswer(questionNo);
		String aCont = a.getAnswerCont();
		
		ArrayList list = new ArrayList();
		list.add(aCont);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		PrintWriter out = response.getWriter();
		new Gson().toJson(list, out);
		
	}
	
	
	//관리자 답변 삭제
	@RequestMapping(value="/answerDelete.do")
	public void answerDelete(@RequestParam int questionNo,
							 HttpServletResponse response) throws IOException{
		
		System.out.println("답변삭제-----"+questionNo);
		//anwer deleteYN바꿔주기(a delYN)
		int result1 = aService.answerDelete(questionNo);
		//question replyYN바꿔주기(q replyYN)
		int result2 = aService.answerDeleteQ(questionNo);
		
		if (result1>0 && result2>0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
		
	}
	
	

	//관리자 답변 수정
	@RequestMapping(value="/answerModify.do")
	public void answerModify(@RequestParam int questionNo,
							 @RequestParam String answerCont,
							 @SessionAttribute("member")Member sessionMember,
							 HttpServletResponse response) throws IOException{
		
		System.out.println("답변삭제-----"+questionNo+"/"+answerCont);
		
		Answer a = new Answer();
		a.setQuestionNo(questionNo);
		a.setAnswerCont(answerCont);
		a.setAdminNo(sessionMember.getMemberNo());
		
		int rsult = aService.answerModify(a);
		if(rsult >0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
		
	}
	
	
}
