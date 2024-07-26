package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.boot.DTO.BoardDTO;
import com.boot.DTO.LoginDTO;
import com.boot.DTO.NoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.UserDTO;


public interface JoinManagementService {
	
	// 입사지원 목록
	public ArrayList<NoticeDTO> joinManagementList(String login_email);

	public ArrayList<NoticeDTO> notice_status(String noticeCheck, String notice_status, String user_email);
	
	public int TotalJoinManagementNum(String user_email, String noticeCheck);
	public int CheckJoinManagementNum(String user_email, String noticeCheck);
	public int UnCheckJoinManagementNum(String user_email, String noticeCheck);

//	public void cancelJoin(HashMap<String, String> param);
	public void cancelJoin(String resume_num);
	
}
