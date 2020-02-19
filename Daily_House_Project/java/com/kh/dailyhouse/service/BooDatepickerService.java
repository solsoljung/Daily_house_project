package com.kh.dailyhouse.service;

import java.util.List;

public interface BooDatepickerService {
	
	public String getEndDate(int room_num, String date) throws Exception;
	
	public List<String> getCheckInIndex(int room_num) throws Exception;
}
