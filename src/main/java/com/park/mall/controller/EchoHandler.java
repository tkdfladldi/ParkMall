package com.park.mall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.park.mall.model.MemberVO;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	

	 //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    @RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat() {
    	
		return "chat";
	}

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	sessionList.add(session);
        logger.info("{} 연결됨", session.getId());
        Map<String, Object> map;
		map = session.getAttributes();
		MemberVO memberVo = (MemberVO) map.get("member");
        for(WebSocketSession sess : sessionList){
        	sess.sendMessage(new TextMessage(memberVo.getId()+" 님이 입장하셨습니다."));
        }
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map;
		map = session.getAttributes();
		MemberVO memberVo = (MemberVO) map.get("member");
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(message.getPayload()+"<style>.name{color: blue; font-size: 20px;}a{text-decoration:none;}</style> <ui class=name> 작성자 :<a href=#>"+memberVo.getId()+"</a></ui>"));
        	}
        }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	Map<String, Object> map;
		map = session.getAttributes();
		MemberVO memberVo = (MemberVO) map.get("member");
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
        
        for(WebSocketSession sess : sessionList){
        	sess.sendMessage(new TextMessage(memberVo.getId()+" 님이 퇴장하셨습니다."));
        }
        
    }
}
