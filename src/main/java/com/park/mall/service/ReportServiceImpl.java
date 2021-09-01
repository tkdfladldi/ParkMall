package com.park.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.park.mall.dao.ReportDAO;
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
}
