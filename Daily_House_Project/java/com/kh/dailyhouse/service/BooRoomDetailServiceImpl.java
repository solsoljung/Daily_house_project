package com.kh.dailyhouse.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.MessageDto;
import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomPictureVo;
import com.kh.dailyhouse.domain.RoomReviewDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.persistence.BooRoomDetailDao;

@Service
public class BooRoomDetailServiceImpl implements BooRoomDetailService {
	
	@Inject
	private BooRoomDetailDao booRoomDetailDao;
	
	//Room 상세 보기
	@Override
	public Map<String, Object> detail(int room_num, ReviewPagingDto reviewPagingDto) throws Exception {
		//댓글 총 갯수 구하기
		int totalCount = booRoomDetailDao.getReviewCount(room_num);
		reviewPagingDto.setTotalCount(totalCount);
		
		//후기 리스트 받아오기
		List<RoomReviewDto> reviewList = booRoomDetailDao.getReviewinfo(room_num, reviewPagingDto);
		
		if (reviewList.size() != 0 ) {
			//후기 리스트의 total_score를 기반으로 방의 점수 계산
			int room_score_sum = 0;
			for (RoomReviewDto vo : reviewList) {
				room_score_sum += vo.getTotal_score();
			}
			int room_score = room_score_sum/reviewList.size();
			
			//계산을 기반으로 방 스코어 적용 시키기
			booRoomDetailDao.setRoomScore(room_num, room_score);
		}
		
		//방 상세보기 정보 받기
		RoomDto dto = booRoomDetailDao.getRoominfo(room_num);
		
		//방 사진 정보 얻기
		List<RoomPictureVo> roomPicInfo = booRoomDetailDao.getRoomPicInfo(room_num);
		//1구역 사진 정보 얻기
		RoomPictureVo OneAreaPic = booRoomDetailDao.getOneAreaPic(room_num);
		//2구역 사진 정보 얻기
		List<RoomPictureVo> TwoAreaPic = booRoomDetailDao.getTwoAreaPic(room_num);
		//3구역 사진 정보 얻기
		List<RoomPictureVo> ThreeAreaPic = booRoomDetailDao.getThreeAreapic(room_num);
		
		//체크 아웃 한사람만 후기 쓸수 있게 하기
		List<String> checkOutUserList = booRoomDetailDao.checkOutSearch(room_num);
		
		//방 옵션 코드 받기
		String optionCode = "";
		if (dto.getRoom_option_code() != null) {
			optionCode = dto.getRoom_option_code();
		}
		
		//room type 코드판별
		String type = booRoomDetailDao.getRoomType(dto);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("dto", dto);
		paramMap.put("roomPicInfo", roomPicInfo);
		paramMap.put("OneAreaPic", OneAreaPic);
		paramMap.put("TwoAreaPic", TwoAreaPic);
		paramMap.put("ThreeAreaPic", ThreeAreaPic);
		paramMap.put("ReviewList", reviewList);
		paramMap.put("type", type);
		paramMap.put("checkOutUserList", checkOutUserList);
		
		if (!(optionCode.equals("")) || optionCode != null) {
			StringTokenizer tokenizer = new StringTokenizer(optionCode,",");
			
			List<String> OptionList = new ArrayList<>();
			List<String> OptionCode = new ArrayList<>();
			
			while(tokenizer.hasMoreElements()) {
				String token = tokenizer.nextToken();
				String Option = booRoomDetailDao.getRoomOption(token);
				OptionList.add(Option);
				OptionCode.add(token);
			}
			paramMap.put("OptionList", OptionList);
			paramMap.put("OptionCode", OptionCode);
		}
		
		return paramMap;
	}
	
	//후기 작성 Insert
	@Override
	public void insertReview(RoomReviewVo roomReviewVo) throws Exception {
		booRoomDetailDao.setReview(roomReviewVo);
		booRoomDetailDao.setPointList(roomReviewVo);
		booRoomDetailDao.setUserPoint(roomReviewVo);
	}
	
	//쪽지 받는 사람 정보
	@Override
	public UserVo getReceiverInfo(String user_email) throws Exception {
		UserVo userVo = booRoomDetailDao.getReceiverInfo(user_email);
		return userVo;
	}
	
	//쪽지 보내기
	@Override
	public void sendMessagePro(MessageDto messageDto) throws Exception {
		booRoomDetailDao.sendMessagePro(messageDto);
	}
	
}
