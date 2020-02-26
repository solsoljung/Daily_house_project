package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.AdminReservResultDto;
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
	
	//R로 바꿔주기
	@Override
	public void updateReservState(AdminReservResultDto adminReservResultDto) throws Exception {
		int reserv_num = adminReservResultDto.getReserv_num();
		
		booAdminDao.updateReservState(reserv_num);
	}
	
	//마일리지 회수, 결제 취소
	@Override
	public void updateUserPoint(AdminReservResultDto adminReservResultDto) throws Exception {
		String user_email = adminReservResultDto.getUser_email();
		int price = adminReservResultDto.getReserv_price();
		int mile = adminReservResultDto.getReserv_mile();
		
		int point = price - mile;
		
		booAdminDao.updateUserPoint(user_email, point);
	}
	
	//포인트 이용 내역 작성
	@Override
	public void setPointList(AdminReservResultDto adminReservResultDto) throws Exception {
		booAdminDao.setPointListMile(adminReservResultDto);
		booAdminDao.setPointListPoint(adminReservResultDto);
	}

}
