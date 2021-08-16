package com.park.mall.controller;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.park.mall.model.BoradVO;
import com.park.mall.model.MemberVO;
import com.park.mall.service.BoradService;

@Controller
public class BoradController {
	@Inject BoradService boardService;
	
	
//	자유게시판 목록 조회
	@RequestMapping(value = "/borad", method = RequestMethod.GET)
	public String borad(@RequestParam Long p,Model model) throws Exception {
		//1 = 0 / 2 = 5 -/ 3 = 10
		
		int index_no = (int) ((p-1)*5) ;
		
		model.addAttribute("borad_list",boardService.selectBoradlimit(index_no));
		
//		boardService.BoradList();
		return "borad";
	}
// 글쓰기 버튼 클릭시 
	@RequestMapping(value = "/boradForm", method= RequestMethod.GET)
	public String boradForm(HttpSession session,HttpServletResponse response)throws Exception{
	
		if(session.getAttribute("member") == null) {
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('로그인이 필요한 서비스입니다.');</script>");	 
			out.flush();
			return "login";
		}
		return "boradForm";
	}
//	게시판 글 저장 버튼 클릭시
	@RequestMapping(value = "/boradForm", method= RequestMethod.POST)
	public String insertBorad(BoradVO vo, HttpSession session)throws Exception{
		boardService.insertBorad(vo);
		return "redirect:/borad?p=1&";
	}
	
//  게시글 상세 조회
	@RequestMapping(value = "/boradContent/{borad_list.borad_id}", method= RequestMethod.GET)
	public String boradContent(@PathVariable("borad_list.borad_id") int borad_id,Model model, BoradVO vo)throws Exception{
		 vo = boardService.boradContent(borad_id);
		 model.addAttribute("boradContent",vo );
	
		return "boradContent";
	}
//	게시글 삭제 버튼 기능
	@RequestMapping(value ="/boradDelete/{boradContent.borad_id}", method = RequestMethod.GET)
	public String boradDelete(@PathVariable("boradContent.borad_id") int borad_id, HttpSession session, BoradVO vo,HttpServletResponse response)throws Exception{
		vo = boardService.boradContent(borad_id);
		String voName = vo.getBorad_name();
		MemberVO sessionVo = (MemberVO)session.getAttribute("member");
		
				if(sessionVo == null) {
				return "redirect:/borad?p=1&";
			}
		else if(sessionVo.getId().equals(voName)) {
				boardService.boradDelete(borad_id);
				PrintWriter out = response.getWriter();			 
				// location.href =/borad?p=1&'; 했을경우 뒤에 boradDelete주소가 따라붙어서 window. 을 이용하여 다른 url 풀경로로 지정 
				out.println("<script>alert('삭제완료.');window.location.href='http://localhost:8080/borad?p=1&';</script>");	
				out.flush();
				return "borad?p=1&";
		}else {
			return "redirect:/borad?p=1&";
		}
	}
	
	//게시글 수정 버튼 클릭시 GET
			@RequestMapping(value="/boradUpdate/{boradContent.borad_id}", method= RequestMethod.GET)
			public String boradUpdate(@PathVariable("boradContent.borad_id") int borad_id, HttpSession session,Model model, BoradVO vo)throws Exception{
				vo = boardService.boradContent(borad_id);
				String voName = vo.getBorad_name();
				MemberVO sessionVo = (MemberVO)session.getAttribute("member");
				if(sessionVo == null) {
					return "redirect:/borad?p=1&";
				}		else if(sessionVo.getId().equals(voName)) {
					 vo = boardService.boradContent(borad_id);
					 model.addAttribute("boradContent",vo );
					 return "boradUpdate";
				}else {
					return "redirect:/borad?p=1&";
				}
			}
			@RequestMapping(value="/boradUpdate", method= RequestMethod.POST)
			public String boradUpdate(BoradVO vo,HttpServletResponse response)throws Exception{
				 boardService.boradUpdate(vo);
				 PrintWriter out = response.getWriter();		
				out.println("<script>alert('수정완료');window.location.href='http://localhost:8080/borad?p=1&';</script>");	
				out.flush();
				 return "";
				
			}
			
	}

