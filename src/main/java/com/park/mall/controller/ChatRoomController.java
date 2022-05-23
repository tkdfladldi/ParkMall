package com.park.mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.park.mall.dao.ChatRoomDAO;
import com.park.mall.model.MemberVO;

@Controller
public class ChatRoomController extends TextWebSocketHandler{
	@Autowired
	ChatRoomDAO chatRoomDAO;

	
	@ResponseBody
	@RequestMapping(value = "/roomPassChk", method = RequestMethod.POST)
	public int roomPassChk(HttpServletRequest req) throws IOException{
			
		int chkNum =chatRoomDAO.roomPassChk(req);
		
		return chkNum;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chatRoomGet", method = RequestMethod.GET)
	public List<Map<String, Object>> chatRoomGet(HttpServletRequest req) throws IOException{
			
		List<Map<String, Object>> mapList = chatRoomDAO.chatRoomGet();
		
		for(int i = 0; i< mapList.size(); i++ ) {
			String str = (String) mapList.get(i).get("chatPassWord");
			if(!str.equals("")) {
				 mapList.get(i).put("chatPassWord", "1");
			}
		}
		
			return mapList;
	}
	@RequestMapping(value = "/chattingOpenClose", method = RequestMethod.GET)
	public String chatting2(HttpServletRequest req,HttpServletResponse response) throws IOException{
			
		int ChatRoom_num = Integer.parseInt(req.getParameter("roomNum"));
		 PrintWriter out = response.getWriter(); out.
		 println("<script>opener.location.href='/chatting?roomNum="+ChatRoom_num+"'; window.close();</script>");
		 out.flush();
		
	
		return "/new/home";
	}
	
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public String chatting(HttpServletRequest req,HttpServletResponse response, RedirectAttributes rttr) throws IOException{
			
	
		
		int peopleChk = Integer.parseInt(req.getParameter("roomNum"));
		int realPeopleChk = chatRoomDAO.realPeopleChk(peopleChk);
		
		if(realPeopleChk == 1) {
			rttr.addFlashAttribute("fullRoom","fullRoom");
			return "redirect:/newhome";
		}
		  req.setAttribute("content", "chatting.jsp");
		  req.setAttribute("roomNum", peopleChk);
		  
		return "/new/home";
	}
	 
	
	@RequestMapping(value = "/chatRoom", method = RequestMethod.POST)
	public String chatRoom(HttpServletRequest req, HttpServletResponse response,RedirectAttributes rttr) throws IOException{
		
			int ChatRoom_num = chatRoomDAO.chatRoom(req);
			
			  PrintWriter out = response.getWriter(); out.
			  println("<script>opener.location.href='/chatting?roomNum="+ChatRoom_num+"'; window.close();</script>");
			  out.flush();
			 
			
			
			return "/new/home";
	}
}
