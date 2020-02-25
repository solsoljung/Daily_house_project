package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;

public interface YOReservationListDao {
	
	// 결제 전 사용자 포인트 보기
	public int getUserPoint(String user_email) throws Exception;

	// (예약)결제하기
	public void insertReservation(TestDto testDto) throws Exception;
	
	// 예약결제내역 리스트
	public List<ReservationVo> getReservationList(String user_email) throws Exception;
	
	// 예약 취소
	public void cancelReservation(int reserv_num) throws Exception;

	//예약 가능한지 확인
	public int availableReserv(TestDto testDto) throws Exception;
	
	//예약 취소 가능한지 확인
	public List<ReservationVo> reservCancleAvailable(String user_email) throws Exception;
}
