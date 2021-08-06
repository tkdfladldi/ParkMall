package com.park.mall.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.MemberDAO;
import com.park.mall.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject 
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO memberVo) throws Exception {
		memberDAO.insertMember(memberVo);
	}

	@Override
	public int idchk(MemberVO memberVo) throws Exception {
		int result = memberDAO.idchk(memberVo);
		return result;
	}

	@Override
	public MemberVO login(MemberVO memberVo) throws Exception {
		return memberDAO.login(memberVo);
	}

	@Override
	public int UpdatePass(MemberVO memberVo) throws Exception {
		return memberDAO.UpdatePass(memberVo);
	}

}
