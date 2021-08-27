package com.park.mall.dao;

import java.util.HashMap;
import java.util.List;


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

	@Override
	public List<ReplyVO> selReply(int borad_id) throws Exception {
		return sqlSession.selectList("com.park.mall.reply.selReply", borad_id);
	}

	@Override
	public void deleteReply(int reg_id) throws Exception {
		sqlSession.delete("com.park.mall.reply.deleteReply",reg_id);
		
	}

	@Override
	public void updateReply(int reg_id, String reg_content) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
	    map.put("reg_id", reg_id);
	    map.put("reg_content", reg_content);
		
		sqlSession.update("com.park.mall.reply.updateReply", map);
		
	}

}
