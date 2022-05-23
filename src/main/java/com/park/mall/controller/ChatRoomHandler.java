package com.park.mall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.park.mall.dao.ChatRoomDAO;
import com.park.mall.model.ChatRoomPeopleVO;
import com.park.mall.model.MemberVO;

@RequestMapping("/chatRoomHandler")
public class ChatRoomHandler extends TextWebSocketHandler{
	
	@Autowired
	ChatRoomDAO chatRoomDAO;
	//세션 리스트
	List<WebSocketSession> listWebSocket = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(ChatRoomHandler.class);
    
  

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	Map<String, Object> sessionmap;
    	sessionmap = session.getAttributes();
		MemberVO memberVo = (MemberVO) sessionmap.get("member");
		
    	// 메세지 체크 ( 메세지를 보냈는지, 처음 접속자 인지, 방 번호 체크)
    	String str = messageChk(session, message);
    	
    	// 방 번호 초기 조회
    	ChatRoomPeopleVO ChatRoomPeopleVO = chatRoomDAO.webSocketIdSel(session.getId());
    	int roomNum = ChatRoomPeopleVO.getChatRoom_num();
    	
    	if(str.equals("3")) {
    		
    		Map<String, Object> map = new HashMap<String, Object>();
    		
    		 List<ChatRoomPeopleVO> listChatRoomPeopleVO = chatRoomDAO.ListChatPeopleSel(roomNum);
    		
    		for(int i =0; i < listChatRoomPeopleVO.size(); i++) {
    			map.put(listChatRoomPeopleVO.get(i).getChatPeopleName(), listChatRoomPeopleVO.get(i).getWebsocketId());
    			
    		}
    
    		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    		
    		if(map.containsKey(memberVo.getId())) {
    		Iterator<String> keys = map.keySet().iterator();
    		while ( keys.hasNext() ) {
    			
    			String key = keys.next();
    			String value = (String) map.get(key);
    			
    			for(int i =0; i<listWebSocket.size(); i++) {
					if(listWebSocket.get(i).getId().equals(value)) {
				
						WebSocketSession sess = (WebSocketSession) listWebSocket.get(i);
						String msgString = message.getPayload() + 
								"<style>.name{color: blue; font-size: 20px;}a{text-decoration:none;}" +
								"</style> <ui class=name> 작성자 :<a href=# " + 
								"onclick='report(\"" +
								memberVo.getId() + 
								"\")'>"+ 
								memberVo.getId() +
								"</a></ui>";
						
						sess.sendMessage(new TextMessage(msgString));
					}
				}
    		    
    		}   
    	    } 
    	}
    	else if (str.equals("2")){
    			
    	}
    	
    	
    }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	// 방 번호 조회
    	ChatRoomPeopleVO ChatRoomPeopleVO = chatRoomDAO.webSocketIdSel(session.getId());
    	
    	chatRoomDAO.realPeopleDelete(ChatRoomPeopleVO.getChatRoom_num());
    	int realPeopleChk = chatRoomDAO.realPeopleZeroChk(ChatRoomPeopleVO.getChatRoom_num());
    	if(realPeopleChk <= 0) {
    		chatRoomDAO.delectChatRoom(ChatRoomPeopleVO.getChatRoom_num());    
    		chatRoomDAO.delectChatPeople(ChatRoomPeopleVO.getChatRoom_num());    
    	}
    	
    	Map<String, Object> sessionmap;
    	sessionmap = session.getAttributes();
		MemberVO memberVo = (MemberVO) sessionmap.get("member");
        logger.info("{} 연결 끊김.", session.getId());
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        List<ChatRoomPeopleVO> listChatRoomPeopleVO = chatRoomDAO.ListChatPeopleSel(ChatRoomPeopleVO.getChatRoom_num());
        
    	for(int i =0; i < listChatRoomPeopleVO.size(); i++) {
			map.put(listChatRoomPeopleVO.get(i).getChatPeopleName(), listChatRoomPeopleVO.get(i).getWebsocketId());
		}
    	
        Iterator<String> keys = map.keySet().iterator();
		while ( keys.hasNext() ) {
			
			String key = keys.next();
			String value = (String) map.get(key);
			
			for(int i =0; i<listWebSocket.size(); i++) {
				int listWebSocketIndex = 0;
				if(!listWebSocket.get(i).getId().equals(value) &&  listWebSocket.get(i).getId() == session.getId()) {
					continue;
				}
				else if(listWebSocket.get(i).getId().equals(value) && listWebSocket.get(i).getId() != session.getId()) {	
						   listWebSocketIndex = i;
						   WebSocketSession sess = (WebSocketSession) listWebSocket.get(listWebSocketIndex);
							String msgString = (memberVo.getId()+" 님이 퇴장하셨습니다.");
						    sess.sendMessage(new TextMessage(msgString));
				}
			}
					
		}	
			// 나간사람 채팅방 사람 삭제 , listwebSocket 에서 삭제
		    chatRoomDAO.ChatRoomPeopleDelete(ChatRoomPeopleVO.getChatRoom_num() , session);
			listWebSocket.remove(session);
		    
		}   
    
    public String messageChk(WebSocketSession session, TextMessage message) throws IOException {
    	
    	
    	String ex = "?type=add&chatRoom_num=";
    	String ex2 = "?type=firstMSG";
    			
    	String str = "";
    
    	String messageAll = message.getPayload();
    	
    	if(message.getPayload().contains(ex)) {
    		  int strlast = Integer.parseInt(message.getPayload().substring(ex.length(), message.getPayloadLength()));
    		  int peopleChk = chatRoomDAO.realPeopleChk(strlast);
    		  
				
				 int selnum = chatRoomDAO.chatRoomPeopleNameSel(session , strlast); 
				 if(selnum == 0) {
				 chatRoomDAO.chatRoomPeopleAdd(session,strlast); 
				 Map<String, Object> map = new HashMap<String, Object>();
				 List<ChatRoomPeopleVO> listChatRoomPeopleVO = chatRoomDAO.ListChatPeopleSel(strlast);
				 listWebSocket.add(session);
				 
		    		for(int i =0; i < listChatRoomPeopleVO.size(); i++) {
		    			map.put(listChatRoomPeopleVO.get(i).getChatPeopleName(), listChatRoomPeopleVO.get(i).getWebsocketId());
		    		}
			        
			        Map<String, Object> sessionmap;
			        sessionmap = session.getAttributes();
					MemberVO memberVo = (MemberVO) sessionmap.get("member");
					
					
					if(map.containsKey(memberVo.getId())) {
							Iterator<String> keys = map.keySet().iterator();
						
							while ( keys.hasNext() ) {
					   	
							String key = keys.next();
							String value = (String) map.get(key);
							
							for(int i =0; i<listWebSocket.size(); i++) {
							if(listWebSocket.get(i).getId().equals(value)) {
								System.out.println("존재");
								WebSocketSession sess = (WebSocketSession) listWebSocket.get(i);
								 String msgString = memberVo.getId() + "님이 입장하셨습니다.";
										 sess.sendMessage(new TextMessage(msgString));
							}
							}
						}
					}
		    		}   
				 
				 
    		
    			if(peopleChk == 0) {
    		  		chatRoomDAO.realPeopleAdd(strlast);
    		  	}
    		  
    			
    		 str = message.getPayload().replace(messageAll, "1");
    	}
    	else if(message.getPayload().contains(ex2)) {
    		
    		
    		
    		 str = message.getPayload().replace(messageAll, "2");
    	}
    	else {
    		 str = message.getPayload().replace(messageAll, "3");
    	}
    	
    	return str;
    }
    }
