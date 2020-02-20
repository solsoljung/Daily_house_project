package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;

public interface YOReservationListDao {
	
	// 총 결제금액 구하기
	public void getPrice() throws Exception;

	// (예약)결제하기
	public void insertReservation(ReservationVo vo) throws Exception;
	
	// 예약결제내역 리스트
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

}
