package com.park.mall.dao;

import java.util.List;

import com.park.mall.model.Pagination;
import com.park.mall.model.ProductBoardVO;

public interface ProductBoardDAO {
	
	public void insertProductBoard(ProductBoardVO productBoardVO);
	public int getBoardListCnt() throws Exception;
	
	public List<ProductBoardVO> getBoardList(Pagination pagination);

}
