package com.park.mall.model;

import java.util.Date;

public class ProductBoardVO {
	int productBoard_id;
	String productBoard_contents;
	Date productBoard_date;
	int productBoard_hit;
	String productBoard_name;
	int product_id;
	
	
	public int getProductBoard_id() {
		return productBoard_id;
	}
	public void setProductBoard_id(int productBoard_id) {
		this.productBoard_id = productBoard_id;
	}
	public String getProductBoard_contents() {
		return productBoard_contents;
	}
	public void setProductBoard_contents(String productBoard_contents) {
		this.productBoard_contents = productBoard_contents;
	}
	public Date getProductBoard_date() {
		return productBoard_date;
	}
	public void setProductBoard_date(Date productBoard_date) {
		this.productBoard_date = productBoard_date;
	}
	public int getProductBoard_hit() {
		return productBoard_hit;
	}
	public void setProductBoard_hit(int productBoard_hit) {
		this.productBoard_hit = productBoard_hit;
	}
	public String getProductBoard_name() {
		return productBoard_name;
	}
	public void setProductBoard_name(String productBoard_name) {
		this.productBoard_name = productBoard_name;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "ProductBoardVO [productBoard_id=" + productBoard_id + ", productBoard_contents=" + productBoard_contents
				+ ", productBoard_date=" + productBoard_date + ", productBoard_hit=" + productBoard_hit
				+ ", productBoard_name=" + productBoard_name + ", product_id=" + product_id + "]";
	}
	
	
	
}
