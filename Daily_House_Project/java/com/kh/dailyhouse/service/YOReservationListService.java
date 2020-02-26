package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.PointVo;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;
import com.kh.dailyhouse.domain.UserPointDto;

public interface YOReservationListService {

	// 결제 전 사용자 포인트 조회
	public int getUserPoint(String user_email) throws Exception;
	
	//, UserPointDto userPointDto, PointVo pointVo
	public void insertReservation(TestDto testDto) throws Exception;
	
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

	//예약 가능한지 확인
	public int availableReserv(TestDto testDto) throws Exception;
	
	//예약, 방 정보 불러오기
	public TestDto getReservRoomData(int reserv_num) throws Exception;
	
	//솔 예약 취소
	public void updateRoomState(ReservationVo reservationVo) throws Exception;

	//체크아웃 승인 페이지 리스트 솔
	public List<TestDto> getAvailableCheckout() throws Exception;
	
	//체크아웃 승인 솔
	public void adminCheckOut(TestDto testDto) throws Exception;
}
