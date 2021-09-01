package com.park.mall.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
}
