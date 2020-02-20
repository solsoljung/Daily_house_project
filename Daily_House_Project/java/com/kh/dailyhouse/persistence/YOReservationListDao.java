package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;

public interface YOReservationListDao {
	
	// 총 결제금액과 room_num에 있는 것들 구하기
	public void getHostInfo() throws Exception;

	// (예약)결제하기
	public void insertReservation(ReservationVo vo) throws Exception;
	
	// 예약결제내역 리스트
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

}
