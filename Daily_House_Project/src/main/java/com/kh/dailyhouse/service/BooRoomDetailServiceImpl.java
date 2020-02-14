package com.kh.dailyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.persistence.BooRoomDetailDao;

@Service
public class BooRoomDetailServiceImpl implements BooRoomDetailService {
	
	@Inject
	private BooRoomDetailDao booRoomDetailDao;
	
	//Room 상세 보기
	@Override
	public Map<String, Object> detail(int room_num, ReviewPagingDto reviewPagingDto) throws Exception {
		//후기 리스트 받아오기
		List<RoomReviewVo> reviewList = booRoomDetailDao.getReviewinfo(room_num, reviewPagingDto);
		System.out.println("ReviewList : " + reviewList);
		
		if (reviewList.size() != 0 ) {
			//후기 리스트의 total_score를 기반으로 방의 점수 계산
			int room_score_sum = 0;
			for (RoomReviewVo vo : reviewList) {
				room_score_sum += vo.getTotal_score();
			}
			int room_score = room_score_sum/reviewList.size();
			
			//계산을 기반으로 방 스코어 적용 시키기
			booRoomDetailDao.setRoomScore(room_num, room_score);
		}
		
		//방 상세보기 정보 받기
		RoomDto dto = booRoomDetailDao.getRoominfo(room_num);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("dto", dto);
		paramMap.put("ReviewList", reviewList);
		
		return paramMap;
	}
	
	//후기 작성 Insert
	@Override
	public void insertReview(RoomReviewVo roomReviewVo) throws Exception {
		booRoomDetailDao.setReview(roomReviewVo);
	}
	
	//후기 목록에 사용할 총 갯수
	@Override
	public int reviewCount() throws Exception {
		return booRoomDetailDao.getReviewCount();
	}

}
