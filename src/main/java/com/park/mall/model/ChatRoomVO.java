package com.park.mall.model;

public class ChatRoomVO {
	
	private int chatRoom_num;
	private String chatRoom_Name;
	private String hostName;
	private int people;
	private int realPeople;
	private String category;
	private String chatPassWord;
	
	public int getChatRoom_num() {
		return chatRoom_num;
	}
	public void setChatRoom_num(int chatRoom_num) {
		this.chatRoom_num = chatRoom_num;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getChatPassWord() {
		return chatPassWord;
	}
	public void setChatPassWord(String chatPassWord) {
		this.chatPassWord = chatPassWord;
	}
	public String getChatRoom_Name() {
		return chatRoom_Name;
	}
	public void setChatRoom_Name(String chatRoom_Name) {
		this.chatRoom_Name = chatRoom_Name;
	}
	public int getRealPeople() {
		return realPeople;
	}
	public void setRealPeople(int realPeople) {
		this.realPeople = realPeople;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [chatRoom_num=" + chatRoom_num + ", chatRoom_Name=" + chatRoom_Name + ", hostName="
				+ hostName + ", people=" + people + ", realPeople=" + realPeople + ", category=" + category
				+ ", chatPassWord=" + chatPassWord + "]";
	}
	
}
