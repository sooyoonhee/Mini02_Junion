package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.LoginDAO;
import com.boot.DTO.LoginDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<LoginDTO> loginynI(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list user");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		ArrayList<LoginDTO> list = dao.loginynI(param);
		
		return list;
		
	}

	@Override
	public ArrayList<LoginDTO> loginynC(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list com");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		ArrayList<LoginDTO> list = dao.loginynC(param);
		
		return list;
		
	}

	@Override
	public ArrayList<LoginDTO> findEI(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list user FindE");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		ArrayList<LoginDTO> list = dao.findEI(param);
		
		return list;
	}

	@Override
	public ArrayList<LoginDTO> findPWI(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list user FindPW");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		ArrayList<LoginDTO> list = dao.findPWI(param);
		
		return list;
	}

	@Override
	public ArrayList<LoginDTO> findEC(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list company FindE");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		ArrayList<LoginDTO> list = dao.findEC(param);
		
		return list;
	}

	@Override
	public ArrayList<LoginDTO> findPWC(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list company FindPW");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		ArrayList<LoginDTO> list = dao.findPWC(param);
		
		return list;
	}
	
	@Override
	public void resetPWI(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list user resetPWI");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		dao.resetPWI(param);
	}

	@Override
	public void resetPWC(HashMap<String, String> param) {
		log.info("@# LoginServiceImpl list user resetPWC");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		dao.resetPWC(param);
	}
}
