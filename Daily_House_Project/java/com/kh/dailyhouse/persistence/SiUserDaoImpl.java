package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.HomeHomesDto;
import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.domain.UserVo;

@Repository
public class SiUserDaoImpl implements SiUserDao {

	private static final String NAMESPACE = "com.kh.mappers.UserMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// 유저 정보 저장
	@Override
	public void setUserData(UserVo userVo) throws Exception {
		sqlSession.insert(NAMESPACE+".setUserData", userVo);
	}

	@Override
	public UserVo login_run(UserVo userVo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".login_run", userVo);
	}

	@Override
	public void userUpdate(UserVo userVo) throws Exception {
		sqlSession.update(NAMESPACE+".userUpdate", userVo);
	}

	@Override
	public String foundPassword(String user_email) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".foundPassword", user_email);
	}

	@Override
	public void updatePassword(UserVo userVo) throws Exception {
		sqlSession.update(NAMESPACE+".updatePassword", userVo);
	}

	@Override
	public List<HomeReviewDto> getHomeReview() throws Exception {
		List<HomeReviewDto> ReviewList = sqlSession.selectList(NAMESPACE+".getHomeReview");
		return ReviewList;
	}

	@Override
	public List<HomeHomesDto> getHomeHomes() throws Exception {
		List<HomeHomesDto> HomeList = sqlSession.selectList(NAMESPACE+".getHomeHomes");
		return HomeList;
	}
	
	@Override
	public List<HomeHomesDto> getMoreHomeHomes(int moreNum1, int moreNum2) throws Exception {
		Map<String, Object> moreNum = new HashMap<>();
		moreNum.put("moreNum1", moreNum1);
		moreNum.put("moreNum2", moreNum2);
		List<HomeHomesDto> HomeList = sqlSession.selectList(NAMESPACE+".getMoreHomeHomes", moreNum);
		return HomeList;
	}
	
	@Override
	public void setPointList(UserVo userVo) throws Exception {
		String user_email = userVo.getUser_email();
		sqlSession.insert(NAMESPACE+".setPointList", user_email);
		
	}
}
