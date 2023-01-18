package com.fourmeeting.bee.comment.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.comment.model.dao.CommentDAO;
import com.fourmeeting.bee.comment.model.vo.BeesComment;
import com.fourmeeting.bee.comment.model.vo.FeedComment;
import com.fourmeeting.bee.comment.model.vo.MyComment;

@Service("CommentService")
public class CommentService {
	
	@Resource(name="CommentDAO")
	private CommentDAO commentDAO;
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	

	public ArrayList<FeedComment> commentSelectAll(int beesNo) {
		// TODO Auto-generated method stub
		ArrayList<FeedComment> commentList = commentDAO.commentSelectAll(sqlSession, beesNo);
		return commentList;
	}

	public int insertComment(BeesComment comment) {
		// TODO Auto-generated method stub
		int result = commentDAO.insertComment(sqlSession, comment);
		return result;
	}
	
	public int insertRecomment(BeesComment comment) {
		// TODO Auto-generated method stub
		int result = commentDAO.insertRecomment(sqlSession, comment);
		return result;
	}

	public int updateComment(BeesComment comment) {
		// TODO Auto-generated method stub
		int result = commentDAO.updateComment(sqlSession, comment);
		return result;
	}

	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		int result = commentDAO.deleteComment(sqlSession, commentNo);
		return result;
	}

	public int deleteCommentAll(int boardNo) {
		// TODO Auto-generated method stub
		int result = commentDAO.deleteCommentAll(sqlSession, boardNo);
		return result;
	}

	public ArrayList<FeedComment> commentSelectAllMyBees(List<Integer> beesNo) {
		// TODO Auto-generated method stub
		ArrayList<FeedComment> commentList = commentDAO.commentSelectAllMyBees(sqlSession, beesNo);
		return commentList;
	}
	
		
	
	
		//사용자 마이페이지
		//내가쓴 댓글 리스트
		public ArrayList<MyComment> mycomment(int memberNo) {
			
			ArrayList<MyComment> list = commentDAO.mycomment(sqlSession,memberNo);
			
			return list;
			
		}

		//내가 쓴 댓글 비즈 모아보기
		public ArrayList<MyComment> myPageBeesComment(MyComment mc) {
			
			ArrayList<MyComment> list = commentDAO.myPageBeesComment(sqlSession,mc);
			return list;
		}
	
	
}
