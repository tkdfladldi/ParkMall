package com.park.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.ReportDAO;
import com.park.mall.model.BoradVO;
import com.park.mall.model.MemberVO;
import com.park.mall.model.ProductBoardVO;
import com.park.mall.model.ReplyVO;
import com.park.mall.model.ReportVO;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Inject ReportDAO reportDAO;
	
	@Override
	public void insertReport(ReportVO reportVo) throws Exception {
		
		reportDAO.insertReport(reportVo);
	}

	@Override
	public List<ReportVO> selReportList() throws Exception {
		return reportDAO.selReportList();
	}

	@Override
	public int reportiIdChk(String reportiIdChk) throws Exception {
		return reportDAO.reportiIdChk(reportiIdChk);
	}

	@Override
	public List<ProductBoardVO> selProductBoard(String id) {
		return reportDAO.selProductBoard(id);
	}

	@Override
	public List<BoradVO> selBoard(String id) {
		return reportDAO.selBoard(id);
	}

	@Override
	public List<ReplyVO> selreply(String id) {
		return reportDAO.selreply(id);
	}

	@Override
	public void blacklistSet(MemberVO memberVo) {
		reportDAO.blacklistSet(memberVo);
		
	}

	@Override
	public void blacklistDel(MemberVO memberVo) {
		reportDAO.blacklistDel(memberVo);
		
	}

	@Override
	public int reportlistChk(String id) {
		return reportDAO.reportlistChk(id);
	}

	@Override
	public int reportlistChk2(String id) {
		return reportDAO.reportlistChk2(id);
	}

	@Override
	public int reportlistChk3(String id) {
		return reportDAO.reportlistChk3(id);
	}

	@Override
	public int reportlistChk4(String id) {
		return reportDAO.reportlistChk4(id);
	}
}
