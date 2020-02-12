package com.kh.dailyhouse.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BooRoomDetailDaoImpl implements BooRoomDetailDao {
	
	private static final String NAMESPACE = "com.kh.mappers.RoomDetailMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	//유저 정보 얻기
	@Override
	public void getUserinfo() throws Exception {
		
	}
	//방 정보 얻기
	@Override
	public void getRoominfo() throws Exception {
		
	}

}
