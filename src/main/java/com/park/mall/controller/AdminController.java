package com.park.mall.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.mall.model.ReportVO;
import com.park.mall.service.ReportService;

@Controller
public class AdminController {
	@Inject ReportService reportService;
	// 관리자 페이지에 신고리스트 출력
	 @RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String chat(HttpSession session) throws Exception {
		  List<ReportVO> reportList  = reportService.selReportList();
		  session.setAttribute("ReportList", reportList);
		  		
			return "admin";
			
		}
	 @ResponseBody
	 @RequestMapping(value = "/admin/reportiIdChk", method = RequestMethod.POST)
		public int reportiIdChk(String reportiIdChk) throws Exception{
		int reportiIdChkNum = reportService.reportiIdChk(reportiIdChk);
			
			return reportiIdChkNum;
		}
		
}
