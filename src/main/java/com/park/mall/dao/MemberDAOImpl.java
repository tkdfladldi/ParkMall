package com.park.mall.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO memberVo) throws Exception {
		sqlSession.insert("com.park.mall.member.insertMember", memberVo);
	}

	@Override
	public int idchk(MemberVO memberVo) throws Exception {
		int result = sqlSession.selectOne("com.park.mall.member.selectMember", memberVo);
	
		return result;
	}

	@Override
	public MemberVO login(MemberVO memberVo) throws Exception {
		return sqlSession.selectOne("com.park.mall.member.selectLogin", memberVo);
	}

	@Override
	public int UpdatePass(MemberVO memberVo) throws Exception {
		return sqlSession.update("com.park.mall.member.memberPassUpdate", memberVo);
	}

}
