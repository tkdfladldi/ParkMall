package com.park.mall.controller;


import java.io.PrintWriter;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.park.mall.model.MemberVO;
import com.park.mall.service.MemberService;
import com.park.mall.service.Tbl_ProductServiceImpl;

@Controller
public class MemberController {
	@Inject	Tbl_ProductServiceImpl tbl_ProductService;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
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
	public String login(MemberVO memberVo,HttpServletRequest req, HttpServletResponse response,HttpSession session,RedirectAttributes rttr) throws Exception {
		
		session = req.getSession();
		MemberVO loginVo = memberService.login(memberVo);
		if(loginVo == null) {
			session.setAttribute("member", null); 
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('아이디 비밀번호가 맞지 않습니다.');</script>");	 
			out.flush();
			return "login";
		}
		else if(loginVo != null &&  pwdEncoder.matches(memberVo.getPw(), loginVo.getPw())){
			//로그인을 했을때 블랙리스트 확인
			if(loginVo.getBlacklist().equals("Y")) {
				 rttr.addFlashAttribute("Blacklist","y");
				return "redirect:/";
			}
			session.setAttribute("member", loginVo);
			return "redirect:/";
		}else {
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('아이디 비밀번호가 맞지 않습니다.');</script>");	 
			out.flush();
			return "login";
		}
		
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
			session.invalidate();
		return "redirect:/"; 
		
	}
	//회원가입
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String memberPost(MemberVO memberVo,HttpServletResponse response,Model model) throws Exception {		
		memberVo.setBlacklist("N");
		int result = memberService.idchk(memberVo);
		if(result == 1) {		 
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('아이디 중복 다시 입력해주세요.'); location.href='member';</script>");			 
			out.flush();
			return "member";
			
		}else if(result == 0) {
			// 비밀번호 시크릿
			String inputPass = memberVo.getPw();
			String pwd = pwdEncoder.encode(inputPass);
			memberVo.setPw(pwd);
		memberService.insertMember(memberVo);		 
		PrintWriter out = response.getWriter();	
		model.addAttribute("list", tbl_ProductService.listTbl_Product());
		out.println("<script>alert('회원가입 완료');</script>");
		out.flush();
		return "mainPage";
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
	
	// 비밀번호 변경 
	@RequestMapping(value="/memberPassChange",method= RequestMethod.POST)
	public String memberPassChange(MemberVO memberVo,HttpSession session,HttpServletResponse response,Model model) throws Exception{
		MemberVO dbpass = (MemberVO)session.getAttribute("member");
		 boolean incoding = pwdEncoder.matches(memberVo.getPw(), dbpass.getPw());
		 
		 if(memberVo.getEmail() == null || memberVo.getEmail() == null) {
			model.addAttribute("list", tbl_ProductService.listTbl_Product());
			 PrintWriter out = response.getWriter();	
				out.println("<script>alert('비밀번호가 맞지 않습니다.');</script>");
				out.flush();
				
			 return "mainPage";
			 
		 }
		 else if(incoding == true && memberVo.getEmail().equals(memberVo.getPhone())) {
			memberVo.setId(dbpass.getId());
				// 비밀번호 시크릿
				String inputPass = memberVo.getEmail();
				String pwd = pwdEncoder.encode(inputPass);
				memberVo.setPw(pwd);
			memberService.UpdatePass(memberVo);
//	필터있어서 가능		response.setContentType("text/html; charset=UTF-8");			 
			PrintWriter out = response.getWriter();	
			model.addAttribute("list", tbl_ProductService.listTbl_Product());
			out.println("<script>alert('비밀번호 변경 완료');</script>");
			out.flush();
			return "login";
			
		}else {
			model.addAttribute("list", tbl_ProductService.listTbl_Product());
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('비밀번호가 맞지 않습니다.');</script>");
			out.flush();
			return "mainPage";
		}
		
	}
}
