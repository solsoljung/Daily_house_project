package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;

public interface CyRoomDao {
	// 숙소 검색하기
	public List<RoomDetailDto> getHostRoomList(String user_email) throws Exception;
	
	// 숙소 1개 검색
	public RoomDetailDto getHostRoomDetail(int room_num) throws Exception;
	
	// 숙소등록을 위한 다음 시퀸스 값 얻어내기
	public int getNextRoomNum() throws Exception;
	
	// 숙소 등록하기
	public void registerRoom(RoomVo roomVo) throws Exception;
	
	// 숙소 수정하기
	public void updateHostRoom(RoomVo roomVo) throws Exception;
	
	// 숙소 삭제하기
	
	// 첨부파일 추가
	public void attach(String pic_uri, int room_num) throws Exception;
	
	// 첨부파일명 목록 얻기
	public List<String> getAttach(int room_num) throws Exception;
	
	// 첨부파일 데이터 삭제
	public void deleteAttach(String pic_uri) throws Exception;
	
	// 첨부파일 데이터 삭제(by room_num)
	public void deleteAttachByRoomNum(int room_num) throws Exception;
}
