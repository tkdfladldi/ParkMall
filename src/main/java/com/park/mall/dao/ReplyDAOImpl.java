package com.park.mall.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject SqlSession sqlSession;
	
	@Override
	public void insertReply(ReplyVO replyVo) throws Exception {

		sqlSession.insert("com.park.mall.reply.insertReply", replyVo);
	}

}
