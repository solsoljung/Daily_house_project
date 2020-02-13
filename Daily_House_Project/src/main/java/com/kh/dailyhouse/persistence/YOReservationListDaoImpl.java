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
	public List<ReservationVo> getReservationList() throws Exception {
		List<ReservationVo> list = sqlSession.selectList(NAMESPACE + ".getReservationList");
				System.out.println("dao:" + list);
		return list;
		
	}

}
