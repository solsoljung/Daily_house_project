package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.AdminReservResultDto;
import com.kh.dailyhouse.domain.ReservationVo;

@Repository
public class BooAdminDaoImpl implements BooAdminDao {
	
	private static final String NAMESPACE = "com.kh.mappers.BooAdminMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	//관리자 예약한 사람들 목록 보여주기
	@Override
	public List<ReservationVo> adminReservationList() throws Exception {
		List<ReservationVo> list = sqlSession.selectList(NAMESPACE+".getAdminReservationList");
		return list;
	}
	
	//R로 바꿔주기
	@Override
	public void updateReservState(int reserv_num) throws Exception {
		sqlSession.update(NAMESPACE+".updateReservState", reserv_num);
	}
	
	//마일리지 회수, 결제 취소
	@Override
	public void updateUserPoint(String user_email, int point) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_email", user_email);
		paramMap.put("point", point);
		sqlSession.update(NAMESPACE+".updateUserPoint", paramMap);
	}
	
	//포인트 이용 내역에 작성 (마일리지 회수부분)
	@Override
	public void setPointListMile(AdminReservResultDto adminReservResultDto) throws Exception {
		sqlSession.insert(NAMESPACE+".setPointListMile", adminReservResultDto);
	}
	
	//포인트 이용 내역에 작성 (결제 취소 부분)
	@Override
	public void setPointListPoint(AdminReservResultDto adminReservResultDto) throws Exception {
		sqlSession.insert(NAMESPACE+".setPointListPoint", adminReservResultDto);
	}

}
