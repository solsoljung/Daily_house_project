package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.persistence.BooAdminDao;

@Service
public class BooAdminServiceImpl implements BooAdminService {
	
	@Inject
	private BooAdminDao booAdminDao;
	
	//관리자 예약한 사람들 목록 보여주기
	@Override
	public List<ReservationVo> adminReservationList() throws Exception {
		List<ReservationVo> list = booAdminDao.adminReservationList();
		return list;
	}

}
