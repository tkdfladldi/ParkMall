package com.park.mall.service;

import java.util.ArrayList;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.CartDAO;
import com.park.mall.model.CartVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Inject 
	private CartDAO cartDAO;
	
	@Override
	public void cartInsert(List<CartVO> cartVo) throws Exception {
		cartDAO.cartInsert(cartVo);
	}

	@Override
	public CartVO Tbl_ProductIdCall(int product_id) throws Exception {
		return cartDAO.Tbl_ProductIdCall(product_id);
	}

}
