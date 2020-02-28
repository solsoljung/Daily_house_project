package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.HomeHomesDto;
import com.kh.dailyhouse.domain.HomeReviewDto;
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
	public List<HomeReviewDto> getHomeReview() throws Exception {
		List<HomeReviewDto> listReview = siUserDao.getHomeReview();
		return listReview;
	}

	@Override
	public List<HomeHomesDto> getHomeHomes() throws Exception {
		List<HomeHomesDto> listHome = siUserDao.getHomeHomes();
		return listHome;
	}
	@Override
	public List<HomeHomesDto> getMoreHomeHomes(int moreNum1,int moreNum2) throws Exception {
		List<HomeHomesDto> listHome = siUserDao.getMoreHomeHomes(moreNum1, moreNum2);
		return listHome;
	}
	//포인트 이용 내역 테이블에 저장
	@Override
	public void setPointList(UserVo userVo) throws Exception {
		siUserDao.setPointList(userVo);
	}

	@Override
	public UserVo getUserData(String user_email) throws Exception {
		return siUserDao.getUserData(user_email);
	}

}
