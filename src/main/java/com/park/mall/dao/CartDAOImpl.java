package com.park.mall.dao;

import java.util.ArrayList;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject private SqlSession sqlSession;

	@Override
	public void cartInsert(List<CartVO> cartVo) throws Exception {
	    sqlSession.insert("com.park.mall.cart.cartInsert", cartVo);
	}

	@Override
	public CartVO Tbl_ProductIdCall(int product_id) throws Exception {
		return sqlSession.selectOne("com.park.mall.cart.selectTbl_ProductIdCall",product_id);
	}
	
	

}
