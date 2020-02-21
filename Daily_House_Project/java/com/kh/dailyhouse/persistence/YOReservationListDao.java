package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;

public interface YOReservationListDao {

	// (예약)결제하기
	public void insertReservation(TestDto testDto) throws Exception;
	
	// 예약결제내역 리스트
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

}
