package com.park.mall.controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CrawlingController {
	// 우리동네 날씨 정보 가져오기 
	@RequestMapping(value = "/crawling", method = RequestMethod.GET)
	public String member(Model model) throws IOException {
		  String URL = "https://weather.naver.com/today";
	        Document doc = Jsoup.connect(URL).get();
	        Elements elem = doc.select(".today_weather");
	        String[] str = elem.text().split(" ");
	        
	        model.addAttribute("test1", elem);

		return "today_weather";
	}
}
