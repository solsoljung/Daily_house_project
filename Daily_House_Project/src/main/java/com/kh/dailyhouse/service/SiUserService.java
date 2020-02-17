package com.kh.dailyhouse.service;

import com.kh.dailyhouse.domain.UserVo;

public interface SiUserService {
	// 유저 정보 저장
	public void setUserData(UserVo userVo) throws Exception;
	// 유저 정보 얻기
	public UserVo login_run(UserVo userVo) throws Exception;
	// 유저 정보 수정
	public void userUpdate(UserVo userVo) throws Exception;
	
}
