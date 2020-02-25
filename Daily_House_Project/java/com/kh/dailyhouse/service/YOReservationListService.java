package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;

public interface YOReservationListService {

	// 결제 전 사용자 포인트 조회
	public int getUserPoint(String user_email) throws Exception;
	
	
	public void insertReservation(TestDto testDto) throws Exception;
	
	public List<ReservationVo> getReservationList(String user_email) throws Exception;
	
	public void cancelReservation(int reserv_num) throws Exception;

	//예약 가능한지 확인
	public int availableReserv(TestDto testDto) throws Exception;
}
