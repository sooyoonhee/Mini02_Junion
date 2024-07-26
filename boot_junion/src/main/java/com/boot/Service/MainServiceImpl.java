package com.boot.Service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.MainDAO;
import com.boot.DTO.ComNoticeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ComNoticeDTO> mainNotice() {
		log.info("@# MainServiceImpl mainNotice()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainNotice();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainNewCareer() {
		log.info("@# MainServiceImpl mainNewCareer()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainNewCareer();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainCareerhit() {
		log.info("@# MainServiceImpl mainCareerhit()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainCareerhit();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainTodayhit() {
		log.info("@# MainServiceImpl mainTodayhit()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainTodayhit();
	}
	
}
