package com.park.mall.controller;



import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.park.mall.model.Tbl_ProductVO;
import com.park.mall.service.Tbl_ProductService;
@Controller
public class CartController {

		@Inject Tbl_ProductService tbl_ProductService;
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() throws Exception {
		return "cart";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartPost(Tbl_ProductVO vo,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Tbl_ProductVO vo2 = (Tbl_ProductVO)tbl_ProductService.Tbl_ProductIdCall(vo.getProduct_id());
		request.setAttribute("cart", vo2);
		Cookie cookie = new Cookie("cart",(URLEncoder.encode(String.valueOf(vo2))));
		
		response.addCookie(cookie);
		
		
		return "cart";
	}
}
