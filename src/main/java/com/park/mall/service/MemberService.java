package com.park.mall.service;

import com.park.mall.model.MemberVO;

public interface MemberService {
	
	public void insertMember(MemberVO memberVo) throws Exception;
	
	public int idchk(MemberVO memberVo) throws Exception;
	
	public MemberVO login(MemberVO memberVo) throws Exception;
	
	public int UpdatePass(MemberVO memberVo) throws Exception;
}
