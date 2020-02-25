package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dailyhouse.domain.PointVo;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;
import com.kh.dailyhouse.domain.UserPointDto;
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

	// 예약 결제하기
	// 결제시 사용자 포인트 차감, 포인트 테이블에 해당 사용자의 사용내역 기록(R1)
	// 결제한 회원에게 결제한 금액의 0.05프로를 포인트로 부여, 포인트 테이블에 적립내역 기록(R5)
	// 호스트에게 포인트 부여, 포인트 테이블에 호스트 포인트 적립내역 기록(R7)
	@Transactional
	@Override
	public void insertReservation(TestDto testDto, UserPointDto userPointDto, PointVo pointVo) throws Exception {
		// 결제시 사용자 포인트 차감, 포인트 테이블에 해당 사용자의 사용내역 기록(R1)
		dao.user_update_reserv_point(userPointDto);
		dao.insertPoint(pointVo);
		
		// 결제한 회원에게 결제한 금액의 0.05프로를 포인트로 부여, 포인트 테이블에 적립내역 기록(R5)
		dao.user_update_reserv_point(userPointDto);
		dao.insertPoint(pointVo);
		
		// 호스트에게 포인트 부여, 포인트 테이블에 호스트 포인트 적립내역 기록(R7)
		dao.host_update_reserv_point(userPointDto);
		dao.insertPoint(pointVo);
		
		// 예약 결제
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
	public int getUserPoint(String user_email) throws Exception {
		return dao.getUserPoint(user_email);
	}

	@Override
	public TestDto getReservRoomData(int reserv_num) throws Exception {
		return dao.getReservRoomData(reserv_num);
	}

	



}
