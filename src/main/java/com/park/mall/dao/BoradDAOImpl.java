package com.park.mall.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.BoradVO;


@Repository
public class BoradDAOImpl implements BoradDAO{
	
	
	@Inject private SqlSession sqlSession;
	
//	@Override
//	public List<BoradVO> BoradList() throws Exception {
//		return sqlSession.selectList("com.park.mall.boradMapper.selectBorad");
//	}

	@Override
	public List<BoradVO> selectBoradlimit(int index_no) throws Exception {
		return sqlSession.selectList("com.park.mall.boradMapper.selectBoradlimit",index_no);
	}

}
