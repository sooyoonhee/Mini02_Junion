package com.boot.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.PageDAO;
import com.boot.DTO.Criteria2;
import com.boot.DTO.ResumeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PageService")
public class PageServiceImpl implements PageService{

	@Autowired
	private SqlSession sqlSession;		

	@Override
	public ArrayList<ResumeDTO> listWithPaging(Criteria2 cri2, HttpServletRequest request) {
//	public ArrayList<ResumeDTO> listWithPaging(Criteria cri, String user_email) {
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# cri==>"+ cri2);
		
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# user_email==>"+ user_email);
		
		cri2.setUser_email(user_email);
		log.info("@# setUser_email 한 후 cri==>"+ cri2);
		
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
//		ArrayList<ResumeDTO> list = dao.listWithPaging(cri);
		ArrayList<ResumeDTO> list = dao.listWithPaging(cri2);
		
		log.info("@# list==>"+ list);
		
		return list;
	}

	@Override
	public int getTotalCount(String user_email) {
		log.info("@# PageServiceImpl getTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total = dao.getTotalCount(user_email);
		
		return total;
	}	

}
