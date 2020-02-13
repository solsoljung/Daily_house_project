package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomOptionVo;

@Repository
public class CyRoomOptionDaoImple implements CyRoomOptionDao {

	private static final String NAMESPACE = "com.kh.mappers.RoomOptionMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// RoomOption들 조회
	@Override
	public List<RoomOptionVo> getRoomOptionList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRoomOptionList");
	}

}
