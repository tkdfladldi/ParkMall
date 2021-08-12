package com.park.mall.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.park.mall.service.BoradService;

@Controller
public class BoradController {
	@Inject BoradService boardService;
	
	@RequestMapping(value = "/borad", method = RequestMethod.GET)
	public String borad(@RequestParam Long p,Model model) throws Exception {
		//1 = 0 / 2 = 5 -/ 3 = 10
		
		int index_no = (int) ((p-1)*5) ;
		
		model.addAttribute("borad_list",boardService.selectBoradlimit(index_no));
		
//		boardService.BoradList();
		return "borad";
	}
}
