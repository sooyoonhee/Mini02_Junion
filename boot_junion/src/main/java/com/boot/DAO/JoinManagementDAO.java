package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.NoticeDTO;
import com.boot.DTO.ResumeDTO;

@Mapper
public interface JoinManagementDAO {

	// 입사지원 목록
	public ArrayList<NoticeDTO> joinManagementList(String login_email);	
	
	public ArrayList<NoticeDTO> notice_status(@Param("noticeCheck")String noticeCheck, @Param("notice_status")String notice_status, @Param("user_email")String user_email);
	
	public int TotalJoinManagementNum(@Param("user_email")String user_email, @Param("noticeCheck")String noticeCheck);
	public int CheckJoinManagementNum(@Param("user_email")String user_email, @Param("noticeCheck")String noticeCheck);
	public int UnCheckJoinManagementNum(@Param("user_email")String user_email, @Param("noticeCheck")String noticeCheck);
	
//	public void cancelJoin(HashMap<String, String> param);
	public void cancelJoin(String resume_num);
}
