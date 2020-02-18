package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.LikeVo;
import com.kh.dailyhouse.persistence.YOLikeListDao;

@Service
public class YOLikeListServiceImpl implements YOLikeListService {
	
	@Inject
	private YOLikeListDao dao;

	@Override
	public List<LikeVo> getLikeList(String user_email) throws Exception {
		List<LikeVo> list = dao.getLikeList(user_email);
		return list;
	}

}
