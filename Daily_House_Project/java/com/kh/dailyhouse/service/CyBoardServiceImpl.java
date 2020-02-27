package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.BoardVo;
import com.kh.dailyhouse.persistence.CyBoardDao;

@Service
public class CyBoardServiceImpl implements CyBoardService {

	@Inject
	private CyBoardDao boardDao;
	
	// 목록 전체보기
	@Override
	public List<BoardVo> getBoardList() throws Exception {
		return boardDao.getBoardList();
	}

}
