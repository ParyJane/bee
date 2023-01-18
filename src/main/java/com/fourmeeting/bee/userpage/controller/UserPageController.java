package com.fourmeeting.bee.userpage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.BeesUserCount;
import com.fourmeeting.bee.member.model.vo.Member;
import com.fourmeeting.bee.userpage.model.service.UserPageService;
import com.fourmeeting.bee.userpage.model.vo.CategoryRecommendBees;
import com.fourmeeting.bee.userpage.model.vo.RecommendBees;

@Controller
public class UserPageController {
	@Autowired
	@Qualifier(value = "userPageService")
	private UserPageService uService;
	
	@RequestMapping(value = "/beesRecommend.do")
	public ModelAndView beesRecommend (HttpSession session, @RequestParam int endNo) {
		Member m = (Member)session.getAttribute("member");
		String [] interest = m.getInterest().split("/");
		
		RecommendBees temp = new RecommendBees();
		
		temp.setInterest(interest);
		temp.setSessionMemberNo(m.getMemberNo());
		
		ArrayList<BeesUserCount> rb = uService.selectRecommendBees(temp);
		ArrayList<Bees> mb = uService.selectMyBees(m); 

		ModelAndView mav = new ModelAndView();

		mav.addObject("recommendBees", rb);
		mav.addObject("myBees", mb);
		mav.addObject("endNo", endNo+10);
		
		mav.setViewName("user/main/beesRecommend");
		

		return mav;
	}
	
	
	@RequestMapping(value = "/beesCategoryRecommend.do")
	public ModelAndView beesCategoryRecommend (@RequestParam String category, @RequestParam int endNo, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		
		CategoryRecommendBees temp = new CategoryRecommendBees();
		
		temp.setCategory(category);
		temp.setSessionMemberNo(m.getMemberNo());
		
		ArrayList<BeesUserCount> rb = uService.selectCategoryRecommendBees(temp);
		ArrayList<Bees> mb = uService.selectMyBees(m); 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("recommendBees", rb);
		mav.addObject("myBees", mb);
		mav.addObject("category", category);
		mav.addObject("endNo", endNo+10);
		
		mav.setViewName("user/main/beesCategoryRecommend");

		return mav;
	}
	
	@RequestMapping(value = "/beesSearchResult.do")
	public ModelAndView beesSearchResult (@RequestParam String searchData, @RequestParam int endNo, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		
		ArrayList<BeesUserCount> rb = uService.selectBeesSearchResult(searchData);
		ArrayList<Bees> mb = uService.selectMyBees(m); 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("resultBees", rb);
		mav.addObject("myBees", mb);
		mav.addObject("endNo", endNo+10);
		mav.addObject("searchData", searchData);
		
		mav.setViewName("user/search/beesSearchResult");

		return mav;
	}
}
