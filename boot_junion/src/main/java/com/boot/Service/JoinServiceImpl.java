package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.JoinDAO;
import com.boot.DTO.JoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("JoinService")
public class JoinServiceImpl implements JoinService{

	@Autowired
	private JoinDAO joinDAO;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	// 이메일 중복체크
	public int emailCheck(String user_email) {
		log.info("@# user_email=>"+user_email);
		int result = joinDAO.emailCheck(user_email);
		log.info("@# result=>"+result);
		return result;
	}

	@Override
	public void join(HashMap<String, String> param) {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		dao.join(param);		
	}

	@Override
	public void modify(HashMap<String, String> param) {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		dao.modify(param);		
	}

	@Override
	public List<JoinDTO> stack() {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		List<JoinDTO> stack = dao.stack();	
		return stack;
	}
	
	@Override
	public List<JoinDTO> stack2() {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		List<JoinDTO> stack2 = dao.stack2();	
		return stack2;
	}
	
	@Override
	public List<JoinDTO> stack3() {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		List<JoinDTO> stack3 = dao.stack3();	
		return stack3;
	}
	
	@Override
	public List<JoinDTO> job() {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		List<JoinDTO> job = dao.job();	
		return job;
	}
	
	@Override
	public List<JoinDTO> job2() {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		List<JoinDTO> job2 = dao.job2();	
		return job2;
	}
	
	@Override
	public List<JoinDTO> job3() {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		List<JoinDTO> job3 = dao.job3();	
		return job3;
	}
	
	
	@Override
	// 기업 이메일 중복체크
	public int emailComCheck(String user_email) {
		int result = joinDAO.emailCheck(user_email);
		return result;
	}
	
	@Override
	// 기업 이메일 중복체크
	public int serialCheck(String com_serial_number) {
		int result = joinDAO.serialCheck(com_serial_number);
		return result;
	}

	@Override
	// 기업 회원가입
	public void joinCompany(HashMap<String, String> param) {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		dao.joinCompany(param);		
	}
	
	// 기술 잡 집어넣는 거
	@Override
	public void insertJob(String job_name, String user_email) {
//	public void insertJob(HashMap<String, String> param) {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		dao.insertJob(job_name, user_email);		
//		dao.insertJob(param);		
	}
	
	// 기술 잡 집어넣는 거
	@Override
	public void insertStack(String stack_name, String user_email) {
//	public void insertJob(HashMap<String, String> param) {
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		dao.insertStack(stack_name, user_email);		
//		dao.insertJob(param);		
	}



	
}
