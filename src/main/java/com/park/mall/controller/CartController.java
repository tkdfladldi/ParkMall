package com.park.mall.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.park.mall.model.CartVO;
import com.park.mall.model.MemberVO;
import com.park.mall.model.Tbl_ProductVO;
import com.park.mall.service.CartService;
import com.park.mall.service.Tbl_ProductService;

@Controller
public class CartController {

	@Inject Tbl_ProductService tbl_ProductService;
	@Inject CartService cartService;
	
	@RequestMapping(value = "/cartDelet/{Status.index}" ,method = RequestMethod.GET)
		public String cartDelet(@PathVariable ("Status.index") int index, HttpSession session) throws Exception {
		ArrayList<Tbl_ProductVO> arrProductVO = (ArrayList<Tbl_ProductVO>) session.getAttribute("cartList");
		arrProductVO.remove(index);
			return "redirect:/cart";
	}
		
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() throws Exception {
		
		return "cart";
	}
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartPost(@RequestParam("amount") int amount,int product_id,Tbl_ProductVO vo ,HttpSession session) throws Exception {
		ArrayList<Tbl_ProductVO> productVO = null;
		productVO = (ArrayList<Tbl_ProductVO>)session.getAttribute("cartList");
		MemberVO loginVo = (MemberVO) session.getAttribute("member");
		
		if(productVO == null) {
			productVO = new ArrayList<Tbl_ProductVO>();
		}
		// 상품 개수를 amount로 받아서 set 으로 넣기 추가
		vo = tbl_ProductService.Tbl_ProductIdCall(product_id);
		vo.setProduct_amount(amount);
		productVO.add(vo);
		session.setAttribute("cartList", productVO);
		return "cart";
	}
}
