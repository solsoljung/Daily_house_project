package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;

public interface BooAdminService {
	//관리자 예약한 사람들 목록 보여주기
	public List<ReservationVo> adminReservationList() throws Exception;
}
