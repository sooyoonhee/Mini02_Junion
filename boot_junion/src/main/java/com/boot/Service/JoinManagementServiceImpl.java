package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.JoinManagementDAO;
import com.boot.DTO.NoticeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("JoinManagementService")
public class JoinManagementServiceImpl implements JoinManagementService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
//	public ResumeDTO resumeList(String login_email) {
	public ArrayList<NoticeDTO> joinManagementList(String login_email) {
		log.info("@# joinManagementList");
			
		JoinManagementDAO dao = sqlSession.getMapper(JoinManagementDAO.class);
		ArrayList<NoticeDTO> joinCompanyList = dao.joinManagementList(login_email);		
		
		return joinCompanyList;
	}

	@Override
//	public void notice_status(String user_email, String notice_status) {
	public ArrayList<NoticeDTO> notice_status(String noticeCheck, String notice_status, String user_email) {
		log.info("@# JoinManagementServiceImpl notice_status ====>" + notice_status);
		log.info("@# JoinManagementServiceImpl user_email ====>" + user_email);
		log.info("@# JoinManagementServiceImpl noticeCheck ====>" + noticeCheck);
		
		JoinManagementDAO dao = sqlSession.getMapper(JoinManagementDAO.class);
		ArrayList<NoticeDTO> dto = dao.notice_status(noticeCheck, notice_status, user_email);
		
		return dto;
	}

	@Override
	public int TotalJoinManagementNum(String user_email, String noticeCheck) {
		JoinManagementDAO dao = sqlSession.getMapper(JoinManagementDAO.class);
		int total = dao.TotalJoinManagementNum(user_email, noticeCheck);
		
		return total;
	}

	@Override
	public int CheckJoinManagementNum(String user_email, String noticeCheck) {
		JoinManagementDAO dao = sqlSession.getMapper(JoinManagementDAO.class);
		int total = dao.CheckJoinManagementNum(user_email, noticeCheck);
		
		return total;
	}

	@Override
	public int UnCheckJoinManagementNum(String user_email, String noticeCheck) {
		JoinManagementDAO dao = sqlSession.getMapper(JoinManagementDAO.class);
		int total = dao.UnCheckJoinManagementNum(user_email, noticeCheck);
		
		return total;
	}

	@Override
	public void cancelJoin(String resume_num) {
//	public void cancelJoin(HashMap<String, String> param) {
		log.info("@# JoinManagementServiceImpl cancelJoin ====>");
		log.info("@# JoinManagementServiceImpl resume_num ====>" + resume_num);
//		log.info("@# JoinManagementServiceImpl user_email ====>" + user_email);
		
		JoinManagementDAO dao = sqlSession.getMapper(JoinManagementDAO.class);
		dao.cancelJoin(resume_num);			
	}


	

	
	
}
