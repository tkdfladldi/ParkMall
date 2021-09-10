package com.park.mall.controller;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.park.mall.model.MemberVO;
import com.park.mall.model.ProductBoardVO;
import com.park.mall.service.ProductBoardService;

@Controller
public class ProductBoardController {
	@Inject ProductBoardService productBoardService;
//	리뷰 글 저장 클릭 포스트
	@ResponseBody
	@RequestMapping(value = "/insertProductBorad", method= RequestMethod.POST)
	public int insertProductBorad(ProductBoardVO productBoardVO,HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO != null) {
			productBoardVO.setProductBoard_name(memberVO.getId());
			productBoardService.insertproductBoard(productBoardVO);
			int n = 0;
			return n;
		}
		 int n = 1;
		return n;
	}
}
