package com.park.mall.dao;

import com.park.mall.model.SleepVO;

public interface NewMapper {
	
	public abstract int insertSleep(SleepVO sleepVO);
	
	public abstract SleepVO selectSleep(SleepVO sleepVO);

	public abstract int sleepDelete(SleepVO sleepVO);
}
