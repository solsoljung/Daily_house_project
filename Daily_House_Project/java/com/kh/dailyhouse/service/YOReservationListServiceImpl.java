package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;
import com.kh.dailyhouse.persistence.YOReservationListDao;

@Service
public class YOReservationListServiceImpl implements YOReservationListService {
	
	@Inject
	private YOReservationListDao dao;

	@Override
	public List<ReservationVo> getReservationList(String user_email) throws Exception {
		List<ReservationVo> list = dao.getReservationList(user_email);
		System.out.println("service:" + list);
		return list;
	}

	@Override
	public void insertReservation(TestDto testDto) throws Exception {
		dao.insertReservation(testDto);
	}

	@Override
	public void cancelReservation(int reserv_num) throws Exception {
		dao.cancelReservation(reserv_num);
	}

	@Override
	public int availableReserv(TestDto testDto) throws Exception {
		return dao.availableReserv(testDto);
	}

	@Override
	public List<ReservationVo> reservCancleAvailable(String user_email) throws Exception {
		return dao.reservCancleAvailable(user_email);
	}

	@Override
	public int getUserPoint(String user_email) throws Exception {
		return dao.getUserPoint(user_email);
	}



}
