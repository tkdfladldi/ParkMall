package com.park.mall.service;

import java.util.List;

import com.park.mall.model.Pagination;
import com.park.mall.model.ProductBoardVO;

public interface ProductBoardService {
	
	public void insertproductBoard(ProductBoardVO productBoardVO);
	
	public int getBoardListCnt() throws Exception;
	
	public List<ProductBoardVO> getBoardList(Pagination pagination);
	

}
