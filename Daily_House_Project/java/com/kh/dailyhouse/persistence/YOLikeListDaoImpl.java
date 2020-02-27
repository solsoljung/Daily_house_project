package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.LikeVo;
import com.kh.dailyhouse.domain.RoomVo;

@Repository
public class YOLikeListDaoImpl implements YOLikeListDao {
	
	private static final String NAMESPACE = "com.kh.mappers.LikeMapper";
	
	private static final String NAMESPACE2 = "com.kh.mappers.RoomMapper";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public List<LikeVo> getLikeList(String user_email) throws Exception {
		List<LikeVo> list = sqlSession.selectList(NAMESPACE + ".getLikeList", user_email);
		return list;
	}

	@Override
	public void deleteLike(int like_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteLike", like_num);	
	}

}
