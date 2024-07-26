package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.boardCommentDAO;
import com.boot.DAO.comBoardCommentDAO;
import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.comBoardCommentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("comBoardCommentService")
public class comBoardCommentServiceImpl implements comBoardCommentService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardSave(HashMap<String, String> param) {
		log.info("@# 코멘트서비스임플 save");
		
		comBoardCommentDAO dao = sqlSession.getMapper(comBoardCommentDAO.class);
		dao.boardSave(param);
	}

	@Override
	public ArrayList<comBoardCommentDTO> boardFindAll(HashMap<String, String> param) {
		log.info("@# 코멘트서비스임플 findAll");
		
		comBoardCommentDAO dao = sqlSession.getMapper(comBoardCommentDAO.class);
		ArrayList<comBoardCommentDTO> list = dao.boardFindAll(param);
		
		return list;
	}

}







