package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;

@Repository
public class CyRoomDaoImpl implements CyRoomDao {

	private static final String NAMESPACE = "com.kh.mappers.RoomMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// 호스트가 등록한 숙소 리스트 불러오기
	@Override
	public List<RoomDetailDto> getHostRoomList(String user_email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getHostRoomList", user_email);
	}
	
	// 호스트가 등록한 숙소 1개 상세보기
	@Override
	public RoomDetailDto getHostRoomDetail(int room_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getHostRoomDetail", room_num);
	}
	
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

	// 숙소 수정
	@Override
	public void updateHostRoom(RoomVo roomVo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateHostRoom", roomVo);
	}


	

}
