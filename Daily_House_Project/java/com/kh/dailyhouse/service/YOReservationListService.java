package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;

public interface YOReservationListService {
	
	public void insertReservation(ReservationVo vo) throws Exception;
	
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

}
