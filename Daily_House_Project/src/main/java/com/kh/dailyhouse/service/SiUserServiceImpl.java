package com.kh.dailyhouse.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.persistence.SiUserDaoImpl;

@Service
public class SiUserServiceImpl implements SiUserService {

	@Inject
	private SiUserDaoImpl siUserDao;
	
	@Override
	public void setUserData(UserVo userVo) throws Exception {
		siUserDao.setUserData(userVo);
	}

	@Override
	public UserVo login_run(UserVo userVo) throws Exception {
		return siUserDao.login_run(userVo);
	}

	@Override
	public void userUpdate(UserVo userVo) throws Exception {
		System.out.println("서비스!!!!!!"+userVo);
		siUserDao.userUpdate(userVo);
	}


}
