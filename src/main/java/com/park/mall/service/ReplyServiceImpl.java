package com.park.mall.service;


import java.util.List;

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

	@Override
	public List<ReplyVO> selReply(int borad_id) throws Exception {
		return replyDAO.selReply(borad_id);
	}

	@Override
	public void deleteReply(int reg_id) throws Exception {
		replyDAO.deleteReply(reg_id);
		
	}

}
