package com.park.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.BoradDAO;
import com.park.mall.model.BoradVO;

@Service
public class BoradServiceImpl implements BoradService{
	@Inject private BoradDAO boradDAO;
	
//	@Override
//	public List<BoradVO> BoradList() throws Exception {
//		
//		return boradDAO.BoradList();
//	}


	@Override
	public List<BoradVO> selectBoradlimit(int index_no) throws Exception {
		return boradDAO.selectBoradlimit(index_no);
	}

	@Override
	public void insertBorad(BoradVO vo) throws Exception {
		boradDAO.insertBorad(vo);
	}

	@Override
	public BoradVO boradContent(int borad_id) throws Exception {
		return boradDAO.boradContent(borad_id);
	}

}
