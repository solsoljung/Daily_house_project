package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomReviewVo;
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
		siUserDao.userUpdate(userVo);
	}

	@Override
	public String foundPassword(String user_email) throws Exception {
		return siUserDao.foundPassword(user_email);
	}

	@Override
	public void updatePassword(UserVo userVo) throws Exception {
		siUserDao.updatePassword(userVo);
	}

	@Override
	public List<RoomReviewVo> getHomeReview() throws Exception {
		List<RoomReviewVo> list = siUserDao.getHomeReview();
		return list;
	}

}
