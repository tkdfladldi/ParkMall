package com.park.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.ProductBoardDAO;
import com.park.mall.model.Pagination;
import com.park.mall.model.ProductBoardVO;

@Service
public class ProductBoardServiceImpl implements ProductBoardService{
	
	@Inject ProductBoardDAO productBoardDAO;

	@Override
	public void insertproductBoard(ProductBoardVO productBoardVO) {
		productBoardDAO.insertProductBoard(productBoardVO);
		
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return productBoardDAO.getBoardListCnt();
		}

	@Override
	public List<ProductBoardVO> getBoardList(Pagination pagination) {
		return productBoardDAO.getBoardList(pagination);
	}

}
