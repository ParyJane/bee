package com.fourmeeting.bee.vote.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.bees.model.service.BeesService;
import com.fourmeeting.bee.beesuser.model.service.BeesUserService;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.board.model.service.BoardService;
import com.fourmeeting.bee.board.model.vo.Board;
import com.fourmeeting.bee.vote.model.service.VoteService;
import com.fourmeeting.bee.vote.model.vo.FeedVote;
import com.fourmeeting.bee.vote.model.vo.Vote;
import com.fourmeeting.bee.vote.model.vo.VoteChoice;
import com.google.gson.Gson;

@Controller
public class VoteController {
	
	@Resource(name="VoteService")
	private VoteService voteService;
	
	@Resource(name="BeesUserService")
	private BeesUserService userService;
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	
	@RequestMapping("/voteInsertItem.do")
	@ResponseBody
	public void voteInsertItem(@RequestParam int boardNo, @RequestParam int memberNo, @RequestParam String selectItem, HttpServletResponse response ) throws Exception {
		
		
		Board board = boardService.boardSelectOne(boardNo);
		Vote vote = voteService.voteSelectOne(boardNo);
		BeesUser user = userService.userSelectOne(memberNo,board.getBeesNo());
		VoteChoice voteChoice = new VoteChoice();
		voteChoice.setVoteNo(vote.getVoteNo());
		voteChoice.setVoteChoItem(selectItem);
		voteChoice.setUserNo(user.getUserNo());
		voteChoice.setUserName(user.getUserName());
		int result = voteService.voteInsertItem(voteChoice);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping("/voteEnd.do")
	public void voteEnd(@RequestParam int voteNo, HttpServletResponse response ) throws Exception {
		
		int result = voteService.voteEnd(voteNo);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(result,out);
		
		
	}
	
	@RequestMapping("/insertVote.do")
	public void insertVote(@RequestParam String voteTitle, @RequestParam String voteItem, @RequestParam char votePublicYN, @RequestParam int beesNo, @RequestParam int boardNo, @RequestParam int voteNo, HttpServletResponse response ) throws Exception {
	
		Vote vote = new Vote();
		vote.setVoteTitle(voteTitle);
		vote.setBeesNo(beesNo);
		vote.setVotePublicYN(votePublicYN);
		vote.setVoteItem(voteItem);
		vote.setBoardNo(boardNo);
		vote.setVoteNo(voteNo);
		
		int result = voteService.insertVote(vote);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping("/voteList.do")
	@ResponseBody
	public ArrayList<Vote> SelectAllVote(@RequestParam int beesNo){
		System.out.println(beesNo);
		
		ArrayList<Vote> list = voteService.selectAllVote(beesNo);
		System.out.println(list);
		System.out.println(list.get(0));
			
			return list;
	}
	
	
	
	
}
