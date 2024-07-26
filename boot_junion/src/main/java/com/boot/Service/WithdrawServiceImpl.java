package com.boot.Service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.WithdrawDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("WithDrawService")
public class WithdrawServiceImpl implements WithDrawService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void withdrawIndi(HashMap<String, String> param) {
		log.info("@# WithdrawServiceImpl withdrawIndi");
		
		WithdrawDAO dao = sqlSession.getMapper(WithdrawDAO.class);
		String user_email = param.get("user_email");
		log.info("@# param user_email"+user_email);
		
		dao.withdrawIndi(param);//개인회원 정보 삭제
		
	}

	@Override
	public void withdrawCom(HashMap<String, String> param) {
		log.info("@# WithdrawServiceImpl withdrawCom");
		
		WithdrawDAO dao = sqlSession.getMapper(WithdrawDAO.class);
		dao.withdrawCom(param);//기업회원 정보 삭제
		
		
	}

//	@Override
//	public ArrayList<UserDTO> getUserInfo(HashMap<String, String> param) {
//		WithdrawDAO dao = sqlSession.getMapper(WithdrawDAO.class);
//		ArrayList<UserDTO> user = dao.getUserInfo(param);//DB에서 userInfo 가져오기
//		return user;
//	}
//
//	@Override
//	public ArrayList<CompanyInfoDTO> getComInfo(HashMap<String, String> param) {
//		WithdrawDAO dao = sqlSession.getMapper(WithdrawDAO.class);
//		ArrayList<CompanyInfoDTO> company = dao.getComInfo(param);//DB에서 comInfo 가져오기
//		return company;
//	}

}
