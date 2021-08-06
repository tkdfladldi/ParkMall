package com.park.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.park.mall.model.MemberVO;

@Controller
public class MainController {
	
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String home() {
		
		return "mainPage";
	}
	@RequestMapping(value = "/shopping", method = RequestMethod.GET)
	public String shopping() {
	
		return "shopping";
	}
}
