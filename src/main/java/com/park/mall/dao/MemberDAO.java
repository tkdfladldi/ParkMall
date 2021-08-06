package com.park.mall.dao;

import com.park.mall.model.MemberVO;

public interface MemberDAO {
	//회원가입
	public void insertMember(MemberVO memberVo) throws Exception;
	//아이디 중복  체크
	public int idchk(MemberVO memberVo) throws Exception;
	
	public MemberVO login(MemberVO memberVo) throws Exception;

}
