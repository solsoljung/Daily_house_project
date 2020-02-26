package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
