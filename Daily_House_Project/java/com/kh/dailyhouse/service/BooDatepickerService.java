package com.kh.dailyhouse.service;

import java.util.List;

public interface BooDatepickerService {
	
	public String getEndDate(int room_num, String date) throws Exception;
	
	public List<String> getCheckInIndex(int room_num) throws Exception;
	
	public String getRoomStatus(int room_num) throws Exception;
	
	public String getCount(int room_num, String user_email) throws Exception;
	
	public void insertLike (int room_num, String user_email) throws Exception;
	
	public void deleteLike (int room_num, String user_email) throws Exception;
}
