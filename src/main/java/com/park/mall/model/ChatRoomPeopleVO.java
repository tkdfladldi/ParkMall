package com.park.mall.model;

public class ChatRoomPeopleVO {
	
int chatRoom_num;

String ChatPeopleName;

String websocketId;

public int getChatRoom_num() {
	return chatRoom_num;
}

public void setChatRoom_num(int chatRoom_num) {
	this.chatRoom_num = chatRoom_num;
}

public String getChatPeopleName() {
	return ChatPeopleName;
}

public void setChatPeopleName(String chatPeopleName) {
	ChatPeopleName = chatPeopleName;
}

public String getWebsocketId() {
	return websocketId;
}

public void setWebsocketId(String websocketId) {
	this.websocketId = websocketId;
}

@Override
public String toString() {
	return "ChatRoomPeopleVO [chatRoom_num=" + chatRoom_num + ", ChatPeopleName=" + ChatPeopleName + ", websocketId="
			+ websocketId + "]";
}
}
