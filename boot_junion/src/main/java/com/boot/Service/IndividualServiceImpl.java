package com.boot.Service;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.IndividualDAO;
import com.boot.DTO.ComScrapDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.UserJobDTO;
import com.boot.DTO.UserStackDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("IndividualService")
public class IndividualServiceImpl implements IndividualService{
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@Override
	//세션에 있는 정보를 이용해서 userDTO 가져오기
	public UserDTO getUserInfo(String user_email) {
		
		log.info("@# IndividualServiceImpl getUserInfo");
		
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		UserDTO userDTO = dao.getUserInfo(user_email);
		
		log.info("@# userDTO=>"+userDTO);
		return userDTO;
		
	}



	@Override
	public void modify(HashMap<String, String> param) {
		log.info("@# IndividualServiceImpl modify");
		
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		dao.modify(param);
	}



	@Override
//	public void updateUserNoticeNum(String recentJobPostsStr, String user_email) {
	public void updateUserNoticeNum(UserDTO userDTO) {
		log.info("@# IndividualServiceImpl updateUserNoticeNum");
//		log.info("@# IndividualServiceImpl user_email =>"+user_email);
//		log.info("@# IndividualServiceImpl recentJobPostsStr =>"+recentJobPostsStr);
		
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
//		dao.updateUserNoticeNum(recentJobPostsStr, user_email);
		dao.updateUserNoticeNum(userDTO);
		
	}



	@Override
	public List<UserStackDTO> getUserStack(String user_email) {
		log.info("@# IndividualServiceImpl getUserStack");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		List<UserStackDTO> dtos = dao.getUserStack(user_email);
		
		return dtos;
	}



	@Override
	public List<UserJobDTO> getUserJob(String user_email) {
		log.info("@# IndividualServiceImpl getUserStack");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		List<UserJobDTO> dtos = dao.getUserJob(user_email);
		
		return dtos;
	}



	@Override
	public void insertJob(UserJobDTO dto) {
		log.info("@# IndividualServiceImpl insertJob");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		dao.insertJob(dto);
		
	}



	@Override
	public void insertStack(UserStackDTO dto) {
		log.info("@# IndividualServiceImpl insertJob");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		dao.insertStack(dto);
		
	}



	@Override
	public void deleteJob(String user_email) {
		log.info("@# IndividualServiceImpl deleteJob");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		dao.deleteJob(user_email);
	}



	@Override
	public void deleteStack(String user_email) {
		log.info("@# IndividualServiceImpl deleteStack");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		dao.deleteStack(user_email);
	}



	@Override
	public void comScrapDelete(ComScrapDTO dto) {
		log.info("@# IndividualServiceImpl comScrapDelete");
		IndividualDAO dao = sqlSession.getMapper(IndividualDAO.class);
		dao.comScrapDelete(dto);
	}



}







