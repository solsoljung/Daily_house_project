package com.kh.dailyhouse.persistence;

import com.kh.dailyhouse.domain.UserVo;

public interface SiUserDao {
	// 유저 정보 저장
	public void setUserData(UserVo userVo) throws Exception;
	// 유저 정보 얻기
	public UserVo login_run(UserVo userVo) throws Exception;
	
}
