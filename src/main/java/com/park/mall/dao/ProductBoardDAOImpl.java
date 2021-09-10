package com.park.mall.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.Pagination;
import com.park.mall.model.ProductBoardVO;

@Repository
public class ProductBoardDAOImpl implements ProductBoardDAO{
	
	@Inject private SqlSession sqlSession;

	@Override
	public void insertProductBoard(ProductBoardVO productBoardVO) {
		sqlSession.insert("com.park.mall.productBoard.insertproductBoard",productBoardVO);
		
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("com.park.mall.productBoard.getBoardListCnt");
	}

	@Override
	public List<ProductBoardVO> getBoardList(Pagination pagination) {
		
		return sqlSession.selectList("com.park.mall.productBoard.getBoardList", pagination);
	}

}
