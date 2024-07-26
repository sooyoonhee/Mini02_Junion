package com.boot.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.JoinManagementDAO;
import com.boot.DAO.PageDAO;
import com.boot.DAO.joinManagementPageDAO;
import com.boot.DTO.Criteria;
import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.NoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.StarDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("JoinManagementPageService")
public class JoinManagementPageServiceImpl implements JoinManagementPageService{

	@Autowired
	private SqlSession sqlSession;	
	@Override
	public  ArrayList<NoticeDTO> joinManagementPaging(JaewonCriteria cri3, HttpServletRequest request) {
		log.info("@# JoinManagementPageServiceImpl joinManagementPaging");
		log.info("@# JoinManagementPageServiceImpl cri3==>"+ cri3);
		
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# JoinManagementPageServiceImpl user_email==>"+ user_email);
		
		cri3.setUser_email(user_email);
		
		joinManagementPageDAO dao = sqlSession.getMapper(joinManagementPageDAO.class);
//		ArrayList<ResumeDTO> list = dao.listWithPaging(cri);
		ArrayList<NoticeDTO> list2 = dao.joinManagementPaging(cri3);
		
		log.info("@# JoinManagementPageServiceImpl list==>"+ list2);
		
		return list2;
	}

	@Override
	public int joinManagementGetTotalCount(String user_email) {
		log.info("@# JoinManagementPageServiceImpl joinManagementGetTotalCount");
		
		joinManagementPageDAO dao = sqlSession.getMapper(joinManagementPageDAO.class);
		int total = dao.joinManagementGetTotalCount(user_email);
		
		return total;

	}

	@Override
	public ArrayList<NoticeDTO> notice_status2(JaewonCriteria cri3, HttpServletRequest request) {		
		
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# JoinManagementPageServiceImpl user_email==>"+ user_email);
		cri3.setUser_email(user_email);		
		
		log.info("@# JoinManagementServiceImpl cri3 ====>" + cri3);
		joinManagementPageDAO dao = sqlSession.getMapper(joinManagementPageDAO.class);
		ArrayList<NoticeDTO> dto = dao.notice_status2(cri3);
		
		return dto;
	}
	
	// 별점
	public void comStar(StarDTO stardto) {
		joinManagementPageDAO dao = sqlSession.getMapper(joinManagementPageDAO.class);
		
		log.info("@# JoinManagementServiceImpl stardto ====>" + stardto);		
		
		dao.comStar(stardto);
		
		
	}

	

}
