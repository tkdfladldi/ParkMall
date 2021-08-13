package com.park.mall.model;


import java.util.Date;


public class BoradVO {
	int borad_id;
	String borad_title;
	String borad_contents;
	String borad_name;
	Date borad_time;
	public int getBorad_id() {
		return borad_id;
	}
	public void setBorad_id(int borad_id) {
		this.borad_id = borad_id;
	}
	public String getBorad_title() {
		return borad_title;
	}
	public void setBorad_title(String borad_title) {
		this.borad_title = borad_title;
	}
	public String getBorad_contents() {
		return borad_contents;
	}
	public void setBorad_contents(String borad_contents) {
		this.borad_contents = borad_contents;
	}
	public String getBorad_name() {
		return borad_name;
	}
	public void setBorad_name(String borad_name) {
		this.borad_name = borad_name;
	}
	public Date getBorad_time() {
		return borad_time;
	}
	public void setBorad_time(Date borad_time) {
		this.borad_time = borad_time;
	}
	@Override
	public String toString() {
		return "BoradVO [borad_id=" + borad_id + ", borad_title=" + borad_title + ", borad_contents=" + borad_contents
				+ ", borad_name=" + borad_name + ", borad_time=" + borad_time + "]";
	}
	
	
	

}
