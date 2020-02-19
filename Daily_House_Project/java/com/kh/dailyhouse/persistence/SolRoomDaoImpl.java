package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomLowHighPriceDto;
import com.kh.dailyhouse.domain.RoomOptionVo;
import com.kh.dailyhouse.domain.RoomTypeVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;

@Repository
public class SolRoomDaoImpl implements SolRoomDao {
	
	private static final String NAMESPACE = "com.kh.mappers.RoomMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	@Override
	public List<RoomVo> getRoomList(SearchVo searchVo) throws Exception {
		System.out.println("SolRoomDaoImpl, searchVo:" + searchVo);
		return sqlSession.selectList(NAMESPACE + ".getRoomList", searchVo);
	}

	@Override
	public int getRoomCount(SearchVo searchVo) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".getRoomCount", searchVo);
	}

	@Override
	public List<RoomTypeVo> getRoomType() throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getRoomType");
	}

	@Override
	public List<RoomOptionVo> getRoomOption() throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getRoomOption");
	}

	@Override
	public RoomLowHighPriceDto getRoomPrice() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".getRoomPrice");
	}

}
