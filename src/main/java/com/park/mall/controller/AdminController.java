package com.park.mall.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.mall.model.MemberVO;
import com.park.mall.model.ReportVO;
import com.park.mall.service.MemberService;
import com.park.mall.service.ReportService;

@Controller
public class AdminController {
	@Inject ReportService reportService;
	@Inject MemberService memberService;
	
	// 관리자 페이지에 신고리스트 출력
	 @RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String chat(HttpSession session) throws Exception {
		  List<ReportVO> reportList  = reportService.selReportList();
		  session.setAttribute("ReportList", reportList);
			return "admin";
			
		}
	 //회원 신고 누적 횟수 확인
	 @ResponseBody
	 @RequestMapping(value = "/admin/reportiIdChk", method = RequestMethod.POST)
		public int reportiIdChk(String reportiIdChk) throws Exception{
		 	int reportiIdChkNum = reportService.reportiIdChk(reportiIdChk);
			return reportiIdChkNum;
		}
	 //관리자 회원 검색시 , 회원정보 , 게시판 목록, 댓글 ,리뷰 글 조회
	 @RequestMapping(value = "/admin/selectAdminPage", method = RequestMethod.GET)
		public String selectAdminPage(MemberVO memberVo,Model model) throws Exception{
		 model.addAttribute("selectmember", memberService.login(memberVo));
		 String id = memberVo.getId();
		 model.addAttribute("memberProductBoard", reportService.selProductBoard(id));
		 model.addAttribute("memberBoard", reportService.selBoard(id));
		 model.addAttribute("memberReply", reportService.selreply(id));
		 	
		 
			return "admin";
		}
		
}
