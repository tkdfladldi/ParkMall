package com.park.mall.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.park.mall.service.BoradService;

@Controller
public class BoradController {
	@Inject BoradService boardService;
	
	@RequestMapping(value = "/borad", method = RequestMethod.GET)
	public String borad(Model model) throws Exception {
		model.addAttribute("borad_list", boardService.BoradList());
//		boardService.BoradList();
		return "borad";
	}
}
