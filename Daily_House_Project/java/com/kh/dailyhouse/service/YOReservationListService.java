package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;

public interface YOReservationListService {

	
	public void insertReservation(TestDto testDto) throws Exception;
	
	public List<ReservationVo> getReservationList(String user_email) throws Exception;
	
	public void cancelReservation(int reserv_num) throws Exception;

}
