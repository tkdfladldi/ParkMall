package com.park.mall.dao;

import java.util.List;
import java.util.Map;

import com.park.mall.model.ChatRoomPeopleVO;
import com.park.mall.model.ChatRoomVO;

public interface ChatRoomMapper {
	
	
	public abstract int chatRoom(ChatRoomVO chatRoomVO);

	public abstract List<Map<String, Object>> chatRoomGet();
	
	public abstract int roomPassChk(ChatRoomVO chatRoomVO);
	
	public abstract int realPeopleChk(int peopleChk);
	
	public abstract void realPeopleAdd(int peopleChk);
	
	public abstract int realPeopleDelete(int peopleChk);
	
	public abstract int realPeopleZeroChk(int peopleChk);
	
	public abstract int delectChatRoom(int peopleChk);
	
	public abstract int chatRoomPeopleNameSel(ChatRoomPeopleVO chatRoomPeopleVO);
	
	public abstract void chatRoomPeopleAdd(ChatRoomPeopleVO chatRoomPeopleVO);
	
	public abstract void delectChatPeople(int chatRoom_num);
	
	public abstract ChatRoomPeopleVO webSocketIdSel(String websocketId);
	
	public abstract List<ChatRoomPeopleVO> ListChatPeopleSel(int roomNum);
	
	public abstract void ChatRoomPeopleDelete(ChatRoomPeopleVO chatRoomPeopleVO);
	
}
