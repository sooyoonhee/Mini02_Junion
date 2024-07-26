package com.boot.Service;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.boot.DTO.Criteria2;
import com.boot.DTO.ResumeDTO;


public interface PageService {
	public ArrayList<ResumeDTO> listWithPaging(Criteria2 cri2, HttpServletRequest request);
//	public ArrayList<ResumeDTO> listWithPaging(Criteria cri, String user_email);
	
	// 페이지 총 갯수 
	public int getTotalCount(String user_email);
	
}
