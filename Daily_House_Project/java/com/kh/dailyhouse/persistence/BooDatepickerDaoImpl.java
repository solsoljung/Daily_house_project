package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BooDatepickerDaoImpl implements BooDatepickerDao {
	
	private static final String NAMESPACE = "com.kh.mappers.BooDatepickerMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	//endDate값 얻기
	@Override
	public String getEndDate(int room_num, String date) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("date", date);
		
		String endDate = sqlSession.selectOne(NAMESPACE+".getEndDate", paramMap);
		return endDate;
	}
	
	//방번호에 해당하는 reserv_num들을 받는다
	@Override
	public List<Integer> getReservNumList(int room_num) throws Exception {
		List<Integer> reservNumList = sqlSession.selectList(NAMESPACE+".getReservNumList", room_num);
		return reservNumList;
	}
	
	//reserv_num의 일수 차이를 구한다(반복문 이용에 사용함)
	@Override
	public int getReservIndexNum(int reserv_num) throws Exception {
		int IndexNum = sqlSession.selectOne(NAMESPACE+".getReservIndexNum", reserv_num);
		return IndexNum;
	}
	
	//reserv_num에 해당하는 일를 얻는다
	@Override
	public String getCheckInIndex(int num, int reserv_num) throws Exception {
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("reserv_num", reserv_num);
		
		String CheckInIndex = sqlSession.selectOne(NAMESPACE+".getCheckInIndex", paramMap);
		return CheckInIndex;
	}
	
	//공개, 비공개 확인용
	@Override
	public String getRoomStatus(int room_num) throws Exception {
		String status = sqlSession.selectOne(NAMESPACE+".getRoomStatus", room_num);
		return status;
	}
	
	//찜목록에 있는지 판별 (getLikeNum)
	@Override
	public int getCount(int room_num, String user_email) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("user_email", user_email);
		
		int count = sqlSession.selectOne(NAMESPACE+".getLikeNum", paramMap);
		return count;
	}
	
	//찜목록에 추가하기
	@Override
	public void insertLike(int room_num, String user_email) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("user_email", user_email);
		
		sqlSession.insert(NAMESPACE+".insertLike", paramMap);
	}
	
	//찜목록에서 제거하기
	@Override
	public void deleteLike(int room_num, String user_email) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("user_email", user_email);
		
		sqlSession.delete(NAMESPACE+".deleteLike", paramMap);
	}

}
