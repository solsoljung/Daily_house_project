package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.PointVo;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.TestDto;
import com.kh.dailyhouse.domain.UserPointDto;

@Repository
public  class YOReservationListDaoImpl implements YOReservationListDao {
	
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
	public void insertReservation(TestDto testDto) throws Exception {
		testDto.setRoom_price_v(testDto.getRoom_price() * testDto.getV());
		sqlSession.insert(NAMESPACE + ".insertReservation", testDto);
	}

	@Override
	public void cancelReservation(int reserv_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".cancelReservation", reserv_num);
		
	}

	@Override
	public int availableReserv(TestDto testDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".availableReserv", testDto);
		
	}

	@Override
	public List<ReservationVo> reservCancleAvailable(String user_email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".reservCancleAvailable", user_email);
	}

	@Override
	public int getUserPoint(String user_email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getUserPoint", user_email);
	}

	@Override
	public void user_update_reserv_point(UserPointDto userPointDto) throws Exception {
		sqlSession.update(NAMESPACE + ".user_update_reserv_point", userPointDto);
	}

	@Override
	public void host_update_reserv_point(UserPointDto userPointDto) throws Exception {
		sqlSession.update(NAMESPACE + ".host_update_reserv_point", userPointDto);
	}

	@Override
	public void insertPoint(PointVo pointVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertPoint", pointVo);
	}


}
