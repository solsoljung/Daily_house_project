package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;

public interface YOReservationListService {

	
	public void insertReservation(TestDto testDto) throws Exception;
	
	public List<ReservationVo> getReservationList(String user_email) throws Exception;
	
	public void cancelReservation(int reserv_num) throws Exception;

	//예약 가능한지 확인
	public int availableReserv(TestDto testDto) throws Exception;
	
	//예약 취소 가능한지 확인
	public List<ReservationVo> reservCancleAvailable(String user_email) throws Exception;
}
