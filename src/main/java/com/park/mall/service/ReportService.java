package com.park.mall.service;

import java.util.List;

import com.park.mall.model.ReportVO;

public interface ReportService {
	
	public void insertReport(ReportVO reportVo) throws Exception;
	
	List<ReportVO> selReportList() throws Exception;
	
	 public int reportiIdChk(String reportiIdChk) throws Exception;
}
