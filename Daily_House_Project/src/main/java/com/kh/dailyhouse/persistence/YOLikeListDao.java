package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.LikeVo;

public interface YOLikeListDao {
	
	public List<LikeVo> getLikeList(String user_email) throws Exception;
}
