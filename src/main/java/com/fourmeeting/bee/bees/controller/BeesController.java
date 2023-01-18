package com.fourmeeting.bee.bees.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.bees.model.service.BeesService;
import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.BeesAdmin;
import com.fourmeeting.bee.bees.model.vo.BeesAdminSearch;
import com.fourmeeting.bee.bees.model.vo.Setting;
import com.fourmeeting.bee.beesuser.model.service.BeesUserService;
import com.fourmeeting.bee.beesuser.model.vo.BeesUser;
import com.fourmeeting.bee.beesuser.model.vo.BeesUserList;
import com.fourmeeting.bee.board.model.service.BoardService;
import com.fourmeeting.bee.board.model.vo.BoardLike;
import com.fourmeeting.bee.board.model.vo.Feed;
import com.fourmeeting.bee.comment.model.service.CommentService;
import com.fourmeeting.bee.comment.model.vo.FeedComment;
import com.fourmeeting.bee.file.model.service.FileService;
import com.fourmeeting.bee.file.model.vo.BeesFile;
import com.fourmeeting.bee.image.model.service.ImageService;
import com.fourmeeting.bee.image.model.vo.Image;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.schedule.model.service.ScheduleService;
import com.fourmeeting.bee.schedule.model.vo.Schedule;
import com.fourmeeting.bee.userpage.model.service.UserPageService;
import com.fourmeeting.bee.vote.model.service.VoteService;
import com.fourmeeting.bee.vote.model.vo.FeedVote;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller("beesController")
public class BeesController {
	@Autowired
	ServletContext beeCreateContext;
	
	@Autowired
	@Qualifier(value = "userPageService")
	private UserPageService uService;
	
	@Autowired
	@Qualifier(value = "beesService")
	private BeesService bService;
	
	@Resource(name="BeesUserService")
	private BeesUserService userService;
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	@Resource(name="CommentService")
	private CommentService commentService;
	
	@Resource(name="VoteService")
	private VoteService voteService;

	@Resource(name="FileService")
	private FileService fileService;
	
	@Resource(name="ImageService")
	private ImageService imageService;
	
