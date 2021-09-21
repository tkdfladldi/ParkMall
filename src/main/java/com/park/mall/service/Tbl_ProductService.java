package com.park.mall.service;

import java.util.List;

import com.park.mall.model.Tbl_ProductVO;

public interface Tbl_ProductService {
	
	public List<Tbl_ProductVO> listTbl_Product()  throws Exception;
	
	public Tbl_ProductVO Tbl_ProductIdCall(int product_id) throws Exception;
	
}
