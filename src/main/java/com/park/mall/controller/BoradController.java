package com.park.mall.controller;
import java.io.PrintWriter;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.park.mall.model.BoradVO;
import com.park.mall.model.MemberVO;
import com.park.mall.model.ReplyVO;
import com.park.mall.model.SearchCriteria;
import com.park.mall.service.BoradService;
import com.park.mall.service.ReplyService;

@Controller
public class BoradController {
	@Inject BoradService boardService;
	@Inject ReplyService replyService;
	
//	자유게시판 목록 조회
	@RequestMapping(value = "/borad", method = RequestMethod.GET)
	public String borad(@RequestParam Long p,Model model,String searchType ,String keyword,SearchCriteria searchCriteria) throws Exception {
		// 서칭 값이 들어 갈경우 서칭값 조회
		if(keyword != null &&searchType != null && searchType.length() != 0 && keyword.length() != 0) {
			searchCriteria.setKeyword(keyword);
			searchCriteria.setSearchType(searchType);
			model.addAttribute("searchCriteria",searchCriteria);
			
			int index_no = (int) ((p-1)*5) ;
			model.addAttribute("searchList",boardService.searchList(searchType, keyword,index_no));
			return "borad";
		}
		//서칭값이 들어가지않는 모든 자유게시판 목록 리스트 조회
		//1 = 0 / 2 = 5 -/ 3 = 10
		int index_no = (int) ((p-1)*5) ;
		
		model.addAttribute("borad_list",boardService.selectBoradlimit(index_no));
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
		 model.addAttribute("replyList", replyService.selReply(borad_id));
		return "boradContent";
	}
//	게시글 삭제 버튼 기능
	@RequestMapping(value ="/boradDelete/{boradContent.borad_id}", method = RequestMethod.GET)
	public String boradDelete(@PathVariable("boradContent.borad_id") int borad_id, HttpSession session, BoradVO vo,HttpServletResponse response
			,RedirectAttributes rttr)throws Exception{
		vo = boardService.boradContent(borad_id);
		String voName = vo.getBorad_name();
		MemberVO sessionVo = (MemberVO)session.getAttribute("member");
		ArrayList<ReplyVO> replyVO= (ArrayList<ReplyVO>) replyService.selReply(borad_id);
				if(sessionVo == null) {
					
				return "redirect:/borad?p=1&";
			}
		else if(sessionVo.getId().equals(voName)) {
				if(replyVO.size() > 0){
					rttr.addFlashAttribute("boardDelMsg", "x");
					return "redirect:/boradContent/"+borad_id;
				}
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
			public void boradUpdate(BoradVO vo,HttpServletResponse response)throws Exception{
				 boardService.boradUpdate(vo);
				 PrintWriter out = response.getWriter();		
				 out.println("<script>alert('수정완료.');window.location.href='http://localhost:8080/borad?p=1&';</script>");	
				out.flush();
			}
			// 댓글 작성 기능
			// ResponseBody 리턴되는 값은 View 를 통해서 출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됨. 
			@ResponseBody
			@RequestMapping(value="/boradContent/replyInsert", method= RequestMethod.POST)
			public int replyInsert(ReplyVO replyVo, HttpSession session)throws Exception{
				MemberVO memberVo = (MemberVO) session.getAttribute("member");
				if(memberVo != null) {
					int n =0;
					replyVo.setReg_name(memberVo.getId());
					replyService.insertReply(replyVo);
				return n;
				}
				else {
					int n =1;
				return n;
				}
			}
			// 댓글 삭제
			@ResponseBody
			@RequestMapping(value="/boradContent/replyDelete", method= RequestMethod.POST)
				public int replyDelete(int reg_id,String reg_name,HttpSession session) throws Exception{
				MemberVO login = (MemberVO) session.getAttribute("member");
					if(login == null) {
						int n= 1;
						return n;
					}	
					else if(login.getId().equals(reg_name)) {
						replyService.deleteReply(reg_id);
						int n= 2;
						return n;
					}
					int n= 1;
					return n;
			}
			//댓글 수정
			@RequestMapping(value="/boradContent/replyUpdate", method= RequestMethod.GET)
				public String replyUpdate(@RequestParam int reg_id,@RequestParam int borad_id,@RequestParam String reg_content) throws Exception{
				
				replyService.updateReply(reg_id, reg_content);
				
					return "redirect:/boradContent/"+borad_id;
			}
			
			
	}

