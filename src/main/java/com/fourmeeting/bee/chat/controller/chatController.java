package com.fourmeeting.bee.chat.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fourmeeting.bee.bees.model.service.BeesService;
import com.fourmeeting.bee.bees.model.vo.Bees;

@Controller
public class chatController {
	
	@Resource(name="beesService")
	private BeesService beesService;
	
	
	@RequestMapping(value="/chat.do", method=RequestMethod.GET)
	public String beesChat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		int beesNo = Integer.parseInt(request.getParameter("beesNo"));
		Bees bees = beesService.beesSelectOne(beesNo);
		
		String userName = request.getParameter("userName");
		String beesName = bees.getBeesName();
		System.out.println(beesName);
		
		request.setAttribute("beesNo", beesNo);
		request.setAttribute("userName", userName);
		request.setAttribute("beesName", beesName);
		
		return "/bees/chat/beesChat";
				
	}

}
