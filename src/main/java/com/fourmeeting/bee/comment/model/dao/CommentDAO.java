package com.fourmeeting.bee.comment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.comment.model.vo.BeesComment;
import com.fourmeeting.bee.comment.model.vo.FeedComment;
import com.fourmeeting.bee.comment.model.vo.MyComment;

@Repository("CommentDAO")
public class CommentDAO {

	

	public ArrayList<FeedComment> commentSelectAll(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("comment.commentSelectAll", beesNo);
		return (ArrayList<FeedComment>)list;
	}

	public int insertComment(SqlSessionTemplate sqlSession, BeesComment comment) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("comment.insertComment",comment);
		return result;
	}
	
	public int insertRecomment(SqlSessionTemplate sqlSession, BeesComment comment) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("comment.insertRecomment",comment);
		return result;
	}

	public int updateComment(SqlSessionTemplate sqlSession, BeesComment comment) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("comment.updateComment",comment);
		return result;
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int commentNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("comment.deleteComment",commentNo);
		return result;
	}

	public int deleteCommentAll(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("comment.deleteCommentAll",boardNo);
		return result;
	}

	public ArrayList<FeedComment> commentSelectAllMyBees(SqlSessionTemplate sqlSession, List<Integer> beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("comment.commentSelectAllMyBees", beesNo);
		return (ArrayList<FeedComment>)list;
	}

	
	
	
		//사용자 마이페이지
		//내가쓴 댓글 리스트
		public ArrayList<MyComment> mycomment(SqlSessionTemplate sqlSession, int memberNo) {
			
			List list = sqlSession.selectList("comment.mycomment", memberNo);
			
			return (ArrayList<MyComment>)list;
		}
		
		
		//내가 쓴 댓글 비즈 모아보기
		public ArrayList<MyComment> myPageBeesComment(SqlSessionTemplate sqlSession, MyComment mc) {
			
			List list = sqlSession.selectList("comment.myPageBeesComment", mc);
			
			return (ArrayList<MyComment>)list;
			
		}
	
	
}
