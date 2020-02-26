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
	public int availableReserv(TestDto testDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".availableReserv", testDto);
		
	}

	@Override
	public int getUserPoint(String user_email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getUserPoint", user_email);
	}

	@Override
	public void user_update_reserv_point(TestDto testDto) throws Exception {
		sqlSession.update(NAMESPACE + ".user_update_reserv_point", testDto);
	}

	@Override
	public void host_update_reserv_point(TestDto testDto) throws Exception {
		sqlSession.update(NAMESPACE + ".host_update_reserv_point", testDto);
	}

	@Override
	public void insertPointUser(TestDto testDto) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertPointUser", testDto);
	}

	@Override
	public TestDto getReservRoomData(int reserv_num) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getReservData", reserv_num);
	}

	@Override
	public void updateRoomState(ReservationVo reservationVo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateRoomState", reservationVo);
	}

	@Override
	public List<TestDto> getAvailableCheckout() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getAvailableCheckout");
	}

	@Override
	public void insertPointHost(TestDto testDto) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertPointHost", testDto);
		
	}

	@Override
	public void updateReservIng(TestDto testDto) throws Exception {
		sqlSession.update(NAMESPACE + ".updateReservIng", testDto);
		
	}


}
