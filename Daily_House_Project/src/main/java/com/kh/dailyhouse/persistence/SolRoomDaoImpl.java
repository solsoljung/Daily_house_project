package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.RoomVo;

@Repository
public class SolRoomDaoImpl implements SolRoomDao {
	
	private static final String NAMESPACE = "com.kh.mappers.RoomMapper";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public List<RoomVo> getRoomList(PagingDto pagingDto) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getRoomList", pagingDto);
	}

	@Override
	public int getRoomCount(PagingDto pagingDto) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".getRoomCount", pagingDto);
	}

}
