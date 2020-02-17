package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.LikeVo;

public interface YOLikeListService {
	
	public List<LikeVo> getLikeList(String user_email) throws Exception;

}
