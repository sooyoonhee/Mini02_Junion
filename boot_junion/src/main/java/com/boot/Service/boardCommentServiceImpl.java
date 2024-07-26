package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.boardCommentDAO;
import com.boot.DTO.boardCommentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("boardCommentService")
public class boardCommentServiceImpl implements boardCommentService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardSave(HashMap<String, String> param) {
		log.info("@# 코멘트서비스임플 save");
		
		boardCommentDAO dao = sqlSession.getMapper(boardCommentDAO.class);
		dao.boardSave(param);
	}

	@Override
	public ArrayList<boardCommentDTO> boardFindAll(HashMap<String, String> param) {
		log.info("@# 코멘트서비스임플 findAll");
		
		boardCommentDAO dao = sqlSession.getMapper(boardCommentDAO.class);
		ArrayList<boardCommentDTO> list = dao.boardFindAll(param);
		
		return list;
	}

}







