package com.kh.dailyhouse.persistence;

import java.util.List;

public interface BooDatepickerDao {
	//endDate값 얻기
	public String getEndDate(int room_num, String date) throws Exception;
	
	//방번호에 해당하는 reserv_num들을 받는다
	public List<Integer> getReservNumList(int room_num) throws Exception;
	
	//reserv_num의 일수 차이를 구한다(반복문 이용에 사용함)
	public int getReservIndexNum(int reserv_num) throws Exception;
	
	//reserv_num에 해당하는 일를 얻는다
	public String getCheckInIndex(int num, int reserv_num) throws Exception;
}
