package com.fourmeeting.bee.vote.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.vote.model.vo.FeedVote;
import com.fourmeeting.bee.vote.model.vo.Vote;
import com.fourmeeting.bee.vote.model.vo.VoteChoice;

@Repository("VoteDAO")
public class VoteDAO {

	public ArrayList<FeedVote> voteSelectAll(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("vote.voteSelectAll", beesNo);
		return (ArrayList<FeedVote>)list;
	}

	public Vote voteSelectOne(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		Vote vote = sqlSession.selectOne("vote.voteSelectOne", boardNo);
		return vote;
	}

	public int voteInsertItem(SqlSessionTemplate sqlSession, VoteChoice voteChoice) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("vote.voteInsertItem",voteChoice);
		return result;
	}


	public int voteEnd(SqlSessionTemplate sqlSession, int voteNo) {
		// TODO Auto-generated method stub
		
		int result = sqlSession.update("vote.voteEnd",voteNo);
		return result;
	}

	public int deleteVote(SqlSessionTemplate sqlSession, int voteNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("vote.deleteVote", voteNo);
		return result;
	}

	public int insertVote(SqlSessionTemplate sqlSession, Vote vote) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("vote.insertVote", vote);
		return result;
	}

	public ArrayList<FeedVote> voteSelectAllMyBees(SqlSessionTemplate sqlSession, List<Integer> beesNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("vote.voteSelectAllMyBees", beesNo);
		return (ArrayList<FeedVote>)list;
	}
	public ArrayList<Vote> selectAllVote(SqlSessionTemplate sqlSession, int beesNo) {
		List list = sqlSession.selectList("vote.selectAllVote", beesNo);
		return (ArrayList<Vote>)list;
	}

	public ArrayList<Vote> selectAllSearch(SqlSessionTemplate sqlSession, Search s) {
		// TODO Auto-generated method stub
		System.out.println("3");
		List list =sqlSession.selectList("vote.selectAllSearch", s);
		System.out.println(list);
		return (ArrayList<Vote>)list;
	}

	

	

}
