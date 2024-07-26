package com.boot.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	private String user_email;
	private String user_pw;
	private String user_pw_check;
	private String user_name;
//	private int user_profileNum;
//	private String user_stack;
//	private String user_position;
	private int user_questionNum;
	private String user_questionAnswer;
	private String user_tel;
	private char user_type;
	private String user_location;
	private String user_location2;
	private String user_birthdate;
//	private Date user_birthdate;
	private String user_gender;
	
	private List<UserAttachDTO> userAttachDTO;
	private List<UserStackDTO> userStackDTO;
	private List<UserJobDTO> userJobDTO;
	private List<NoticeScrapDTO> noticeScrapDTO;
	private List<RecentNoticeDTO> recentNoticeDTO;
	
	private List<UserAttachDTO> userAttachList;
	
	
	private String recent_noticeNumArray;
	private String comScrapArray;
	private String noticeScrapArray;
	private int user_no;
	
	private int stack_no;
	private String stack_name;
	private int job_no;
	private String job_name;
	private String job_name2;
}
