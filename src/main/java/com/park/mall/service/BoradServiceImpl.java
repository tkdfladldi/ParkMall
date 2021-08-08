package com.park.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.BoradDAO;
import com.park.mall.model.BoradVO;

@Service
public class BoradServiceImpl implements BoradService{
	@Inject private BoradDAO boradDAO;
	
	@Override
	public List<BoradVO> BoradList() throws Exception {
		
		return boradDAO.BoradList();
	}

}
