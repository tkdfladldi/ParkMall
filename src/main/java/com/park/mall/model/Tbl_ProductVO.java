package com.park.mall.model;

import org.springframework.web.multipart.MultipartFile;

public class Tbl_ProductVO {
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_desc;
	private String product_url; //상품이미지 경로
	private MultipartFile productPhoto;
	private int product_amount;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	public MultipartFile getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}
	
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	@Override
	public String toString() {
		return "Tbl_ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_desc=" + product_desc + ", product_url=" + product_url + ", productPhoto="
				+ productPhoto + ", product_amount=" + product_amount + "]";
	}
	
	

}
