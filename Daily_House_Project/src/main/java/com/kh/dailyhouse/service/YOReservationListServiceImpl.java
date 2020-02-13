package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.persistence.YOReservationListDao;

@Service
public class YOReservationListServiceImpl implements YOReservationListService {
	
	@Inject
	private YOReservationListDao dao;

	@Override
	public List<ReservationVo> getReservationList() throws Exception {
		List<ReservationVo> list = dao.getReservationList();
		System.out.println("service:" + list);
		return list;
	}

}
