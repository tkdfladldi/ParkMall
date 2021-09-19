package com.park.mall.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.park.mall.model.BoradVO;
import com.park.mall.model.MemberVO;
import com.park.mall.model.ProductBoardVO;
import com.park.mall.model.ReplyVO;
import com.park.mall.model.ReportVO;


@Repository
public class ReportDAOImpl implements ReportDAO{

	@Inject private SqlSession sqlSession;
		
	@Override
	public void insertReport(ReportVO reportVo) throws Exception{
		sqlSession.insert("com.park.mall.report.insertreport", reportVo);
	}

	@Override
	public List<ReportVO> selReportList() throws Exception{
		return sqlSession.selectList("com.park.mall.report.selReportList");
	}

	@Override
	public int reportiIdChk(String reportiIdChk) throws Exception {
		
		return sqlSession.selectOne("com.park.mall.report.reportiIdChk", reportiIdChk);
	}

	@Override
	public List<ProductBoardVO> selProductBoard(String id) {
		return sqlSession.selectList("com.park.mall.report.selProductBoard", id);
	}

	@Override
	public List<BoradVO> selBoard(String id) { 
		return sqlSession.selectList("com.park.mall.report.selBoard", id);
	}

	@Override
	public List<ReplyVO> selreply(String id) {
		return sqlSession.selectList("com.park.mall.report.selreply", id);
	}

	@Override
	public void blacklistSet(MemberVO memberVo) {
			sqlSession.update("com.park.mall.report.blacklistset", memberVo);
		
	}

	@Override
	public void blacklistDel(MemberVO memberVo) {
		sqlSession.update("com.park.mall.report.blacklistDel", memberVo);
		
	}

	@Override
	public int reportlistChk(String id) {
		return sqlSession.selectOne("com.park.mall.report.reportlistChk", id);
	}

	@Override
	public int reportlistChk2(String id) {
		return sqlSession.selectOne("com.park.mall.report.reportlistChk2", id);
	}

	@Override
	public int reportlistChk3(String id) {
		return sqlSession.selectOne("com.park.mall.report.reportlistChk3", id);
	}

	@Override
	public int reportlistChk4(String id) {
		return sqlSession.selectOne("com.park.mall.report.reportlistChk4", id);
	}
}
