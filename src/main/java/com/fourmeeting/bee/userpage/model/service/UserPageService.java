package com.fourmeeting.bee.userpage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.BeesUserCount;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.userpage.model.dao.UserPageDAO;
import com.fourmeeting.bee.userpage.model.vo.CategoryRecommendBees;
import com.fourmeeting.bee.userpage.model.vo.RecommendBees;

@Service("userPageService")
public class UserPageService {
	@Autowired
	@Qualifier(value="userPageDAO")
	private UserPageDAO uDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<BeesUserCount> selectRecommendBees(RecommendBees temp) {
		
		ArrayList<BeesUserCount> recommendBees = uDAO.selectRecommendBees(sqlSession, temp);
		
		return recommendBees;
	}
	
	public ArrayList<Bees> selectMyBees(Member m) {
		
		ArrayList<Bees> myBees = uDAO.selectMyBees(sqlSession, m);
		
		return myBees;
	}
	
	public ArrayList<BeesUserCount> selectCategoryRecommendBees(CategoryRecommendBees temp) {
		
		ArrayList<BeesUserCount> recommendBees = uDAO.selectCategoryRecommendBees(sqlSession, temp);
		
		return recommendBees;
	}
	
	public ArrayList<BeesUserCount> selectBeesSearchResult(String searchData) {
		
		ArrayList<BeesUserCount> resultBees = uDAO.selectBeesSearchResult(sqlSession, searchData);
		
		return resultBees;
	}
}
