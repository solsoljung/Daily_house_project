package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomTypeVo;

@Repository
public class CyRoomTypeDaoImpl implements CyRoomTypeDao {

	private static final String NAMESPACE = "com.kh.mappers.RoomTypeMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// RoomType들 조회
	@Override
	public List<RoomTypeVo> getRoomTypeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRoomTypeList");
	}

}
