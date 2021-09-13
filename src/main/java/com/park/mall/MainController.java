package com.park.mall;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.park.mall.model.Pagination;
import com.park.mall.service.ProductBoardService;
import com.park.mall.service.Tbl_ProductServiceImpl;

@Controller
public class MainController {
	@Inject
	Tbl_ProductServiceImpl tbl_ProductService;
	@Inject ProductBoardService productBoardService;
	
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
	// 상품 상세 목록 조회
	@ResponseBody
	@RequestMapping(value = "/nike_shoesChk/{product_id}", method =RequestMethod.GET)
	public ModelAndView nike_shoesChk(@PathVariable("product_id") int product_id,ModelAndView mav ,Model model, @RequestParam(required = false, defaultValue = "1") int page ,
			@RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {

		mav.setViewName("nike_shoesChk");
		mav.addObject("vo",  tbl_ProductService.Tbl_ProductIdCall(product_id));
		
		int ListCnt = productBoardService.getBoardListCnt();
		Pagination pagination = new Pagination();
		model.addAttribute("pagination", pagination);
		 pagination.pageInfo(page, range, ListCnt);
		model.addAttribute("productBoardList", productBoardService.getBoardList(pagination));
		
		

		return mav;

		}
		
		
	}
	
