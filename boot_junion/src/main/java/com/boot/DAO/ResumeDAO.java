package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.BoardDTO;
import com.boot.DTO.LoginDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.ResumeUploadDTO;
import com.boot.DTO.UserDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface ResumeDAO {
	
	// 이력서 목록
	public ArrayList<ResumeDTO> resumeList(String login_email);
//	public ResumeDTO resumeList(String login_email);
	// 이력서 작성
	public void resumeWrite(ResumeDTO resumeDTO);
//	public void resumeWrite(HashMap<String, String> param, ResumeDTO resumeDTO);
	
	// 이력서 상세보기
	public ResumeDTO resumeInfo(HashMap<String, String> param);
	
	// 개인정보 가져오기
	public UserDTO userInfo(String user_email);
//	public UserDTO userInfo(HashMap<String, String> param);
	
	// 이력서 수정
	public void resumeModify(HashMap<String, String> param);
	
	// 이력서 삭제
	public void resumeDelete(String resume_num);
	
	// 이력서 공개여부
	public void resumeOfferUpdate(String resume_num, String resume_offer);
	
}
















