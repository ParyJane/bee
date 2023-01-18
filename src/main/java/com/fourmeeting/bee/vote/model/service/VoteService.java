package com.fourmeeting.bee.vote.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.admin.model.vo.Search;
import com.fourmeeting.bee.vote.model.dao.VoteDAO;
import com.fourmeeting.bee.vote.model.vo.FeedVote;
import com.fourmeeting.bee.vote.model.vo.Vote;
import com.fourmeeting.bee.vote.model.vo.VoteChoice;

@Service("VoteService")
public class VoteService {
	
	@Resource(name="VoteDAO")
	private VoteDAO voteDAO;
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<FeedVote> voteSelectAll(int beesNo) {
		// TODO Auto-generated method stub
		ArrayList<FeedVote> voteList =  voteDAO.voteSelectAll(sqlSession, beesNo);
		return voteList;
	}

	public Vote voteSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		Vote vote =  voteDAO.voteSelectOne(sqlSession, boardNo);
		return vote;
	}

	public int voteInsertItem(VoteChoice voteChoice) {
		// TODO Auto-generated method stub
		int result = voteDAO.voteInsertItem(sqlSession,voteChoice);
		return result;
	}

	public int voteEnd(int voteNo) {
		// TODO Auto-generated method stub
		int result = voteDAO.voteEnd(sqlSession, voteNo);
		return result;
	}

	public int deleteVote(int voteNo) {
		// TODO Auto-generated method stub
		int result = voteDAO.deleteVote(sqlSession, voteNo);
		return result;
	}

	public int insertVote(Vote vote) {
		// TODO Auto-generated method stub
		int result = voteDAO.insertVote(sqlSession, vote);
		return result;
	}

	public ArrayList<FeedVote> voteSelectAllMyBees(List<Integer> beesNo) {
		// TODO Auto-generated method stub
		ArrayList<FeedVote> voteList =  voteDAO.voteSelectAllMyBees(sqlSession, beesNo);
		return voteList;
	}

	public ArrayList<Vote> selectAllVote(int beesNo) {
		ArrayList<Vote> list = voteDAO.selectAllVote(sqlSession,beesNo);
		return list;
		
	}

	public void selectAllSearch(Search s) {
		// TODO Auto-generated method stub
		System.out.println("1");
		//ArrayList<Vote> list = voteDAO.selectAllSearch(sqlSession,s);
		System.out.println("2");
		//return list;
		
	}

	


}