	@Resource(name="ScheduleService")
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/beeCreateMain.do")
	public String beeCreateMain()
	{
			return "/bees/beeCreate/Main";
		
	}	
	@RequestMapping(value="/beeCreateSub.do")
	public String beeCreateSub()
	{
			return "/bees/beeCreate/Sub";
		
	}
	

	
	@RequestMapping(value="/beesSelectOne.do")
	private String beesSelectOne(@RequestParam int beesNo, HttpServletRequest request, HttpSession session) throws Exception {
		
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
		
		
		//댓글을 불러오자
		ArrayList<FeedComment> commentAll=commentService.commentSelectAll(beesNo);
		HashMap<Integer, ArrayList<FeedComment>> commentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		HashMap<Integer, ArrayList<FeedComment>> recommentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		for(int i=0; i<commentAll.size();i++) {
			
			FeedComment comment = commentAll.get(i);
			
			if(comment.getRecommentNo()>0) {
				
				if(recommentMap.get(comment.getRecommentNo())==null) {
					
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = recommentMap.get(comment.getRecommentNo());
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
					
				}
				
				
			}else{
				
				if(commentMap.get(comment.getBoardNo())==null) {
				
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = commentMap.get(comment.getBoardNo());
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
					
				}			
			}
		}
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("recommentMap", recommentMap);	
		
		//투표보여주기
		ArrayList<FeedVote> voteList = voteService.voteSelectAll(beesNo);
		HashMap<Integer, ArrayList<FeedVote>> voteMap = new HashMap<Integer, ArrayList<FeedVote>>();
		for(FeedVote vote : voteList) {
			if(voteMap.get(vote.getVoteNo())==null) {	
				ArrayList<FeedVote> list = new ArrayList<FeedVote>();
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}else {
				ArrayList<FeedVote> list = voteMap.get(vote.getVoteNo());
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}
		}
		request.setAttribute("voteMap", voteMap);
		
		//일정보여주기	
		
		
		ArrayList<Schedule> scheduleList = scheduleService.scheduleSelectAll(beesNo);
		HashMap<Integer, Schedule> scheduleMap = new HashMap<Integer, Schedule>();
		for(Schedule sche : scheduleList) {
			scheduleMap.put(sche.getBoardNo(),sche);
		}
		request.setAttribute("scheduleMap", scheduleMap);
		
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAll(beesNo);
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		
		//파일보여주기
		ArrayList<BeesFile> fileList = fileService.fileSelectAll(beesNo);
		HashMap<Integer, BeesFile> fileMap = new HashMap<Integer, BeesFile>();
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getFileNo()>0) {
			fileMap.put(fileList.get(i).getBoardNo(),fileList.get(i));
			}
		}
		request.setAttribute("fileMap",fileMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		
		
		return "/bees/main/beesMainPage";
		
	
	}
	
	@RequestMapping(value="/beesSearchOne.do")
	private String beesSearchOne(@RequestParam int beesNo, HttpSession session, @RequestParam String keyword, HttpServletRequest request) throws Exception {
		
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		request.setAttribute("keyword", keyword);
		
		Bees bees = bService.beesSelectOne(beesNo);
		request.setAttribute("bees", bees);
		int userCount = userService.userCount(beesNo);
		request.setAttribute("userCount", userCount);
		//유저 정보 불러오기
		BeesUser user = userService.userSelectOne(memberNo, beesNo);
		request.setAttribute("user", user);
		ArrayList<Feed> feedList = boardService.boardSearchAll(beesNo,keyword);
		request.setAttribute("feedList", feedList);

		
		//댓글을 불러오자
		ArrayList<FeedComment> commentAll=commentService.commentSelectAll(beesNo);
		HashMap<Integer, ArrayList<FeedComment>> commentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		HashMap<Integer, ArrayList<FeedComment>> recommentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		for(int i=0; i<commentAll.size();i++) {
			
			FeedComment comment = commentAll.get(i);
			
			if(comment.getRecommentNo()>0) {
				
				if(recommentMap.get(comment.getRecommentNo())==null) {
					
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = recommentMap.get(comment.getRecommentNo());
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
					
				}
				
				
			}else{
				
				if(commentMap.get(comment.getBoardNo())==null) {
				
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = commentMap.get(comment.getBoardNo());
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
					
				}			
			}
		}
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("recommentMap", recommentMap);	
		
		//투표보여주기
		ArrayList<FeedVote> voteList = voteService.voteSelectAll(beesNo);
		HashMap<Integer, ArrayList<FeedVote>> voteMap = new HashMap<Integer, ArrayList<FeedVote>>();
		for(FeedVote vote : voteList) {
			if(voteMap.get(vote.getVoteNo())==null) {	
				ArrayList<FeedVote> list = new ArrayList<FeedVote>();
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}else {
				ArrayList<FeedVote> list = voteMap.get(vote.getVoteNo());
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}
		}
		request.setAttribute("voteMap", voteMap);
		
		//일정보여주기	
		
		
		ArrayList<Schedule> scheduleList = scheduleService.scheduleSelectAll(beesNo);
		HashMap<Integer, Schedule> scheduleMap = new HashMap<Integer, Schedule>();
		for(Schedule sche : scheduleList) {
			scheduleMap.put(sche.getBoardNo(),sche);
		}
		request.setAttribute("scheduleMap", scheduleMap);
		
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAll(beesNo);
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		
		//파일보여주기
		ArrayList<BeesFile> fileList = fileService.fileSelectAll(beesNo);
		HashMap<Integer, BeesFile> fileMap = new HashMap<Integer, BeesFile>();
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getFileNo()>0) {
			fileMap.put(fileList.get(i).getBoardNo(),fileList.get(i));
			}
		}
		request.setAttribute("fileMap",fileMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		
		
		
		//세팅 정보 불러오기
		Setting setting = bService.selectBeesSetting(beesNo);
		request.setAttribute("setting", setting);
		
		return "/bees/main/beesSearchPage";
		
	
	}
	
	
	@RequestMapping(value="/myPageBoard.do")
	private String myPageBoard(HttpSession session, HttpServletRequest request) throws Exception {
		
		
		Member member = (Member)session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		ArrayList<Feed> feedList = boardService.boardSelectMine(memberNo);
		request.setAttribute("feedList", feedList);
		
		
		List<Integer> beesNo = userService.selectAllBeesNo(memberNo);
		if(beesNo.isEmpty()) {
			beesNo.add(0);
		}else {
			
		}
		//댓글을 불러오자
		ArrayList<FeedComment> commentAll=commentService.commentSelectAllMyBees(beesNo);
		
		
		
		
		HashMap<Integer, ArrayList<FeedComment>> commentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		HashMap<Integer, ArrayList<FeedComment>> recommentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		for(int i=0; i<commentAll.size();i++) {
			
			FeedComment comment = commentAll.get(i);
			
			if(comment.getRecommentNo()>0) {
				
				if(recommentMap.get(comment.getRecommentNo())==null) {
					
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = recommentMap.get(comment.getRecommentNo());
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
					
				}
				
				
			}else{
				
				if(commentMap.get(comment.getBoardNo())==null) {
				
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = commentMap.get(comment.getBoardNo());
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
					
				}			
			}
		}
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("recommentMap", recommentMap);	
		
		
		//투표보여주기
		ArrayList<FeedVote> voteList = voteService.voteSelectAllMyBees(beesNo);
		HashMap<Integer, ArrayList<FeedVote>> voteMap = new HashMap<Integer, ArrayList<FeedVote>>();
		for(FeedVote vote : voteList) {
			if(voteMap.get(vote.getVoteNo())==null) {	
				ArrayList<FeedVote> list = new ArrayList<FeedVote>();
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}else {
				ArrayList<FeedVote> list = voteMap.get(vote.getVoteNo());
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}
		}
		request.setAttribute("voteMap", voteMap);
		
		//일정보여주기	
		
		
		ArrayList<Schedule> scheduleList = scheduleService.scheduleSelectAllMyBees(beesNo);
		HashMap<Integer, Schedule> scheduleMap = new HashMap<Integer, Schedule>();
		for(Schedule sche : scheduleList) {
			scheduleMap.put(sche.getBoardNo(),sche);
		}
		request.setAttribute("scheduleMap", scheduleMap);
		
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAllMyBees(beesNo);
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		
		//파일보여주기
		ArrayList<BeesFile> fileList = fileService.fileSelectAllMyBees(beesNo);
		HashMap<Integer, BeesFile> fileMap = new HashMap<Integer, BeesFile>();
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getFileNo()>0) {
			fileMap.put(fileList.get(i).getBoardNo(),fileList.get(i));
			}
		}
		request.setAttribute("fileMap",fileMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		return "/user/myPage/board";
		
	
	}
	
	@RequestMapping(value="/myPageHeart.do")
	private String myPageHeart(HttpSession session, HttpServletRequest request) throws Exception {
		
		
		Member member = (Member)session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		ArrayList<Feed> feedList = boardService.boardSelectLiked(memberNo);
		request.setAttribute("feedList", feedList);
		
		
		List<Integer> beesNo = userService.selectAllBeesNo(memberNo);
		if(beesNo.isEmpty()) {
			beesNo.add(0);
		}else {
			
		}
		//댓글을 불러오자
		ArrayList<FeedComment> commentAll=commentService.commentSelectAllMyBees(beesNo);
		
		
		
		
		HashMap<Integer, ArrayList<FeedComment>> commentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		HashMap<Integer, ArrayList<FeedComment>> recommentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		for(int i=0; i<commentAll.size();i++) {
			
			FeedComment comment = commentAll.get(i);
			
			if(comment.getRecommentNo()>0) {
				
				if(recommentMap.get(comment.getRecommentNo())==null) {
					
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = recommentMap.get(comment.getRecommentNo());
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
					
				}
				
				
			}else{
				
				if(commentMap.get(comment.getBoardNo())==null) {
				
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = commentMap.get(comment.getBoardNo());
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
					
				}			
			}
		}
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("recommentMap", recommentMap);	
		
		
		//투표보여주기
		ArrayList<FeedVote> voteList = voteService.voteSelectAllMyBees(beesNo);
		HashMap<Integer, ArrayList<FeedVote>> voteMap = new HashMap<Integer, ArrayList<FeedVote>>();
		for(FeedVote vote : voteList) {
			if(voteMap.get(vote.getVoteNo())==null) {	
				ArrayList<FeedVote> list = new ArrayList<FeedVote>();
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}else {
				ArrayList<FeedVote> list = voteMap.get(vote.getVoteNo());
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}
		}
		request.setAttribute("voteMap", voteMap);
		
		//일정보여주기	
		
		
		ArrayList<Schedule> scheduleList = scheduleService.scheduleSelectAllMyBees(beesNo);
		HashMap<Integer, Schedule> scheduleMap = new HashMap<Integer, Schedule>();
		for(Schedule sche : scheduleList) {
			scheduleMap.put(sche.getBoardNo(),sche);
		}
		request.setAttribute("scheduleMap", scheduleMap);
		
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAllMyBees(beesNo);
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		
		//파일보여주기
		ArrayList<BeesFile> fileList = fileService.fileSelectAllMyBees(beesNo);
		HashMap<Integer, BeesFile> fileMap = new HashMap<Integer, BeesFile>();
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getFileNo()>0) {
			fileMap.put(fileList.get(i).getBoardNo(),fileList.get(i));
			}
		}
		request.setAttribute("fileMap",fileMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		return "/user/myPage/heart";
		
	
	}
	
	@RequestMapping(value="/myBeesPage.do")
	private String selectMainPage(HttpServletRequest request, HttpSession session) throws Exception {

		Member m = (Member)session.getAttribute("member");
		
		ArrayList<Bees> beesList = uService.selectMyBees(m);
		request.setAttribute("beesList", beesList);
		
		int memberNo = m.getMemberNo();
		
		List<Integer> beesNo = userService.selectAllBeesNo(memberNo);
		if(beesNo.isEmpty()) {
			beesNo.add(0);
		}else {
			
		}
		
		
		ArrayList<Feed> feedList = boardService.boardSelectAllBees(beesNo);
		request.setAttribute("feedList", feedList);
		
		
		
		//댓글을 불러오자
		ArrayList<FeedComment> commentAll=commentService.commentSelectAllMyBees(beesNo);
		
		
		
		
		HashMap<Integer, ArrayList<FeedComment>> commentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		HashMap<Integer, ArrayList<FeedComment>> recommentMap = new HashMap<Integer, ArrayList<FeedComment>>();
		for(int i=0; i<commentAll.size();i++) {
			
			FeedComment comment = commentAll.get(i);
			
			if(comment.getRecommentNo()>0) {
				
				if(recommentMap.get(comment.getRecommentNo())==null) {
					
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = recommentMap.get(comment.getRecommentNo());
					list.add(comment);
					recommentMap.put(comment.getRecommentNo(),list);
					
				}
				
				
			}else{
				
				if(commentMap.get(comment.getBoardNo())==null) {
				
					ArrayList<FeedComment> list = new ArrayList<FeedComment>();
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
				
				}else {
					
					ArrayList<FeedComment> list = commentMap.get(comment.getBoardNo());
					list.add(comment);
					commentMap.put(comment.getBoardNo(),list);
					
				}			
			}
		}
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("recommentMap", recommentMap);	
		
		
		//투표보여주기
		ArrayList<FeedVote> voteList = voteService.voteSelectAllMyBees(beesNo);
		HashMap<Integer, ArrayList<FeedVote>> voteMap = new HashMap<Integer, ArrayList<FeedVote>>();
		for(FeedVote vote : voteList) {
			if(voteMap.get(vote.getVoteNo())==null) {	
				ArrayList<FeedVote> list = new ArrayList<FeedVote>();
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}else {
				ArrayList<FeedVote> list = voteMap.get(vote.getVoteNo());
				list.add(vote);
				voteMap.put(vote.getVoteNo(),list);
			}
		}
		request.setAttribute("voteMap", voteMap);
		
		//일정보여주기	
		
		
		ArrayList<Schedule> scheduleList = scheduleService.scheduleSelectAllMyBees(beesNo);
		HashMap<Integer, Schedule> scheduleMap = new HashMap<Integer, Schedule>();
		for(Schedule sche : scheduleList) {
			scheduleMap.put(sche.getBoardNo(),sche);
		}
		request.setAttribute("scheduleMap", scheduleMap);
		
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAllMyBees(beesNo);
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		
		//파일보여주기
		ArrayList<BeesFile> fileList = fileService.fileSelectAllMyBees(beesNo);
		HashMap<Integer, BeesFile> fileMap = new HashMap<Integer, BeesFile>();
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getFileNo()>0) {
			fileMap.put(fileList.get(i).getBoardNo(),fileList.get(i));
			}
		}
		request.setAttribute("fileMap",fileMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		return "/user/main/myBeesPage";
		
	
	}
	
	@RequestMapping(value="/bestFeedPage.do")
	private String bestFeedPage(HttpServletRequest request, HttpSession session) throws Exception {

		Member m = (Member)session.getAttribute("member");
		ArrayList<Bees> beesList = uService.selectMyBees(m);
		request.setAttribute("beesList", beesList);
		
		int memberNo = m.getMemberNo();
		
		List<Integer> beesNo = userService.selectAllBeesNo(memberNo);
		if(beesNo.isEmpty()) {
			beesNo.add(0);
		}else {
			
		}
		
		request.setAttribute("beesNoList", (ArrayList<Integer>)beesNo);
		ArrayList<Feed> feedList = boardService.selectAllBestFeed();
		request.setAttribute("feedList", feedList);
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAllBees();
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		return "/user/main/bestFeedPage";
		
	
	}
	
	@RequestMapping(value="/feedSearchResult.do")
	private String feedSearchResult(@RequestParam String keyword, HttpServletRequest request, HttpSession session) throws Exception {

		Member m = (Member)session.getAttribute("member");
		ArrayList<Bees> beesList = uService.selectMyBees(m);
		request.setAttribute("beesList", beesList);
		
		int memberNo = m.getMemberNo();
		
		List<Integer> beesNo = userService.selectAllBeesNo(memberNo);
		if(beesNo.isEmpty()) {
			beesNo.add(0);
		}else {
			
		}
		request.setAttribute("beesNoList", (ArrayList<Integer>)beesNo);
		ArrayList<Feed> feedList = boardService.selectSerachAllFeed(keyword);
		request.setAttribute("keyword", keyword);
		request.setAttribute("feedList", feedList);
		
		//이미지보여주기
		ArrayList<Image> imageList = imageService.imageSelectAllBees();
		HashMap<Integer, ArrayList<Image>> imageMap = new HashMap<Integer, ArrayList<Image>>();
		for(Image image : imageList) {
			if(imageMap.get(image.getBoardNo())==null) {	
				ArrayList<Image> list = new ArrayList<Image>();
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}else {
				ArrayList<Image> list = imageMap.get(image.getBoardNo());
				list.add(image);
				imageMap.put(image.getBoardNo(),list);
			}
		}
		request.setAttribute("imageMap", imageMap);
		
		//내가 좋아한 보드 리스트 보여주기
		ArrayList<BoardLike> boardLikeList = boardService.selectAllLike(memberNo);
		HashMap<Integer, Integer> myLikeMap = new HashMap<Integer, Integer>();
		for(int i=0; i<boardLikeList.size();i++) {
			myLikeMap.put(boardLikeList.get(i).getBoardNo(), boardLikeList.get(i).getBoardNo());
		}
		request.setAttribute("likeMap", myLikeMap);
		
		return "/user/search/feedSearchResult";
		
	
	}
	
	@RequestMapping(value="/beeCreate.do")
	public String requestupload1(Model model, HttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) mtfRequest;
        MultipartFile mf = multipartRequest.getFile("imgInput");
        String uploadPath = "/resources/image/beeCreateProfile/";
        String encType="UTF-8";
	    String realUploadPath = beeCreateContext.getRealPath(uploadPath);
        String path = realUploadPath;
        System.out.println("path : " + path);
        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        long fileSize = mf.getSize(); // 파일 사이즈
        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);
        String safeFile = path + System.currentTimeMillis() + originFileName+"_bee";
        System.out.println("safeFile : " + safeFile);
        String beeCreateProfile = System.currentTimeMillis() + originFileName+"_bee";
        System.out.println("beeCreateProfile : " + beeCreateProfile);     
        System.out.println("safeFile : " + safeFile);
        try {
            mf.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        char beesPublicYN = 0;
		Bees bee = new Bees(); 
		bee.setBeesName(mtfRequest.getParameter("beeName"));
		System.out.println("비즈이름 미리보기:"+bee.getBeesName());
		String beeCover = mtfRequest.getParameter("beeCoverImage");
		
		if(fileSize==0){
		bee.setBeesCover(beeCover);
		System.out.println("파일명 미리보기:"+bee.getBeesCover());
		}else{
		bee.setBeesCover(beeCreateProfile);
		System.out.println("파일명 미리보기:"+bee.getBeesCover());	
		}	
		bee.setBeesCategory(mtfRequest.getParameter("category"));	
		bee.setBeesHost(mtfRequest.getParameter("beesHost"));
		bee.setBeesHostNo(Integer.parseInt(mtfRequest.getParameter("beesHostNo")));
		String beesPublic = mtfRequest.getParameter("beeType");
		if(beesPublic.equals("public")){
			beesPublicYN ='Y';
		}else{
			beesPublicYN ='N';
		}
		bee.setBeesPublicYN(beesPublicYN);		
		bee.setBeesHostName(bee.getBeesName());
		System.out.println("비즈 카테고리 미리보기:"+bee.getBeesCategory());
		System.out.println("비즈 개설자:"+bee.getBeesHost());
		System.out.println("비즈 공개 비공개:"+bee.getBeesPublicYN());		
		int beeResult = bService.insertBee(bee);
		int beehostResult = bService.insertHostBeeUser(bee);
		int beeSetting = bService.insertSetting(bee);		
		if (beeResult > 0 && beeSetting >0 && beehostResult >0) {
			model.addAttribute("msg", "비즈가 성공적으로 만들어졌습니다");
		} else {
			model.addAttribute("msg", "비즈 생성이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/myBeesPage.do?memberNo="+bee.getBeesHostNo());	
		return "/bees/beeCreate/beeResult";      
    }
	
	@RequestMapping(value="/coverUpdateSet.do")
	public String coverUpdateSet(Model model, HttpServletRequest mtfRequest) throws IOException, UnsupportedEncodingException {	
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) mtfRequest;
	        MultipartFile mf = multipartRequest.getFile("imgInput");
	        String uploadPath = "/resources/image/beeCreateProfile/";
	        String encType="UTF-8";
		    String realUploadPath = beeCreateContext.getRealPath(uploadPath);
	
	        String path = realUploadPath;
	        System.out.println("path : " + path);
	
	        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	        long fileSize = mf.getSize(); // 파일 사이즈
	
	        System.out.println("originFileName : " + originFileName);
	        System.out.println("fileSize : " + fileSize);
	
	        String safeFile = path + System.currentTimeMillis() + originFileName+"_bee";
	        System.out.println("safeFile : " + safeFile);
	        String beeCreateProfile = System.currentTimeMillis() + originFileName+"_bee";
	        System.out.println("beeCreateProfile : " + beeCreateProfile);
	
	        
	        System.out.println("safeFile : " + safeFile);
	        try {
	            mf.transferTo(new File(safeFile));
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
							
			Bees bee = new Bees(); 
			bee.setBeesNo(Integer.parseInt(mtfRequest.getParameter("beesNo")));
			bee.setBeesName(mtfRequest.getParameter("beeName"));
			System.out.println("비즈이름 미리보기:"+bee.getBeesName());
			String beeCover = mtfRequest.getParameter("beeCoverImage");
			String beeCover2 = mtfRequest.getParameter("beeCoverImage2");
			String choiceCover = mtfRequest.getParameter("choiceCover");
			
			if(fileSize==0){
				if(choiceCover.equals("1")){
					bee.setBeesCover(beeCover);
					System.out.println("파일명 미리보기1:"+bee.getBeesCover());		
				}else{
					bee.setBeesCover(beeCover2);
					System.out.println("파일명 미리보기2:"+bee.getBeesCover());	
				}
			}else{				
				bee.setBeesCover(beeCreateProfile);
				System.out.println("파일명 미리보기3:"+bee.getBeesCover());			
			}
				
			System.out.println("커버변경 설정: "+bee.getBeesName()+"/"+bee.getBeesCover());
			int beeResult = bService.updateBeeSettingCover(bee);
			
			if (beeResult > 0) {
				model.addAttribute("msg", "성공적으로 비즈설정이 변경되었습니다.");
			} else {
				model.addAttribute("msg", "비즈 설정 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
			}
			model.addAttribute("location", "/beeSettingMain.do?beesNo="+bee.getBeesNo());

		
			return "bees/beeCreate/beeResult";	
	}
	
	@RequestMapping(value="/beeSettingMain.do")
	public ModelAndView beeSettingMain(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
			Bees bee = new Bees(); 
			bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
			System.out.println("비즈 번호: "+bee.getBeesNo());
			Bees beeResult = bService.selectBeeSetting(bee);
			int userCount = userService.userCount(bee.getBeesNo());
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("userCount",userCount);
			mav.addObject("beeResult",beeResult);
			mav.setViewName("bees/beeSetting/Main");  //ViewResolver에 의해서 경로가 최종 완성됨
					
			return mav;						
		
	}
	
	@RequestMapping(value="/beeSettingSubCoverUpdate.do")
	public ModelAndView beeSettingSubCoverUpdate(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
			Bees bee = new Bees(); 
			bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
			System.out.println("커버변경 비즈 번호: "+bee.getBeesNo());
			Bees beeResult = bService.selectBeeSetting(bee);
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("beeResult",beeResult);
			mav.setViewName("bees/beeSetting/SubCoverUpdate");  //ViewResolver에 의해서 경로가 최종 완성됨
					
			return mav;	
		
	}
	
	
	@RequestMapping(value="/beeSettingSubType.do")
	public ModelAndView beeSettingSubType(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("타입변경 비즈 번호: "+bee.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		int userCount = userService.userCount(bee.getBeesNo());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userCount",userCount);
		mav.addObject("beeResult",beeResult);
		mav.setViewName("bees/beeSetting/Type");  //ViewResolver에 의해서 경로가 최종 완성됨
				
		return mav;					
	}
	@RequestMapping(value="/subTypeSet.do")
	   public String subTypeSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {   
	      char beesPublicYN = 0;
	      Bees bee = new Bees(); 
	      bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
	      String beesPublic = request.getParameter("beeType");
	      if(beesPublic.equals("public")){
	         beesPublicYN ='Y';
	      }else{
	         beesPublicYN ='N';
	      }
	      bee.setBeesPublicYN(beesPublicYN);
	      System.out.println("타입변경 설정: "+bee.getBeesNo()+"/"+bee.getBeesPublicYN());
	      int beeResult = bService.updateBeeSettingType(bee);		
			if (beeResult > 0) {
				model.addAttribute("msg", "성공적으로 비즈설정이 변경되었습니다.");
			} else {
				model.addAttribute("msg", "비즈 설정 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
			}
			model.addAttribute("location", "/beeSettingMain.do?beesNo="+bee.getBeesNo());
			
			return "bees/beeCreate/beeResult";	           
	   }
	
	@RequestMapping(value="/beeSettingSubIntro.do")
	public ModelAndView beeSettingSubIntro(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("소개변경 비즈 번호: "+bee.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		int userCount = userService.userCount(bee.getBeesNo());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userCount",userCount);
		mav.addObject("beeResult",beeResult);
		mav.setViewName("bees/beeSetting/Intro");  //ViewResolver에 의해서 경로가 최종 완성됨
				
		return mav;							
	}
	@RequestMapping(value="/subIntroSet.do")
	public String subIntroSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		bee.setBeesCont(request.getParameter("beeCont"));
		System.out.println("소개변경 설정: "+bee.getBeesNo()+"/"+bee.getBeesCont());
		int beeResult = bService.updateBeeSettingIntro(bee);		
		if (beeResult > 0) {
			model.addAttribute("msg", "성공적으로 비즈설정이 변경되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 설정 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingMain.do?beesNo="+bee.getBeesNo());
		
		return "bees/beeCreate/beeResult";	    					
		
	}
	
	@RequestMapping(value="/beeSettingSubMaxMember.do")
	public ModelAndView beeSettingSubMaxMember(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("최대인원변경 비즈 번호: "+bee.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		int userCount = userService.userCount(bee.getBeesNo());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("beeResult",beeResult);
		mav.addObject("userCount",userCount);
		mav.setViewName("bees/beeSetting/MaxMember");  //ViewResolver에 의해서 경로가 최종 완성됨
				
		return mav;								
	}
	@RequestMapping(value="/subMaxMemberSet.do")
	public String subMaxMemberSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		String MaxMember = request.getParameter("MaxMember");
		bee.setBeesUserLimit(Integer.parseInt(MaxMember));
		System.out.println("최대인원변경 설정: "+bee.getBeesNo()+"/"+MaxMember);
		int beeResult = bService.updateBeeSettingMaxMember(bee);		
		if (beeResult > 0) {
			model.addAttribute("msg", "성공적으로 비즈설정이 변경되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 설정 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingMain.do?beesNo="+bee.getBeesNo());
		
		return "bees/beeCreate/beeResult";	    
	}
	
	@RequestMapping(value="/beeSettingSubJoinStandard.do")
	public ModelAndView beeSettingSubJoinStandard(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("가입조건변경 비즈 번호: "+bee.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		System.out.println("가입조건변경 비즈 성별: "+beeResult.getBeesGender());
		int userCount = userService.userCount(bee.getBeesNo());
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("beeResult",beeResult);
		mav.addObject("userCount",userCount);
		mav.setViewName("bees/beeSetting/JoinStandard");  //ViewResolver에 의해서 경로가 최종 완성됨
				
		return mav;										
	}
	@RequestMapping(value="/subJoinStandardSet.do")
	public String subJoinStandardSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		bee.setBeesGender(request.getParameter("gender").charAt(0));
		bee.setBeesMaxBirth(Integer.parseInt(request.getParameter("maxAge")));
		bee.setBeesMinBirth(Integer.parseInt(request.getParameter("minAge")));
		String gender = request.getParameter("gender");
		String maxAge = request.getParameter("maxAge");
		String minAge = request.getParameter("minAge");
		System.out.println("가입조건변경 설정: "+bee.getBeesNo()+"/"+gender+"/"+maxAge+"/"+minAge);
		int beeResult = bService.updateBeeSettingJoinStandard(bee);		
		if (beeResult > 0) {
			model.addAttribute("msg", "성공적으로 비즈설정이 변경되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 설정 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingMain.do?beesNo="+bee.getBeesNo());
		
		return "bees/beeCreate/beeResult";	   
	}
	
	@RequestMapping(value="/beeSettingSubJoinManager.do")
	public ModelAndView beeSettingSubJoinManager(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		int beesNO = Integer.parseInt(request.getParameter("beesNo"));
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("매니저 관리 비즈 번호: "+beesNO);
		ArrayList<BeesUserList> list = bService.selectBeesManager(beesNO);
		ArrayList<BeesUserList> listUser = bService.selectBeesOnlyUser(beesNO);
		Bees beeResult = bService.selectBeeSetting(bee);
		int userCount = userService.userCount(bee.getBeesNo());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("listUser", listUser);
		mav.addObject("userCount",userCount);
		mav.addObject("beeResult",beeResult);
		mav.setViewName("bees/beeSetting/JoinManager"); //viewResolve를 통해 경로 최종 완성
		
		return mav;

	}
	@RequestMapping(value="/subJoinManagerToUserSet.do")
	public String subJoinManagerToUserSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		BeesUserList beeUser = new BeesUserList(); 
		beeUser.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));	
		beeUser.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));	
		System.out.println("일반회원 변경 설정: "+beeUser.getBeesNo()+"/"+beeUser.getMemberNo());
		
		int beeUserResult = bService.updateManagerToUser(beeUser);
		
		if (beeUserResult > 0) {
			model.addAttribute("msg", "일반회원으로 변경 되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 탈퇴가 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingSubJoinManager.do?beesNo="+beeUser.getBeesNo());

	
		return "bees/beeCreate/beeResult";			
	}
	
	@RequestMapping(value="/subJoinManagerSet.do")
	public String subJoinManagerSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		BeesUserList beeUser = new BeesUserList(); 
		beeUser.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));	
		beeUser.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));	
		System.out.println("매니저 변경 설정: "+beeUser.getBeesNo()+"/"+beeUser.getMemberNo());		
		int beeUserResult = bService.updatesubJoinManagerSet(beeUser);
		
		if (beeUserResult > 0) {
			model.addAttribute("msg", "매니저로 변경 되었습니다.");
		} else {
			model.addAttribute("msg", "매니저로 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingSubJoinManager.do?beesNo="+beeUser.getBeesNo());

		return "bees/beeCreate/beeResult";			
	}
	
	@RequestMapping(value="/beeSettingSubMemberPermission.do")
	public ModelAndView beeSettingSubMemberPermission(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Setting setting = new Setting(); 
		Bees bee = new Bees(); 
		setting.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("설정 확인 비즈 번호: "+setting.getBeesNo());
		Setting settingResult = bService.selectBeeMemberPermission(setting);
		int userCount = userService.userCount(setting.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("settingResult",settingResult);
		mav.addObject("userCount",userCount);
		mav.addObject("beeResult",beeResult);
		mav.setViewName("bees/beeSetting/MemberPermission");  //ViewResolver에 의해서 경로가 최종 완성됨
				
		return mav;				
	}
	@RequestMapping(value="/subMemberPermissionSet.do")
	public String subMemberPermissionSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Setting setting = new Setting(); 
		setting.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		setting.setSetNotice(request.getParameter("set_notice"));
		setting.setSetWrite(request.getParameter("set_write"));
		setting.setSetComment(request.getParameter("set_comment"));
		setting.setSetScheRegist(request.getParameter("set_sche_regist"));
		setting.setSetScheModify(request.getParameter("set_sche_modify"));
		setting.setSetChatOpen(request.getParameter("set_chat_open"));
		setting.setSetChatDel(request.getParameter("set_chat_del"));
		setting.setSetUserInvite(request.getParameter("set_user_invite"));
		setting.setSetUserPermit(request.getParameter("set_user_permit"));
		setting.setSetUserCondi(request.getParameter("set_user_condi"));
		setting.setSetContDel(request.getParameter("set_cont_del"));
		setting.setSetUserBlock(request.getParameter("set_user_block"));
		System.out.println("설정 변경 비즈 번호: "+setting.getBeesNo()+"/"+setting.getSetNotice()+
				"/"+setting.getSetWrite()+"/"+setting.getSetComment()+"/"+setting.getSetScheRegist()+"/"+
				setting.getSetScheModify()+"/"+setting.getSetChatOpen()+"/"+setting.getSetChatDel()+"/"+
				setting.getSetUserInvite()+"/"+setting.getSetUserPermit()+"/"+setting.getSetUserCondi()+"/"
				+setting.getSetContDel()+"/"+setting.getSetUserBlock());
		int settingResult = bService.updateBeeMemberPermissionSet(setting);
		if (settingResult > 0) {
			model.addAttribute("msg", "성공적으로 멤버 권한 설정이 변경되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 설정 변경이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingMain.do?beesNo="+setting.getBeesNo());
		
		return "bees/beeCreate/beeResult";	   		
	}
	@RequestMapping(value="/beeSettingSubMemberWithdraw.do")
	public ModelAndView beeSettingSubMemberWithdraw(Model model, HttpServletRequest request) throws UnsupportedEncodingException {		
		Bees bee = new Bees(); 
		int beesNO = Integer.parseInt(request.getParameter("beesNo"));
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("멤버 탈퇴 비즈 번호: "+beesNO);
		ArrayList<BeesUserList> list = bService.selectBeesUser(beesNO);
		int userCount = userService.userCount(bee.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("userCount",userCount);
		mav.addObject("beeResult",beeResult);
		mav.setViewName("bees/beeSetting/MemberWithdraw"); //viewResolve를 통해 경로 최종 완성
		
		return mav;
		
	}
	@RequestMapping(value="/subMemberWithdrawSet.do")
	public String subMemberWithdrawSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		BeesUserList beeUser = new BeesUserList(); 
		beeUser.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));	
		beeUser.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));	
		System.out.println("회원 탈퇴 설정: "+beeUser.getBeesNo()+"/"+beeUser.getMemberNo());
		
		int beeUserResult = bService.updateMemberWithdraw(beeUser);
		
		if (beeUserResult > 0) {
			model.addAttribute("msg", "성공적으로 탈퇴 되었습니다.");
		} else {
			model.addAttribute("msg", "회원 탈퇴가 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingSubMemberWithdraw.do?beesNo="+beeUser.getBeesNo());

	
		return "bees/beeCreate/beeResult";			
	}
	
	@RequestMapping(value="/subMemberWithdrawBlockSet.do")
	public String subMemberWithdrawBlockSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		BeesUserList beeUser = new BeesUserList(); 
		beeUser.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));	
		beeUser.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));	
		System.out.println("회원 차단 설정: "+beeUser.getBeesNo()+"/"+beeUser.getMemberNo());
		
		int beeUserResult = bService.subMemberWithdrawBlockSet(beeUser);
		
		if (beeUserResult > 0) {
			model.addAttribute("msg", "성공적으로 차단 되었습니다.");
		} else {
			model.addAttribute("msg", "회원 차단이 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingSubMemberWithdraw.do?beesNo="+beeUser.getBeesNo());

	
		return "bees/beeCreate/beeResult";			
	}
	
	@RequestMapping(value="/beeSettingSubMemberWithdrawDo.do")
	public ModelAndView beeSettingSubMemberWithdrawDo(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		
		Bees bee = new Bees(); 
		int beesNO = Integer.parseInt(request.getParameter("beesNo"));
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		System.out.println("멤버 탈퇴 비즈 번호: "+beesNO);
		ArrayList<BeesUserList> list = bService.selectBeesBlock(beesNO);
		int userCount = userService.userCount(bee.getBeesNo());
		Bees beeResult = bService.selectBeeSetting(bee);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("userCount",userCount);
		mav.addObject("beeResult",beeResult);
		mav.setViewName("bees/beeSetting/MemberWithdrawDo"); //viewResolve를 통해 경로 최종 완성
		
		return mav;
			
	}
	
	@RequestMapping(value="/subMemberBlockDeleteSet.do")
	public String subMemberBlockDeleteSet(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		BeesUserList beeUser = new BeesUserList(); 
		beeUser.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));	
		beeUser.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));	
		System.out.println("회원 차단 설정: "+beeUser.getBeesNo()+"/"+beeUser.getMemberNo());
		
		int beeUserResult = bService.subMemberBlockDeleteSet(beeUser);
		
		if (beeUserResult > 0) {
			model.addAttribute("msg", "성공적으로 차단해제 되었습니다.");
		} else {
			model.addAttribute("msg", "회원 차단해제가 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/beeSettingSubMemberWithdrawDo.do?beesNo="+beeUser.getBeesNo());

	
		return "bees/beeCreate/beeResult";			
	}
	
	@RequestMapping(value="/beeSettingSubOneWithdraw.do")
	public String beeSettingSubOneWithdraw(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		BeesUserList beeUser = new BeesUserList(); 
		beeUser.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));	
		beeUser.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));	
		System.out.println("비즈탈퇴 설정: "+beeUser.getBeesNo()+"/"+beeUser.getMemberNo());
		int beeUserResult = bService.updateBeeOneWithdraw(beeUser);
		
		if (beeUserResult > 0) {
			model.addAttribute("msg", "성공적으로 탈퇴되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 탈퇴가 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/index.jsp");

	
		return "bees/beeCreate/beeResult";	
			
	}
	@RequestMapping(value="/beeSettingSubOneDelete.do")
	public String beeSettingSubOneDelete(Model model, HttpServletRequest request) throws UnsupportedEncodingException {	
		Bees bee = new Bees(); 
		bee.setBeesNo(Integer.parseInt(request.getParameter("beesNo")));
		bee.setBeesHostNo(Integer.parseInt(request.getParameter("memberNo")));
		System.out.println("비즈삭제 설정: "+bee.getBeesNo());
		int beeResult = bService.updateBeeOneDelete(bee);
		
		if (beeResult > 0) {
			model.addAttribute("msg", "성공적으로 비즈가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "비즈 삭제가 실패하였습니다. 지속적으로 실패 시 관리자에게 문의하세요.");
		}
		model.addAttribute("location", "/myBeesPage.do?memberNo="+bee.getBeesHostNo());

	
		return "bees/beeCreate/beeResult";	
			
	}
	
	
	
	
	//정평주(관리자)--------------------------------------------------------------------------
		//모임관리(bees 전체 리스트)
		@RequestMapping(value="/beesManagement.do")
		public String beesManagement(Model model,
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
			int totalPage = bService.countBeesAdmin();
					
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
				sb.append("<a href='/beesManagement.do?currentPage="+(startNavi-1)+"'>< </a> ");
			}
			for(int i=startNavi; i<=endNavi; i++){
				if(i==currentPage){
					sb.append("<a href='/beesManagement.do?currentPage="+i+"'><b> "+i+"</b></a> ");
				}else{
					sb.append("<a href='/beesManagement.do?currentPage="+i+"'> "+i+"</a> ");
				}
			}
			if(endNavi != lastPage){
				sb.append("<a href='/beesManagement.do?currentPage="+(endNavi+1)+"'> ></a> ");
			}		
			
			//전체 리스트 ***************
			ArrayList<BeesAdmin> list = bService.selectBeesAdminList(pv);
			
			model.addAttribute("sb",sb.toString());
			model.addAttribute("baList",list);
			return "admin/beesManagement";
			
		}
		
		//모임관리(bees 검색)
		@RequestMapping(value="/adminBeesSearch.do")
		public String adminBeesSearch(@RequestParam String startDate,
									@RequestParam String endDate,
									@RequestParam int searchSelect,
									@RequestParam String search,
									HttpServletRequest request,
									Model model){
			
			
			BeesAdminSearch bas = new BeesAdminSearch();
			bas.setStartDate(startDate);
			bas.setEndDate(endDate);
			bas.setSearchSelect(searchSelect);
			bas.setSearch(search);
			
			//전체 리스트 불러오기 ****************
			ArrayList<BeesAdmin> list = bService.adminBeesSearch(bas);
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
				sb.append("<a href='/beesManagement.do?currentPage="+(startNavi-1)+"'>< </a> ");
			}
			for(int i=startNavi; i<=endNavi; i++){
				if(i==currentPage){
					sb.append("<a href='/beesManagement.do?currentPage="+i+"'><b> "+i+"</b></a> ");
				}else{
					sb.append("<a href='/beesManagement.do?currentPage="+i+"'> "+i+"</a> ");
				}
			}
			if(endNavi != lastPage){
				sb.append("<a href='/beesManagement.do?currentPage="+(endNavi+1)+"'> ></a> ");
			}		
			
			
			model.addAttribute("sb",sb.toString());
			model.addAttribute("baList",list);
			
			return "admin/beesManagement";
			
		};
		
		
		
		//모임관리(bees 삭제)
		@RequestMapping(value="/beesDelete.do")
		public void beesDelete(@RequestParam int beesNo,
							   HttpServletResponse response) throws IOException{
			
			int result = bService.beesDelete(beesNo);
			if(result>0){
				response.getWriter().print(0);
			}else{
				response.getWriter().print(1);
			}
			
		}
		
		//모임관리(bees 삭제)
		@RequestMapping(value="/beesRollback.do")
		public void beesRollback(@RequestParam int beesNo,
							   HttpServletResponse response) throws IOException{
			
			int result = bService.beesRollback(beesNo);
			if(result>0){
				response.getWriter().print(0);
			}else{
				response.getWriter().print(1);
			}
			
		}
		

		
		
	
	
	
	
	
	
}
