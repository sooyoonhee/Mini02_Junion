package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.Criteria2;
import com.boot.DTO.ResumeDTO;

// DB SQL 처리

@Mapper
public interface PageDAO {
	// Criteria 객체를 이용해서 페이징 처리
	public ArrayList<ResumeDTO> listWithPaging(Criteria2 cri2);
//	public ArrayList<ResumeDTO> listWithPaging(Criteria cri, String user_email);
	
	// 페이지 총 갯수 
	public int getTotalCount(String user_email);
	
	
	//연주 관심기업리스트 withPage
	public ArrayList<CompanyInfoDTO> comlistWithPaging(Criteria2 cri2);
	//연주 관심기업 페이지 총 갯수
	public int getComTotalCount(String user_email);
	
	//연주 스크랩 공고 리스트 withPage
	public ArrayList<ComNoticeDTO> noticelistWithPaging(Criteria2 cri2);
	//연주 스크랩 공고 총 갯수
	public int getNoticeTotalCount(String user_email);
		
	
	
}// public class BoardDAO 끝 
