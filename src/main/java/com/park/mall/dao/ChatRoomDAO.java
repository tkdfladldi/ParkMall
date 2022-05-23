package com.park.mall.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.WebSocketSession;

import com.mysql.cj.Session;
import com.park.mall.model.ChatRoomPeopleVO;
import com.park.mall.model.ChatRoomVO;
import com.park.mall.model.MemberVO;

@Service
public class ChatRoomDAO {
	
	@Autowired
	SqlSession ss;
	
	public int chatRoom(HttpServletRequest req) {
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		MemberVO memberVO =	(MemberVO) req.getSession().getAttribute("member");
		chatRoomVO.setRealPeople(0);
		chatRoomVO.setChatRoom_Name(req.getParameter("inputName"));
		chatRoomVO.setPeople(Integer.parseInt(req.getParameter("people")));
		chatRoomVO.setCategory(req.getParameter("category"));
		chatRoomVO.setChatPassWord(req.getParameter("inputPassword"));
		chatRoomVO.setHostName(memberVO.getId());
		ss.getMapper(ChatRoomMapper.class).chatRoom(chatRoomVO);
		// mybatis 에서 chatRoomVO 객체에 넘겨준  ChatRoom_num 값을 반환한다.
		return chatRoomVO.getChatRoom_num();
	}
	public List<Map<String, Object>> chatRoomGet() {
		
		return ss.getMapper(ChatRoomMapper.class).chatRoomGet();
		
	}
	public int roomPassChk(HttpServletRequest req) {
		ChatRoomVO chatRoomVO = new ChatRoomVO();

		chatRoomVO.setChatPassWord(req.getParameter("chatPassWord"));
		chatRoomVO.setChatRoom_num(Integer.parseInt(req.getParameter("chatRoom_num")));
		
		
		
		return ss.getMapper(ChatRoomMapper.class).roomPassChk(chatRoomVO);
		
	}
	public int realPeopleChk(int peopleChk) {
		return ss.getMapper(ChatRoomMapper.class).realPeopleChk(peopleChk);
		
	}
	public void realPeopleAdd(int peopleChk) {
	 ss.getMapper(ChatRoomMapper.class).realPeopleAdd(peopleChk);
	}
	public int realPeopleDelete(int peopleChk) {
		 int num = ss.getMapper(ChatRoomMapper.class).realPeopleDelete(peopleChk);
		return 1;		
    }
	public int realPeopleZeroChk(int peopleChk) {
		return ss.getMapper(ChatRoomMapper.class).realPeopleZeroChk(peopleChk);
	}
	public void delectChatRoom(int peopleChk) {
		 ss.getMapper(ChatRoomMapper.class).delectChatRoom(peopleChk);
	}
	public int chatRoomPeopleNameSel(WebSocketSession session, int strlast) {
			Map<String, Object> map;
			map = session.getAttributes();
			MemberVO memberVo = (MemberVO) map.get("member");
			
			ChatRoomPeopleVO chatRoomPeopleVO = new ChatRoomPeopleVO();
			chatRoomPeopleVO.setChatPeopleName(memberVo.getId());
			chatRoomPeopleVO.setChatRoom_num(strlast);
		 return ss.getMapper(ChatRoomMapper.class).chatRoomPeopleNameSel(chatRoomPeopleVO);
	}
	public void chatRoomPeopleAdd(WebSocketSession session, int strlast) {

		Map<String, Object> map;
		map = session.getAttributes();
		MemberVO memberVo = (MemberVO) map.get("member");
		
		ChatRoomPeopleVO chatRoomPeopleVO = new ChatRoomPeopleVO();
		
		chatRoomPeopleVO.setChatRoom_num(strlast);
		chatRoomPeopleVO.setChatPeopleName(memberVo.getId());
		chatRoomPeopleVO.setWebsocketId(session.getId());
		 ss.getMapper(ChatRoomMapper.class).chatRoomPeopleAdd(chatRoomPeopleVO);
	}
	public void delectChatPeople(int chatRoom_num) {
		 ss.getMapper(ChatRoomMapper.class).delectChatPeople(chatRoom_num);
	}
	
	public ChatRoomPeopleVO webSocketIdSel(String websocketId) {
		return ss.getMapper(ChatRoomMapper.class).webSocketIdSel(websocketId);
	}
	public List<ChatRoomPeopleVO> ListChatPeopleSel(int roomNum){
		return ss.getMapper(ChatRoomMapper.class).ListChatPeopleSel(roomNum);
	}
	public void ChatRoomPeopleDelete(int chatRoom_num  , WebSocketSession session) {
		
		ChatRoomPeopleVO chatRoomPeopleVO = new ChatRoomPeopleVO();
		chatRoomPeopleVO.setChatRoom_num(chatRoom_num);
		chatRoomPeopleVO.setWebsocketId(session.getId());
		
		ss.getMapper(ChatRoomMapper.class).ChatRoomPeopleDelete(chatRoomPeopleVO);
		
	}
	
}
