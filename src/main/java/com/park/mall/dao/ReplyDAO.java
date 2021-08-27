package com.park.mall.dao;

import java.util.List;

import com.park.mall.model.ReplyVO;

public interface ReplyDAO {
	
	public void insertReply(ReplyVO replyVo) throws Exception;
	
	public List<ReplyVO> selReply(int borad_id) throws Exception;
	
	public void deleteReply(int reg_id) throws Exception;
	
	public void updateReply(int reg_id, String reg_content) throws Exception;
}
