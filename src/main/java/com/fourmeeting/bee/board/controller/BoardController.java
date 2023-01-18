package com.fourmeeting.bee.board.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fourmeeting.bee.board.model.service.BoardService;
import com.fourmeeting.bee.board.model.vo.Board;
import com.fourmeeting.bee.board.model.vo.BoardLike;
import com.fourmeeting.bee.board.model.vo.Feed;
import com.fourmeeting.bee.board.model.vo.ModifyFeed;
import com.fourmeeting.bee.comment.model.service.CommentService;
import com.fourmeeting.bee.file.model.service.FileService;
import com.fourmeeting.bee.file.model.vo.BeesFile;
import com.fourmeeting.bee.image.model.service.ImageService;
import com.fourmeeting.bee.image.model.vo.Image;
import com.fourmeeting.bee.schedule.model.service.ScheduleService;
import com.fourmeeting.bee.schedule.model.vo.Schedule;
import com.fourmeeting.bee.vote.model.service.VoteService;
import com.fourmeeting.bee.vote.model.vo.FeedVote;
import com.fourmeeting.bee.vote.model.vo.Vote;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Resource(name="BoardService")
	private BoardService boardService;
	
	@Resource(name="CommentService")
	private CommentService commentService;
	
	@Resource(name="FileService")
	private FileService fileService;
	
	@Resource(name="ImageService")
	private ImageService imageService;
	
	@Resource(name="ScheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="VoteService")
	private VoteService voteService;
	
	
	@RequestMapping(value="/feedSelectOne.do") 
	@ResponseBody
	public void feedSelectOne(@RequestParam int boardNo, HttpServletResponse response ) throws Exception {
		
		ModifyFeed ModifyFeed = boardService.feedSelectOne(boardNo);
		
		if(ModifyFeed.getFileNo()>0) {
		BeesFile file = fileService.fileSelectOne(boardNo);
		ModifyFeed.setOriginalFileName(file.getOriginalFileName());
		}else if(!(ModifyFeed.getImgNo().equals("0"))) {
		ArrayList<Image>imageList = imageService.imageSelectOneFeed(boardNo);
		String changeImageName = imageList.get(0).getChangeImageName();
		String imgNo = String.valueOf(imageList.get(0).getImgNo());
		for(int i=1;i<imageList.size();i++) {
			changeImageName = changeImageName+","+imageList.get(i).getChangeImageName();
			imgNo = imgNo+","+imageList.get(i).getImgNo();
		} 
			ModifyFeed.setChangeImageName(changeImageName);
			ModifyFeed.setImgNo(imgNo);
		}else if(ModifyFeed.getScheduleNo()>0) {
			
		Schedule schedule = scheduleService.scheduleSelectOneFeed(boardNo);
		SimpleDateFormat scheFormat = new SimpleDateFormat("yyyy년 MM월 dd일 (E)", Locale.KOREA);
		ModifyFeed.setScheduleTitle(schedule.getScheduleTitle());
		ModifyFeed.setTransStartDate(String.valueOf(scheFormat.format(schedule.getScheduleStartDate())));
		ModifyFeed.setTransEndDate(String.valueOf(scheFormat.format(schedule.getScheduleEndDate())));
		
		}else if(ModifyFeed.getVoteNo()>0) {
			
		Vote vote = voteService.voteSelectOne(boardNo);
		ModifyFeed.setVoteTitle(vote.getVoteTitle());
		ModifyFeed.setVoteEndYN(vote.getVoteEndYN());
		
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(ModifyFeed,out);
		
	
	}
	
	@RequestMapping("/insertBoardLike.do")
	public void insertBoardLike(@RequestParam int boardNo, @RequestParam int memberNo, HttpServletResponse response ) throws Exception {
		
		
		BoardLike boardLike = new BoardLike(memberNo, boardNo);
		int result = boardService.insertBoardLike(boardLike);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping("/deleteBoardLike.do")
	public void deleteBoardLike(@RequestParam int boardNo, @RequestParam int memberNo, HttpServletResponse response ) throws Exception {
		
		
		BoardLike boardLike = new BoardLike(memberNo, boardNo);
		int result = boardService.deleteBoardLike(boardLike);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping("/deleteFeed.do")
	public void deleteFeed(@RequestParam int boardNo, HttpServletResponse response ) throws Exception {
		
		Board boardInfo = boardService.boardSelectOne(boardNo);
		
		
		int voteResult;
		int scheResult;
		int fileResult;
		int imageResult;
		//vote 삭제
		
		if(boardInfo.getVoteNo()>0) {
		voteResult = voteService.deleteVote(boardInfo.getVoteNo());
		}else if(boardInfo.getScheduleNo()>0) {
		scheResult = scheduleService.deleteSchedule(boardInfo.getScheduleNo());	
		}else if(!(boardInfo.getImgNo().equals("0"))) {
		imageResult = imageService.deleteImage(boardNo);	
		}else if(boardInfo.getFileNo()>0) {
		fileResult = fileService.deleteFile(boardNo);	
		}
		
		int commentResult = commentService.deleteCommentAll(boardNo);
		int likeResult = boardService.deleteLikeAll(boardNo);
		int result = boardService.deleteBoard(boardNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		new Gson().toJson(result,out);
		
	}
	
	@RequestMapping(value="/insertBoard.do")
	public void insertBoard(@RequestParam int beesNo, @RequestParam String boardCont, @RequestParam int memberNo, @RequestParam String beesFunction, @RequestParam int imageCount, HttpServletResponse response ) throws Exception {
		
		Board board = new Board();
		board.setBeesNo(beesNo);
		String boardContent = null;
		
		int number = boardCont.indexOf("div class");
		if(number!=-1) {
		boardContent = boardCont.substring(0, number-1);
		}else {
			number = boardCont.indexOf("div style");
			if(number!=-1) {
				boardContent = boardCont.substring(0, number-1);
			}else {
			boardContent = boardCont;
			}
		}
		System.out.println(number);
		System.out.println("여기까지");
		board.setBoardCont(boardContent);
		System.out.println(boardContent);
		board.setMemberNo(memberNo);
		
		String imageNo = "0" ;
		for(int i=0; i<imageCount; i++) {
			int imgNo = imageService.selectImageNo();
			if(i==0) {
				imageNo =String.valueOf(imgNo);
			}else {
				imageNo = imageNo+","+imgNo;
			}	
		}
		board.setImgNo(imageNo);
		System.out.println(imageNo);
		
		Board newBoard = boardService.insertBoard(board,beesFunction);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		ArrayList<Object> resultSet = new ArrayList<Object>();
		resultSet.add(board);
		resultSet.add(imageNo);
		
		
		new Gson().toJson(resultSet,out);
		
		
		
		
		
		
	}
	
	
	@RequestMapping(value="/updateBoard.do")
	public void updateBoard(@RequestParam int boardNo, @RequestParam String boardCont, @RequestParam int delFunction, @RequestParam String delImage, HttpServletResponse response ) throws Exception  {
			
		Board board = boardService.boardSelectOne(boardNo);
		
		if(delFunction>0||delImage!=null) { //수정시 기능 삭제
			
			String boardContent = boardCont;
			int number = boardCont.indexOf("div class");
			if(number!=-1) {
			boardContent = boardCont.substring(0, number-1);
			}else {
				number = boardCont.indexOf("div style");
				if(number!=-1) {
					boardContent = boardCont.substring(0, number-1);
				}else {
				boardContent = boardCont;
				}
			}
			
			board.setBoardCont(boardContent);
			
			if(board.getVoteNo()>0) {
				int voteResult = voteService.deleteVote(board.getVoteNo());
				if(voteResult>0) {board.setVoteNo(0);}
				}else if(board.getScheduleNo()>0) {
				int scheResult = scheduleService.deleteSchedule(board.getScheduleNo());
				if(scheResult>0) {board.setScheduleNo(0);}
				}else if(!(board.getImgNo().equals("0"))) {
				StringTokenizer st = new StringTokenizer(delImage,",");
				String imageList = board.getImgNo();
				while(st.hasMoreTokens()) {
					int imgNo = Integer.parseInt(st.nextToken());
					int imageResult = imageService.deleteImageSeparate(imgNo);
					imageList = delImage.replace((imgNo+","),"");
				}
				if(imageList.length()==0) {
					board.setImgNo("0");
				}else {
					board.setImgNo(imageList.substring(0,imageList.length()-1));
				}
				
				}else if(board.getFileNo()>0) {
				int fileResult = fileService.deleteFile(boardNo);
				if(fileResult>0) {board.setFileNo(0);}	
				}
			
			
		}else {//글 내용만 수정 //boardCont<div>앞으로 자르기
			
			String boardContent = boardCont;
			int number = boardCont.indexOf("div class");
			if(number!=-1) {
			boardContent = boardCont.substring(0, number-1);
			}else {
				number = boardCont.indexOf("div style");
				if(number!=-1) {
					boardContent = boardCont.substring(0, number-1);
				}else {
				boardContent = boardCont;
				}
			}
			
		}
		
		int result = boardService.updateBoard(board);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(result,out);
		
	}
	
	
	
}
