package com.fourmeeting.bee.board.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.board.model.dao.BoardDAO;
import com.fourmeeting.bee.board.model.vo.Board;
import com.fourmeeting.bee.board.model.vo.BoardLike;
import com.fourmeeting.bee.board.model.vo.Feed;
import com.fourmeeting.bee.board.model.vo.ModifyFeed;

@Service("BoardService")
public class BoardService {
	
	@Resource(name="BoardDAO")
	private BoardDAO boardDAO;
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<Feed> boardSelectAll(int beesNo) {
		// TODO Auto-generated method stub
		
		ArrayList<Feed> feedList = boardDAO.boardSelectAll(sqlSession,beesNo);
		return feedList;
	}


	public ModifyFeed feedSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		
		ModifyFeed ModifyFeed = boardDAO.feedSelectOne(sqlSession,boardNo);
		return ModifyFeed;
	}

	public int insertBoardLike(BoardLike boardLike) {
		// TODO Auto-generated method stub
		int result = boardDAO.insertBoardLike(sqlSession,boardLike);
		return result;
	}

	public int deleteBoardLike(BoardLike boardLike) {
		// TODO Auto-generated method stub
		int result = boardDAO.deleteBoardLike(sqlSession,boardLike);
		return result;
	}

	public ArrayList<BoardLike> selectAllLike(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList<BoardLike> likeList = boardDAO.selectAllLike(sqlSession,memberNo);
		return likeList;
	}

	public Board boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		Board board = boardDAO.boardSelectOne(sqlSession,boardNo);
		return board;
	}

	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		int result = boardDAO.deleteBoard(sqlSession,boardNo);
		return result;
	}

	public int deleteLikeAll(int boardNo) {
		// TODO Auto-generated method stub
		int result = boardDAO.deleteLikeAll(sqlSession,boardNo);
		return result;
	}

	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		int result = boardDAO.updateBoard(sqlSession,board);
		return result;
	}

	public Board insertBoard(Board board, String beesFunction) {
		// TODO Auto-generated method stub
		Board newBoard = boardDAO.insertBoard(sqlSession,board,beesFunction);
		return newBoard;
	}

	public ArrayList<Feed> boardSearchAll(int beesNo, String keyword) {
		ArrayList<Feed> feedList = boardDAO.boardSearchAll(sqlSession,beesNo, keyword);
		return feedList;
	}


	public ArrayList<Feed> boardSelectMine(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList <Feed> feedList = boardDAO.boardSelectMine(sqlSession, memberNo);
		return feedList;
	}


	public ArrayList<Feed> boardSelectLiked(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList <Feed> feedList = boardDAO.boardSelectLiked(sqlSession, memberNo);
		return feedList;
	}


	public ArrayList<Feed> boardSelectAllBees(List<Integer> beesNo) {
		// TODO Auto-generated method stub
		ArrayList <Feed> feedList = boardDAO.boardSelectAllBees(sqlSession, beesNo);
		return feedList;
	}


	public ArrayList<Feed> selectAllBestFeed() {
		// TODO Auto-generated method stub
		ArrayList <Feed> feedList = boardDAO.selectAllBestFeed(sqlSession);
		return feedList;
	}


	public ArrayList<Feed> selectSerachAllFeed(String keyword) {
		// TODO Auto-generated method stub
		ArrayList <Feed> feedList = boardDAO.selectSerachAllFeed(sqlSession, keyword);
		return feedList;
	}



	

}
