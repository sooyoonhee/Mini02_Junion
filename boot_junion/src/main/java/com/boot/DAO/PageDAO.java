package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

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
	
}// public class BoardDAO 끝 
