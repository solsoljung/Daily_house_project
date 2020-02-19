package com.kh.dailyhouse.persistence;

public interface BooDatepickerDao {
	//endDate값 얻기
	public String getEndDate(int room_num, String date) throws Exception;
}
