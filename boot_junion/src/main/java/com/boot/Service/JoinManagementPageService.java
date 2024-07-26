package com.boot.Service;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.Criteria;
import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.NoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.StarDTO;


public interface JoinManagementPageService {
	// Criteria 객체를 이용해서 페이징 처리
	public ArrayList<NoticeDTO> joinManagementPaging(JaewonCriteria cri3, HttpServletRequest request);
	
	// 페이지 총 갯수 
	public int joinManagementGetTotalCount(String user_email);
	
	public ArrayList<NoticeDTO> notice_status2(JaewonCriteria cri3 , HttpServletRequest request);
	
	// 별점
	public void comStar(StarDTO stardto);
	
}
