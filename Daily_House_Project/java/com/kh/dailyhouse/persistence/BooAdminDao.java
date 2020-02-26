package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.AdminReservResultDto;
import com.kh.dailyhouse.domain.ReservationVo;

public interface BooAdminDao {
	//관리자 예약한 사람들 목록 보여주기
	public List<ReservationVo> adminReservationList() throws Exception;
	//R로 바꿔주기
	public void updateReservState(int reserv_num) throws Exception;
	//마일리지 회수, 결제 취소
	public void updateUserPoint(String user_email, int point) throws Exception;
	//포인트 이용 내역에 작성 (마일리지 회수부분)
	public void setPointListMile(AdminReservResultDto adminReservResultDto) throws Exception;
	//포인트 이용 내역에 작성 (결제 취소 부분)
	public void setPointListPoint(AdminReservResultDto adminReservResultDto) throws Exception;
}
