package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReservationVo;

public interface YOReservationListDao {
	
	public List<ReservationVo> getReservationList(String user_email) throws Exception;

}
