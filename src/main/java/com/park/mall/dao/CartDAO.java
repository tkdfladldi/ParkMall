package com.park.mall.dao;


import java.util.List;

import com.park.mall.model.CartVO;

public interface CartDAO {

	public void cartInsert(List<CartVO> cartVo) throws Exception;
	

	public CartVO Tbl_ProductIdCall(int product_id) throws Exception;
}
