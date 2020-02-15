package com.kh.dailyhouse.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomVo;

@Repository
public class CyRoomDaoImpl implements CyRoomDao {

	private static final String NAMESPACE = "com.kh.mappers.RoomMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// 숙소 등록을 위한 다음 시퀸스 값 알아내기
	@Override
	public int getNextRoomNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNextRoomNum");
	}
	
	// 숙소 등록
	@Override
	public void registerRoom(RoomVo roomVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".registerRoom", roomVo);
	}

}
