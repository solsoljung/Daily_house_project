package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomPictureVo;
import com.kh.dailyhouse.domain.RoomReviewDto;
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
	
	//roomDetail review 목록 정보 얻기
	@Override
	public List<RoomReviewDto> getReviewinfo(int room_num, ReviewPagingDto reviewPagingDto) throws Exception {	
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("reviewPagingDto", reviewPagingDto);
		
		List<RoomReviewDto> ReviewList = sqlSession.selectList(NAMESPACE+".getRoomDetailReview", paramMap);
		return ReviewList;
	}
	
	//후기 작성
	@Override
	public void setReview(RoomReviewVo roomReviewVo) throws Exception {
		sqlSession.insert(NAMESPACE+".setReview", roomReviewVo);
	}
	
	//방 평점 수정
	@Override
	public void setRoomScore(int room_num, int room_score) throws Exception {
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("room_score", room_score);
		sqlSession.update(NAMESPACE+".updateRoomScore", paramMap);
		
	}
	
	//후기 목록에 사용할 총개수
	@Override
	public int getReviewCount(int room_num) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE+".getReviewCount", room_num);
		return count;
	}

	//room type 코드판별
	@Override
	public String getRoomType(RoomDto roomDto) throws Exception {
		String room_type_explain = sqlSession.selectOne(NAMESPACE+".getRoomType", roomDto);
		return room_type_explain;
	}

	//room option 코드판별
	@Override
	public String getRoomOption(String room_option_code) throws Exception {
		String room_option_explain = "";
		String notNull = sqlSession.selectOne(NAMESPACE+".getRoomOption", room_option_code);
		if (notNull != null) {
			room_option_explain = notNull;
		}
				
		return room_option_explain;
	}
	
	//room_pic 정보 얻기
	@Override
	public List<RoomPictureVo> getRoomPicInfo(int room_num) throws Exception {
		List<RoomPictureVo> roomPicInfo = sqlSession.selectList(NAMESPACE+".getRoomPicInfo", room_num);
		return roomPicInfo;
	}
	
	//1구역 사진 정보 얻기
	@Override
	public RoomPictureVo getOneAreaPic(int room_num) throws Exception {
		RoomPictureVo OneAreaPic = sqlSession.selectOne(NAMESPACE+".getOneAreaPic", room_num);
		return OneAreaPic;
	}
	
	//2구역 사진 정보 얻기
	@Override
	public List<RoomPictureVo> getTwoAreaPic(int room_num) throws Exception {
		List<RoomPictureVo> TwoAreaPic = sqlSession.selectList(NAMESPACE+".getTwoAreaPic", room_num);
		return 	TwoAreaPic;
	}
	
	//3구역 사진 정보 얻기
	@Override
	public List<RoomPictureVo> getThreeAreapic(int room_num) throws Exception {
		List<RoomPictureVo> ThreeAreaPic = sqlSession.selectList(NAMESPACE+".getThreeAreaPic", room_num);
		return ThreeAreaPic;
	}
	
	//포인트 이용 내역 테이블에 추가
	@Override
	public void setPointList(RoomReviewVo roomReviewVo) throws Exception {
		String user_email = roomReviewVo.getUser_email();
		sqlSession.insert(NAMESPACE+".setPointList", user_email);
	}
	
	//리뷰 작성후 유저에게 포인트 주기
	@Override
	public void setUserPoint(RoomReviewVo roomReviewVo) throws Exception {
		String user_email = roomReviewVo.getUser_email();
		sqlSession.update(NAMESPACE+".setUserPoint", user_email);
	}
	
}