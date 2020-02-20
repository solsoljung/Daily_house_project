package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.ReservationVo;

@Repository
public class YOReservationListDaoImpl implements YOReservationListDao {
	
	private static final String NAMESPACE = "com.kh.mappers.ReservationMapper";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public List<ReservationVo> getReservationList(String user_email) throws Exception {
		List<ReservationVo> list = sqlSession.selectList(NAMESPACE + ".getReservationList", user_email);
				System.out.println("dao:" + list);
		return list;
		
	}

	@Override
	public void insertReservation(ReservationVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertReservation", vo);
	}

	@Override
	public void getHostInfo() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
