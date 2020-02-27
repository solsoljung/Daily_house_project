package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.LikeVo;
import com.kh.dailyhouse.domain.RoomVo;

public interface YOLikeListDao {
	
	public List<LikeVo> getLikeList(String user_email) throws Exception;
	
	public void deleteLike(int like_num) throws Exception;
}
