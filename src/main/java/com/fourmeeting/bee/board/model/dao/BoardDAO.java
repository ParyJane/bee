package com.fourmeeting.bee.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.board.model.vo.Board;
import com.fourmeeting.bee.board.model.vo.BoardLike;
import com.fourmeeting.bee.board.model.vo.Feed;
import com.fourmeeting.bee.board.model.vo.ModifyFeed;


@Repository("BoardDAO")
public class BoardDAO {
	
	

	public ArrayList<Feed> boardSelectAll(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		
		List feedList = sqlSession.selectList("board.boardSelectAll",beesNo);
		return (ArrayList<Feed>)feedList;
	}


	public ModifyFeed feedSelectOne(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		
		ModifyFeed modifyFeed = sqlSession.selectOne("board.feedSelectOne", boardNo);
		return modifyFeed;
	}

	public int insertBoardLike(SqlSessionTemplate sqlSession, BoardLike boardLike) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("board.insertBoardLike",boardLike);
		return result;
	}

	public int deleteBoardLike(SqlSessionTemplate sqlSession, BoardLike boardLike) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("board.deleteBoardLike",boardLike);
		return result;
	}

	public ArrayList<BoardLike> selectAllLike(SqlSessionTemplate sqlSession, int memberNo) {
		// TODO Auto-generated method stub
		List likeList = sqlSession.selectList("board.selectAllLike",memberNo);
		return (ArrayList<BoardLike>)likeList;
	}

	public Board boardSelectOne(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		Board board = sqlSession.selectOne("board.boardSelectOne",boardNo);
		return board;
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("board.boardDelete",boardNo);
		return result;
	}

	public int deleteLikeAll(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("board.deleteLikeAll",boardNo);
		return result;
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board board) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("board.updateBoard",board);
		return result;
	}

	public Board insertBoard(SqlSessionTemplate sqlSession, Board board, String beesFunction) {
		// TODO Auto-generated method stub
		Board newBoard = new Board();
		if(beesFunction.equals("vote")) {
		int result = sqlSession.insert("board.insertBoardWithVote",board);
		newBoard.setBoardNo(board.getBoardNo());
		newBoard.setVoteNo(board.getVoteNo());
		}else if(beesFunction.equals("schedule")) {
		int result = sqlSession.insert("board.insertBoardWithSchedule",board);
		newBoard.setBoardNo(board.getBoardNo());
		newBoard.setScheduleNo(board.getScheduleNo());
		System.out.println(board.getBoardNo());
		}else if(beesFunction.equals("file")) {
		int result = sqlSession.insert("board.insertBoardWithFile",board);
		newBoard.setBoardNo(board.getBoardNo());
		newBoard.setFileNo(board.getFileNo());
		System.out.println(board.getBoardNo());
		}else if(beesFunction.equals("image")) {
		int result = sqlSession.insert("board.insertBoardWithImage",board);	
		newBoard.setBoardNo(board.getBoardNo());
		}else{
		int result = sqlSession.insert("board.insertBoard",board);
		newBoard.setBoardNo(board.getBoardNo());
		}
		
		return newBoard;
	}

	public ArrayList<Feed> boardSearchAll(SqlSessionTemplate sqlSession, int beesNo, String keyword) {
		// TODO Auto-generated method stub
		
		List feedList = null;
		
		if(keyword.indexOf("@")==0) {
			Feed feed = new Feed();
			feed.setBeesNo(beesNo);
			feed.setUserName("%"+keyword.substring(1)+"%");
			
			feedList = sqlSession.selectList("board.boardSearchWithName",feed);
			System.out.println(feedList);
		}else{
			Feed feed = new Feed();
			feed.setBeesNo(beesNo);
			feed.setBoardCont("%"+keyword+"%");
			feedList = sqlSession.selectList("board.boardSearchWithCont",feed);
		};
		
		return (ArrayList<Feed>)feedList;
	}


	public ArrayList<Feed> boardSelectMine(SqlSessionTemplate sqlSession, int memberNo) {
		// TODO Auto-generated method stub
		List feedList = sqlSession.selectList("board.boardSelectMine",memberNo);
		return (ArrayList<Feed>)feedList;
	}


	public ArrayList<Feed> boardSelectLiked(SqlSessionTemplate sqlSession, int memberNo) {
		// TODO Auto-generated method stub
		List feedList = sqlSession.selectList("board.boardSelectLiked",memberNo);
		return (ArrayList<Feed>)feedList;
	}


	public ArrayList<Feed> boardSelectAllBees(SqlSessionTemplate sqlSession, List<Integer> beesNo) {
		List feedList = sqlSession.selectList("board.boardSelectAllBees",beesNo);
		return (ArrayList<Feed>)feedList;
	}


	public ArrayList<Feed> selectAllBestFeed(SqlSessionTemplate sqlSession) {
		List feedList = sqlSession.selectList("board.selectAllBestFeed");
		return (ArrayList<Feed>)feedList;
	}


	public ArrayList<Feed> selectSerachAllFeed(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		keyword = "%"+keyword+"%";
		List feedList = sqlSession.selectList("board.selectSerachAllFeed", keyword);
		return (ArrayList<Feed>)feedList;
	}

	
	
}
