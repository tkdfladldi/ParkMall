package com.park.mall;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.park.mall.model.Search;
import com.park.mall.model.Tbl_ProductVO;
import com.park.mall.service.ProductBoardService;
import com.park.mall.service.Tbl_ProductServiceImpl;

@Controller
public class MainController {
	
	@Inject	Tbl_ProductServiceImpl tbl_ProductService;
	@Inject ProductBoardService productBoardService;
	
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
	// 상품 상세 목록 조회
	// 상품 리뷰 목록 조회 및 검색 기능
	@ResponseBody
	@RequestMapping(value = "/nike_shoesChk/{product_id}", method =RequestMethod.GET)
	public ModelAndView nike_shoesChk(@PathVariable("product_id") int product_id,ModelAndView mav ,Model model, @RequestParam(required = false, defaultValue = "1") int page ,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String searchType,@RequestParam(required = false)String keyword
			) throws Exception {

		mav.setViewName("nike_shoesChk");
		
		mav.addObject("vo",  tbl_ProductService.Tbl_ProductIdCall(product_id));
		
		Search search = new Search();
		search.setProduct_id(product_id);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int ListCnt = productBoardService.getBoardListCnt(search);
		model.addAttribute("pagination", search);
		search.pageInfo(page, range, ListCnt);
		search.setProduct_id(product_id);
		model.addAttribute("productBoardList", productBoardService.getBoardList(search));
		
		

		return mav;

		}
		
		
	}
	
