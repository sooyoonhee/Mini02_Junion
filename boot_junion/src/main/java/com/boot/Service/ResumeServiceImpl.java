package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.ResumeDAO;
import com.boot.DAO.ResumeUploadDAO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.UserDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ResumeService")
public class ResumeServiceImpl implements ResumeService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
//	public ResumeDTO resumeList(String login_email) {
	public ArrayList<ResumeDTO> resumeList(String login_email) {
		log.info("@# resumeList");
			
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
		ArrayList<ResumeDTO> list = dao.resumeList(login_email);		
		
		return list;
	}

	@Override
	public void resumeWrite(ResumeDTO resumeDTO) {
//	public void resumeWrite(HashMap<String, String> param, ResumeDTO resumeDTO) {
//	public void resumeWrite(HashMap<String, String> param, String login_email) {
		log.info("@# resumeWrite service impl ==>>");
//		log.info("@# resume param ==>>" + param);
		
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
//		dao.resumeWrite(param, login_email);
		dao.resumeWrite(resumeDTO);
//		dao.resumeWrite(param, resumeDTO);
		
		
		// 파일업로드 시작 //
		log.info("@# 보드서비스임플 boardDTO.getAttachList()=>"+resumeDTO.getResumeUploadList());
		ResumeUploadDAO adao = sqlSession.getMapper(ResumeUploadDAO.class);
//		첨부파일 있는지 체크
		if (resumeDTO.getResumeUploadList() == null || resumeDTO.getResumeUploadList().size() == 0) {
			log.info("@# null");
			return;
		}
		
//		첨부파일이 있는 경우 처리  // 첨부파일이 있는 경우에는 그 게시글와 boardNO로 일치하는 위치에 insertFile해준다.
		
		resumeDTO.getResumeUploadList().forEach(attach -> {   // boardDTO에 파일리스트에 반복문 실행, 'attach' 변수? 에 boardDTO 에 있는 getBoardNo를/'attach'에 setBoardNo를 사용하여 담는다
			attach.setResume_num(resumeDTO.getResume_num());
			
			adao.resumeInsertFile(attach);  // ('adao.insertFile'(BoardAttachDAO 에 있는 객체?))에 'attach' 정보를 담는다
		});
		// 파일업로드 끝 //
		
	}
	
	@Override
	public ResumeDTO resumeInfo(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl content_view");
			
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
		ResumeDTO dto = dao.resumeInfo(param);
		
		return dto;
	}

	@Override
//	public ArrayList<UserDTO> userInfo(HashMap<String, String> param) {
	public UserDTO userInfo(String user_email) {
//	public UserDTO userInfo(HashMap<String, String> param) {
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
		UserDTO dto = dao.userInfo(user_email);
		return dto;
	}

	@Override
	public void resumeModify(HashMap<String, String> param) {
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
		dao.resumeModify(param);		
	}

	@Override
	public void resumeDelete(String resume_num) {
//	public void resumeDelete(HashMap<String, String> param) {
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
		dao.resumeDelete(resume_num);		
	}

	@Override
	public void resumeOfferUpdate(String resume_num, String resume_offer) {	
		ResumeDAO dao = sqlSession.getMapper(ResumeDAO.class);
		dao.resumeOfferUpdate(resume_num, resume_offer);			
	}

	

	
	
}
