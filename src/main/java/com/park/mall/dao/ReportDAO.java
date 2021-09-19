package com.park.mall.dao;

import java.util.List;

import com.park.mall.model.BoradVO;
import com.park.mall.model.MemberVO;
import com.park.mall.model.ProductBoardVO;
import com.park.mall.model.ReplyVO;
import com.park.mall.model.ReportVO;

public interface ReportDAO {
	
	public void insertReport(ReportVO reportVo) throws Exception;
	
	 List<ReportVO> selReportList() throws Exception;
	 
	 public int reportiIdChk(String reportiIdChk) throws Exception;
	 
	 public List<ProductBoardVO> selProductBoard(String id);
	 
	 public List<BoradVO> selBoard(String id);

	 public List<ReplyVO> selreply(String id);
	 
	 public void blacklistSet(MemberVO memberVo);
	 
	 public void blacklistDel(MemberVO memberVo);
	 
	 public int reportlistChk(String id);
	 public int reportlistChk2(String id);
	 public int reportlistChk3(String id);
	 public int reportlistChk4(String id);
	
}
