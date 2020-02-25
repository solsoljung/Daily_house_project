package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.domain.UserVo;

public interface SiUserService {
	// 유저 정보 저장
	public void setUserData(UserVo userVo) throws Exception;
	// 유저 정보 얻기
	public UserVo login_run(UserVo userVo) throws Exception;
	// 유저 정보 수정
	public void userUpdate(UserVo userVo) throws Exception;
	// 유저 비밀번호 찾기
	public String foundPassword(String user_email) throws Exception;
	// 유저 비밀번호 수정
	public void updatePassword(UserVo userVo) throws Exception;
	
	public List<HomeReviewDto> getHomeReview() throws Exception;
	// 포인트 이용 내역 테이블에 저장
	public void setPointList(UserVo userVo) throws Exception;
}
