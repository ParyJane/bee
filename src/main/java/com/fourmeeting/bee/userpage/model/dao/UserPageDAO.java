package com.fourmeeting.bee.userpage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.BeesUserCount;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.userpage.model.vo.CategoryRecommendBees;
import com.fourmeeting.bee.userpage.model.vo.RecommendBees;

@Repository("userPageDAO")
public class UserPageDAO {
	
	public ArrayList<BeesUserCount> selectRecommendBees(SqlSessionTemplate sqlSession, RecommendBees temp) {
		// TODO Auto-generated method stub
		List list =sqlSession.selectList("bees.selectRecommendBees", temp);
		
		return (ArrayList<BeesUserCount>)list;
	}
	
	public ArrayList<Bees> selectMyBees(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		List list =sqlSession.selectList("bees.selectMyBees", m);
		
		return (ArrayList<Bees>)list;
	}
	
	
	public ArrayList<BeesUserCount> selectCategoryRecommendBees(SqlSessionTemplate sqlSession, CategoryRecommendBees temp) {
		// TODO Auto-generated method stub
		List list =sqlSession.selectList("bees.selectCategoryRecommendBees", temp);
		
		return (ArrayList<BeesUserCount>)list;
	}
	
	public ArrayList<BeesUserCount> selectBeesSearchResult(SqlSessionTemplate sqlSession, String searchData) {
		// TODO Auto-generated method stub
		List list =sqlSession.selectList("bees.selectBeesSearchResult", searchData);
		
		return (ArrayList<BeesUserCount>)list;
	}
}
