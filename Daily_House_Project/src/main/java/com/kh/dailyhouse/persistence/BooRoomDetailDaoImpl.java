package com.kh.dailyhouse.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomDto;

@Repository
public class BooRoomDetailDaoImpl implements BooRoomDetailDao {
	
	private static final String NAMESPACE = "com.kh.mappers.RoomDetailMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	//roomDetail 정보 얻기
	@Override
	public RoomDto getRoominfo(int room_num) throws Exception {
		RoomDto dto = sqlSession.selectOne(NAMESPACE+".getRoomDetail", room_num);
		return dto;
	}

}
