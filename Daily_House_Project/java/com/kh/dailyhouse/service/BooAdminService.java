package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.AdminReservResultDto;
import com.kh.dailyhouse.domain.ReservationVo;

public interface BooAdminService {
	//관리자 예약한 사람들 목록 보여주기
	public List<ReservationVo> adminReservationList() throws Exception;
	//R로 바꿔주기
	public void updateReservState(AdminReservResultDto adminReservResultDto) throws Exception;
	//마일리지 회수, 결제 취소
	public void updateUserPoint(AdminReservResultDto adminReservResultDto) throws Exception;
	//포인트 이용 내역 작성
	public void setPointList(AdminReservResultDto adminReservResultDto) throws Exception;
}
