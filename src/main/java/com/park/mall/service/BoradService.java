package com.park.mall.service;

import java.util.List;
import java.util.Map;

import com.park.mall.model.BoradVO;

public interface BoradService {
	
//	public List<BoradVO> BoradList() throws Exception;

	public List<BoradVO> selectBoradlimit(int index_no) throws Exception;
	
	public void insertBorad(BoradVO vo) throws Exception;
	

}
