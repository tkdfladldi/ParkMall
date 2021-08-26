package com.park.mall.service;

import java.util.List;

import com.park.mall.model.ReplyVO;

public interface ReplyService {
	
	public void insertReply(ReplyVO replyVo) throws Exception ;
	
	public List<ReplyVO> selReply(int borad_id) throws Exception;
	
	public void deleteReply(int reg_id) throws Exception;
}
