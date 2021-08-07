package com.park.mall;

import java.util.List;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.park.mall.model.MemberVO;
import com.park.mall.model.Tbl_ProductVO;
import com.park.mall.service.MemberService;
import com.park.mall.service.Tbl_ProductServiceImpl;

@Controller
public class MainController {
	@Inject
	Tbl_ProductServiceImpl tbl_ProductService;
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String home() {
		
		return "mainPage";
	}
	
	@RequestMapping(value = "/shopping", method = RequestMethod.GET)
	public String shopping() {
		return "shopping";
	}
	
	  // 1. 신발 상품 전체 목록
	@RequestMapping(value = "/nike_shoes", method = RequestMethod.GET)
	public ModelAndView nike_shoes(ModelAndView mav) throws Exception {
		mav.setViewName("/nike_shoes");
		mav.addObject("list", tbl_ProductService.listTbl_Product());
		return  mav;
	}
	
}
	
