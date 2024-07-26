package com.boot.Service;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.Criteria2;
import com.boot.DTO.ResumeDTO;


public interface PageService {
	public ArrayList<ResumeDTO> listWithPaging(Criteria2 cri2, HttpServletRequest request);
//	public ArrayList<ResumeDTO> listWithPaging(Criteria cri, String user_email);
	
	// 페이지 총 갯수 
	public int getTotalCount(String user_email);
	
	
	//연주 관심기업리스트 withPage
	public ArrayList<CompanyInfoDTO> comlistWithPaging(Criteria2 cri2, HttpServletRequest request);
	//연주 관심기업 페이지 총 갯수
	public int getComTotalCount(String user_email);
	
	
	//연주 스크랩 공고 리스트 withPage
	public ArrayList<ComNoticeDTO> noticelistWithPaging(Criteria2 cri2, HttpServletRequest request);
	//연주 스크랩 공고 총 갯수
	public int getNoticeTotalCount(String user_email);
	
	
	
}
