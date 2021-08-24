package com.park.mall.model;

import java.util.Date;

public class ReplyVO {
		int reg_id;
		String reg_name;
		Date reg_date;
		String reg_content;
	    int borad_id;
	    
	    
		public int getReg_id() {
			return reg_id;
		}
		public void setReg_id(int reg_id) {
			this.reg_id = reg_id;
		}
		public String getReg_name() {
			return reg_name;
		}
		public void setReg_name(String reg_name) {
			this.reg_name = reg_name;
		}
		public Date getReg_date() {
			return reg_date;
		}
		public void setReg_date(Date reg_date) {
			this.reg_date = reg_date;
		}
		public String getReg_content() {
			return reg_content;
		}
		public void setReg_content(String reg_content) {
			this.reg_content = reg_content;
		}
		public int getBorad_id() {
			return borad_id;
		}
		public void setBorad_id(int borad_id) {
			this.borad_id = borad_id;
		}
		
		@Override
		public String toString() {
			return "ReplyVO [reg_id=" + reg_id + ", reg_name=" + reg_name + ", reg_date=" + reg_date + ", reg_content="
					+ reg_content + ", borad_id=" + borad_id + "]";
		}
	    
	    
	

}
