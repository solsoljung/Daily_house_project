package com.kh.dailyhouse.service;

public interface BooDatepickerService {
	
	public String getEndDate(int room_num, String date) throws Exception;
	
	public void getCheckInIndex(int room_num) throws Exception;
}
