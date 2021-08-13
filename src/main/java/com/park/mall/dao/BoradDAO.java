package com.park.mall.dao;

import java.util.List;

import com.park.mall.model.BoradVO;

public interface BoradDAO {

//	public List<BoradVO> BoradList() throws Exception;
	
	public List<BoradVO> selectBoradlimit(int index_no) throws Exception;
	
	public void insertBorad(BoradVO vo) throws Exception;
}
