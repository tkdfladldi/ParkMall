package com.park.mall.model;

import java.util.Date;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String indate;
	private String blacklist;
	private Date blacklist_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return indate;
	}
	public void setDate(String indate) {
		this.indate = indate;
	}
	
	public String getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}
	public Date getBlacklist_date() {
		return blacklist_date;
	}
	public void setBlacklist_date(Date blacklist_date) {
		this.blacklist_date = blacklist_date;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", indate=" + indate + ", blacklist=" + blacklist + ", blacklist_date=" + blacklist_date + "]";
	}
	
	
	
}
