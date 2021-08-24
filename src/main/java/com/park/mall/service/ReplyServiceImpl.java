package com.park.mall.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.ReplyDAO;
import com.park.mall.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject ReplyDAO replyDAO;
	
	@Override
	public void insertReply(ReplyVO replyVo) throws Exception {
		replyDAO.insertReply(replyVo);
	}
	
	

}
