package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.jobpostingDAO;
import com.boot.DTO.jobpostingDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("jobpostingService")
public class jobpostingServiceImpl implements jobpostingService{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
//	public ResumeDTO resumeList(String login_email) {
	// 전체 공고
	public ArrayList<jobpostingDTO> jobpostingList(String login_email) {
		log.info("@# jobpostingList");
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		ArrayList<jobpostingDTO> list = dao.jobpostingList(login_email);		
		return list;
	}

	
	// 공고 삭제
   @Override
    public void jobpostingDelete(String notice_num) {
        jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
        dao.jobpostingDelete(notice_num);	
    }
   
    // 전체, 진행, 마감 공고 갯수
	@Override
	public jobpostingDTO jobpostingTotalCount(String login_email) {
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		return dao.jobpostingTotalCount(login_email);
	}

	@Override
	public ArrayList<jobpostingDTO> jobpostingSupport(String login_email, String notice_num) {
		log.info("@# jobpostingList");
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		ArrayList<jobpostingDTO> list = dao.jobpostingSupport(login_email, notice_num);
		return list;
	}

    // 지원자 카운트
	@Override
	public jobpostingDTO jobpostingSupportCount(String notice_num) {
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		return dao.jobpostingSupportCount(notice_num);
	}

	// 포지션제안 Insert
	@Override
	public void jobpostingOffer(jobpostingDTO jobpostingDTO) {
		jobpostingDAO dao = sqlSession.getMapper(jobpostingDAO.class);
		dao.jobpostingOffer(jobpostingDTO);
		log.info("@# 잡포스팅Dao jobpostingDTO=>"+jobpostingDTO);
		
	}
	
}






