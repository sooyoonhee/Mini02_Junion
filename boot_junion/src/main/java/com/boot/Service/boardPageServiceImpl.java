package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DAO.boardPageDAO;
import com.boot.DTO.Criteria;
import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("boardPageService")
public class boardPageServiceImpl implements boardPageService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<boardBoardDTO> boardListWithPaging(Criteria cri) {  // boardPage.xml에서 구현
		log.info("@# 페이지서비스임플 listWithPaging");
		log.info("@# cri=>"+cri);
		
		boardPageDAO dao = sqlSession.getMapper(boardPageDAO.class);
		ArrayList<boardBoardDTO> list=dao.boardListWithPaging(cri);
		
		return list;
	}

	@Override
//	public int getTotalCount() {
	public int boardGetTotalCount(Criteria cri) {
		log.info("@# 페이지서비스임플 getTotalCount");
		
		boardPageDAO dao = sqlSession.getMapper(boardPageDAO.class);
//		int total=dao.getTotalCount();
		int total=dao.boardGetTotalCount(cri);
		
		return total;
	}

}







