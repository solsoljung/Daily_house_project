package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

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

	@Override
	public List<RoomReviewVo> getReviewinfo(int room_num) throws Exception {
		List<RoomReviewVo> ReviewList = sqlSession.selectList(NAMESPACE+".getRoomDetailReview", room_num);
		return ReviewList;
	}

	@Override
	public RoomReviewVo getReviewScore(int room_num) throws Exception {
		RoomReviewVo roomReviewVo = sqlSession.selectOne(NAMESPACE+".getOneReview", room_num);
		return roomReviewVo;
	}

}
