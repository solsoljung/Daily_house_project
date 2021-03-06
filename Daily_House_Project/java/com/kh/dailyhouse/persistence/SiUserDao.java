package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.HomeHomesDto;
import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.domain.UserVo;

public interface SiUserDao {
	// 유저 정보 저장
	public void setUserData(UserVo userVo) throws Exception;
	// 유저 정보 얻기
	public UserVo login_run(UserVo userVo) throws Exception;
	// 유저 정보 수정
	public void userUpdate(UserVo userVo) throws Exception;
	// 유저 정보 전부 얻기
	public UserVo getUserData(String user_email) throws Exception;
	// 유저 비밀번호 찾기
	public String foundPassword(String user_email) throws Exception;
	// 유저 비밀번호 수정
	public void updatePassword(UserVo userVo) throws Exception;
	// 홈에 넣을 리뷰 얻어오기
	public List<HomeReviewDto> getHomeReview() throws Exception;
	// 홈에 넣을 집들 얻어오기
	public List<HomeHomesDto> getHomeHomes() throws Exception;
	// 홈에 넣을 집들 얻어오기
	public List<HomeHomesDto> getMoreHomeHomes(int moreNum1, int moreNum2) throws Exception;
	// 포인트 이용 내역 테이블에 저장
	public void setPointList(UserVo userVo) throws Exception;
}
