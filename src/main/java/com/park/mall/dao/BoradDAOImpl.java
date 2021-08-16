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

	@Override
	public void insertBorad(BoradVO vo) throws Exception {
		 sqlSession.insert("com.park.mall.boradMapper.insertBorad",vo);
		
	}

	@Override
	public BoradVO boradContent(int borad_id) throws Exception {
		return sqlSession.selectOne("com.park.mall.boradMapper.selectboradContent", borad_id);
	}

	@Override
	public void boradDelete(int borad_id) throws Exception {
		sqlSession.delete("com.park.mall.boradMapper.boradDelete",borad_id);
	}

	@Override
	public void boradUpdate(BoradVO vo) throws Exception {
		sqlSession.update("com.park.mall.boradMapper.boradUpdate", vo);
		
	}

}
