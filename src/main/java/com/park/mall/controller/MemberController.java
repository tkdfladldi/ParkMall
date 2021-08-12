package com.park.mall.controller;


import java.io.PrintWriter;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.mall.model.MemberVO;
import com.park.mall.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
	
		return "member";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView() {
	
		return "login";
	}
	@RequestMapping(value = "/memberChk", method = RequestMethod.GET)
	public String memberChk() {
	
		return "memberChk";
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVo,HttpServletRequest req, HttpServletResponse response,HttpSession session) throws Exception {
		
		session = req.getSession();
		MemberVO loginVo = memberService.login(memberVo);
		if(loginVo == null) {
			session.setAttribute("member", null);
//			response.setContentType("text/html; charset=UTF-8");			 
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('아이디 비밀번호가 맞지 않습니다.');</script>");	 
			out.flush();
			return "login";
		}else {
			
			session.setAttribute("member", loginVo);
			return "redirect:/mainPage";
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
			session.invalidate();
		return "mainPage"; 
		
	}
	//회원가입
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String memberPost(MemberVO memberVo,HttpServletResponse response) throws Exception {		
		int result = memberService.idchk(memberVo);
		if(result == 1) {
//			response.setContentType("text/html; charset=UTF-8");			 
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('아이디 중복 다시 입력해주세요.'); location.href='member';</script>");			 
			out.flush();
			return "member";
			
		}else if(result == 0) {
		memberService.insertMember(memberVo);
//		response.setContentType("text/html; charset=UTF-8");			 
		PrintWriter out = response.getWriter();	
		out.println("<script>alert('회원가입 완료');</script>");
		out.flush();
		}
		return "mainPage";
		
	}
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value= "/idchk", method = RequestMethod.POST)
	public int idchk(MemberVO memberVo) throws Exception{
		memberService.idchk(memberVo);
		int result = memberService.idchk(memberVo);
		return result;
	}
	@RequestMapping(value = "/memberPassChange", method = RequestMethod.GET)
	public String memberPassChange() {
	
		return "memberPassChange";
	}
	
	
	@RequestMapping(value="/memberPassChange",method= RequestMethod.POST)
	public String memberPassChange(MemberVO memberVo,HttpSession session,HttpServletResponse response) throws Exception{
		MemberVO dbpass = (MemberVO)session.getAttribute("member");
		if(dbpass.getPw().equals(memberVo.getPw()) && memberVo.getEmail().equals(memberVo.getPhone())) {
			memberVo.setId(dbpass.getId());
			 memberVo.setPw(memberVo.getEmail());
			memberService.UpdatePass(memberVo);
//	필터있어서 가능		response.setContentType("text/html; charset=UTF-8");			 
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('비밀번호 변경 완료');</script>");
			out.flush();
			return "member";
			
		}
		return "mainPage";
		
	}
}
