package com.park.mall.controller;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.park.mall.model.MemberVO;
import com.park.mall.model.Tbl_ProductVO;
import com.park.mall.service.Tbl_ProductService;
		
@Controller
public class CartController {
	@Inject Tbl_ProductService tbl_ProductService;
	@RequestMapping(value = "/cartDelet/{Status.index}" ,method = RequestMethod.GET)
		public String cartDelet(@PathVariable ("Status.index") int index, HttpSession session) throws Exception {
		ArrayList<Tbl_ProductVO> productVO = (ArrayList<Tbl_ProductVO>) session.getAttribute("cartList");
		productVO.remove(index);
		
		int productPriceAdd = 0;
		int	productPriceChk = 0;
		// 장바구니 상품 총 가격 계산
		for(int i = 0; i<productVO.size(); i++) {
				if(productVO.get(i).getProduct_amount() > 1) {
					productPriceChk = productVO.get(i).getProduct_price() * productVO.get(i).getProduct_amount();
				}else{
					productPriceChk += productVO.get(i).getProduct_price();
				}
				productPriceAdd += productPriceChk;
		}
		session.setAttribute("productPriceAdd", productPriceAdd);
			return "redirect:/cart";
	}
		
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() throws Exception {
		
		return "cart";
	}
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartPost(@CookieValue(name = "name", required =  false) String cookierequ,@RequestParam("amount") int amount,int product_id,Tbl_ProductVO vo ,HttpSession session,HttpServletRequest req,HttpServletResponse hsr) throws Exception {
		
		
		ArrayList<Tbl_ProductVO> productVO = null;
		productVO = (ArrayList<Tbl_ProductVO>)session.getAttribute("cartList");
		
		if(productVO == null) {
			productVO = new ArrayList<Tbl_ProductVO>();
		}
		// 상품 개수를 amount로 받아서 set 으로 넣기 추가
		vo = tbl_ProductService.Tbl_ProductIdCall(product_id);
		vo.setProduct_amount(amount);
		productVO.add(vo);
		session.setAttribute("cartList", productVO);
		
		int productPriceAdd = 0;
		int	productPriceChk = 0;
		// 장바구니 상품 총 가격 계산
		for(int i = 0; i<productVO.size(); i++) {
				if(productVO.get(i).getProduct_amount() > 1) {
					productPriceChk = productVO.get(i).getProduct_price() * productVO.get(i).getProduct_amount();
				}else{
					productPriceChk += productVO.get(i).getProduct_price();
				}
				productPriceAdd += productPriceChk;
		}
	
		session.setAttribute("productPriceAdd", productPriceAdd);
		
		return "cart";
	}
}
