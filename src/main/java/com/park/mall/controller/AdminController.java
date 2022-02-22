package com.park.mall.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
		 	
		 model.addAttribute("reportlistChk", reportService.reportlistChk(id));
		 model.addAttribute("reportlistChk2", reportService.reportlistChk2(id));
		 model.addAttribute("reportlistChk3", reportService.reportlistChk3(id));
		 model.addAttribute("reportlistChk4", reportService.reportlistChk4(id));
		 
		 
		 
		 
			return "admin";
		}
		// 블랙리스트 추가 및 해제
	 	 @ResponseBody
		 @RequestMapping(value = "/admin/blacklist", method = RequestMethod.GET)
			public int blacklist(MemberVO memberVo,Model model) throws Exception{
			 if(memberVo.getBlacklist().equals("Y")) {
				 reportService.blacklistSet(memberVo);
				 int n = 0;
				 return n;
			 }else if(memberVo.getBlacklist().equals("N")) {
				 reportService.blacklistDel(memberVo);
				 int n = 0;
				 return n;
			 }
				 int n = 1;
				 return n;
		
		 }
}

