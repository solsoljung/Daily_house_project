package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.LikeVo;
import com.kh.dailyhouse.domain.RoomVo;

public interface YOLikeListService { 
	
	public List<LikeVo> getLikeList(String user_email) throws Exception;
	
	public void deleteLike(int like_num) throws Exception;
	
}
