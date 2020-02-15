package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;

@Repository
public class SolRoomDaoImpl implements SolRoomDao {
	
	private static final String NAMESPACE = "com.kh.mappers.RoomMapper";
	
	@Inject
	public SqlSession sqlSession;

	/*
	 * @Override public List<RoomVo> getRoomList(PagingDto pagingDto, ReservationVo
	 * reservVo) throws Exception { Map<String, Object> map = new HashMap<String,
	 * Object>(); map.put("pagingDto", pagingDto); map.put("reservVo", reservVo);
	 * 
	 * return sqlSession.selectList(NAMESPACE + ".getRoomList", map); }
	 */
	
	@Override
	public List<RoomVo> getRoomList(SearchVo vo) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getRoomList", vo);
	}

	@Override
	public int getRoomCount(PagingDto pagingDto) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".getRoomCount", pagingDto);
	}

}
