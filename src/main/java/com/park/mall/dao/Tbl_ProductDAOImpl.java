package com.park.mall.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.Tbl_ProductVO;


@Repository
public class Tbl_ProductDAOImpl implements Tbl_ProductDAO{
	
	@Inject private SqlSession sqlSession;
	
	@Override
	public List<Tbl_ProductVO> listTbl_Product() throws Exception {
		return sqlSession.selectList("com.park.mall.tbl_Product.selectTbl_Product");
	}

}
