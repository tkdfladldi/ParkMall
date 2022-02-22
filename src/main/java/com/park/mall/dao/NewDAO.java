package com.park.mall.dao;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.mall.model.MemberVO;
import com.park.mall.model.SleepVO;

@Service
public class NewDAO {
	@Autowired
	SqlSession ss;
	
	
	public int insertSleep(HttpServletRequest req , long dbtimeCal) {
		
		MemberVO memberVO =	(MemberVO) req.getSession().getAttribute("member");
		SleepVO sleepVO = new SleepVO();
		sleepVO.setUserId(memberVO.getId());
		sleepVO.setSleep(dbtimeCal);
		
		return ss.getMapper(NewMapper.class).insertSleep(sleepVO);
	}
	public SleepVO selectSleep(HttpServletRequest req) {
		
			MemberVO memberVO =	(MemberVO) req.getSession().getAttribute("member");
			SleepVO sleepVO = new SleepVO();
			sleepVO.setUserId(memberVO.getId());
			
			return ss.getMapper(NewMapper.class).selectSleep(sleepVO);
	}
	public int sleepDelete(HttpServletRequest req) {
		
		MemberVO memberVO =	(MemberVO) req.getSession().getAttribute("member");
		SleepVO sleepVO = new SleepVO();
		sleepVO.setUserId(memberVO.getId());
		
		return ss.getMapper(NewMapper.class).sleepDelete(sleepVO);
	}
}
