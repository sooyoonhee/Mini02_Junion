package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.boot.DTO.BoardDTO;
import com.boot.DTO.LoginDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.UserDTO;


public interface ResumeService {
	public ArrayList<ResumeDTO> resumeList(String login_email);
//	public ResumeDTO resumeList(String login_email);
	public void resumeWrite(ResumeDTO resumeDTO);
//	public void resumeWrite(HashMap<String, String> param, ResumeDTO resumeDTO);
	public ResumeDTO resumeInfo(HashMap<String, String> param);
	public UserDTO userInfo(String user_email);
//	public UserDTO userInfo(HashMap<String, String> param);
	public void resumeModify(HashMap<String, String> param);
	public void resumeDelete(String resume_num);
	public void resumeOfferUpdate(String resume_num, String resume_offer);
	
}
