package com.fourmeeting.bee.comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fourmeeting.bee.beesuser.model.service.BeesUserService;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.board.model.service.BoardService;
import com.fourmeeting.bee.board.model.vo.Board;
import com.fourmeeting.bee.comment.model.service.CommentService;
import com.fourmeeting.bee.comment.model.vo.BeesComment;
import com.fourmeeting.bee.comment.model.vo.MyComment;
import com.fourmeeting.bee.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class CommentController {
	
	@Resource(name="CommentService")
	private CommentService commentService;
	
	@Resource(name="BeesUserService")
	private BeesUserService userService;
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping("/insertComment.do")
	public void insertComment(@RequestParam String commentCont, @RequestParam int memberNo, @RequestParam int boardNo, HttpServletResponse response ) throws Exception{
	
		Board board = boardService.boardSelectOne(boardNo);
		BeesUser user = userService.userSelectOne(memberNo, board.getBeesNo());
		
		BeesComment comment = new BeesComment();
		comment.setCommentCont(commentCont);
		comment.setUserNo(user.getUserNo());
		comment.setBoardNo(boardNo);
		comment.setBeesNo(board.getBeesNo());
		
		
		int result = commentService.insertComment(comment);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping("/insertRecomment.do")
	public void insertRecomment(@RequestParam String commentCont, @RequestParam int memberNo, @RequestParam int boardNo, @RequestParam int recommentNo, HttpServletResponse response ) throws Exception{
	
		Board board = boardService.boardSelectOne(boardNo);
		BeesUser user = userService.userSelectOne(memberNo, board.getBeesNo());
		
		BeesComment comment = new BeesComment();
		comment.setCommentCont(commentCont);
		comment.setUserNo(user.getUserNo());
		comment.setBoardNo(boardNo);
		comment.setBeesNo(board.getBeesNo());
		comment.setRecommentNo(recommentNo);
		
		int result = commentService.insertRecomment(comment);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping("/updateComment.do")
	public void updateComment(@RequestParam String commentCont, @RequestParam int commentNo , HttpServletResponse response ) throws Exception{
		BeesComment comment = new BeesComment();
		comment.setCommentCont(commentCont);
		comment.setCommentNo(commentNo);
		
		int result = commentService.updateComment(comment);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	@RequestMapping("/deleteComment.do")
	public void deleteComment(@RequestParam int commentNo , HttpServletResponse response ) throws Exception{
		
		int result = commentService.deleteComment(commentNo);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	
	
	
		//사용자 마이페이지
		//내가쓴 댓글 리스트
		@RequestMapping(value="/myPageComment.do")
		public String mycomment(@SessionAttribute("member")Member sessionMember,
								Model model){
			
			int memberNo = sessionMember.getMemberNo();
			
			ArrayList<MyComment> list = commentService.mycomment(memberNo);
			
				model.addAttribute("list",list);
			
			return "user/myPage/comment";
		}
		
		//내가 쓴 댓글 비즈 모아보기
		@RequestMapping(value="/myPageBeesComment.do")
		public void myPageBeesComment(@SessionAttribute("member")Member sessionMember,
								HttpServletResponse response,
								@RequestParam String beesName) throws IOException{
			
			MyComment mc = new MyComment();
			mc.setMemberNo(sessionMember.getMemberNo());
			mc.setBeesName(beesName);
			
			ArrayList<MyComment> list = commentService.myPageBeesComment(mc);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				
				PrintWriter out = response.getWriter();
				new Gson().toJson(list, out);
		}
		
	
	
	
}
