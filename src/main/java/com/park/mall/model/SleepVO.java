package com.park.mall.model;

public class SleepVO {
	
	long sleep;
	String userId;
	
	public long getSleep() {
		return sleep;
	}


	public void setSleep(long sleep) {
		this.sleep = sleep;
	}

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "SleepVO [sleep=" + sleep + ", userId=" + userId + "]";
	}
	
	
	

}
