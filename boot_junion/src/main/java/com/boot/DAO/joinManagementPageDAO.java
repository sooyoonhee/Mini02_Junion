package com.boot.DAO;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.NoticeDTO;
import com.boot.DTO.StarDTO;

// DB SQL 처리

@Mapper
public interface joinManagementPageDAO {
	// Criteria 객체를 이용해서 페이징 처리
	public ArrayList<NoticeDTO> joinManagementPaging(JaewonCriteria cri3);
	
	// 페이지 총 갯수 
	public int joinManagementGetTotalCount(@Param("user_email") String user_email);
	
	// 검색조건
	public ArrayList<NoticeDTO> notice_status2(	JaewonCriteria cri3);
	
	// 별점
	public void comStar(StarDTO stardto);
	
}
