package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.PointVo;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;
import com.kh.dailyhouse.domain.UserPointDto;

public interface YOReservationListDao {
	
	// 결제시 사용자 포인트 차감 솔
	public void user_update_reserv_point(TestDto testDto) throws Exception;
	
	// 결제시 호스트에게 포인트 부여
	public void host_update_reserv_point(UserPointDto userPointDto) throws Exception;
	
	// 포인트 테이블 insert 솔
	public void insertPoint(TestDto testDto) throws Exception;
	
	// 결제 전 사용자 포인트 보기
	public int getUserPoint(String user_email) throws Exception;

	// (예약)결제하기 솔
	public void insertReservation(TestDto testDto) throws Exception;
	
	// 예약결제내역 리스트
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

	//예약 가능한지 확인
	public int availableReserv(TestDto testDto) throws Exception;
	
	//예약, 방 정보 불러오기
	public TestDto getReservRoomData(int reserv_num) throws Exception;
	
	//예약상태 N으로 바꾸기
	public void updateRoomState(ReservationVo reservationVo) throws Exception;
}
