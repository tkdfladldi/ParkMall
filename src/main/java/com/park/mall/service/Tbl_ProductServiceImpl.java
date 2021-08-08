package com.park.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.Tbl_ProductDAO;
import com.park.mall.model.Tbl_ProductVO;
@Service
public class Tbl_ProductServiceImpl implements Tbl_ProductService{
	
	@Inject
	private Tbl_ProductDAO tbl_ProductDAO;
	
	@Override
	public List<Tbl_ProductVO> listTbl_Product()  throws Exception {
		return tbl_ProductDAO.listTbl_Product();
	}

	@Override
	public Tbl_ProductVO Tbl_ProductIdCall(int product_id) throws Exception {
		return tbl_ProductDAO.Tbl_ProductIdCall(product_id);
	}

}
