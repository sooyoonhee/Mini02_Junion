package com.boot.DTO;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class jobpostingDTO {
	
	private int notice_num; // 
	private int notice_hit; // 
	private int notice_scrap; // 
	private String com_email; // 
	private String notice_title; // 
	private String notice_job; // 
	
	private int notice_recruitNum; // 
	private String notice_career; // 
	private String notice_jobInfo; // 
	private String notice_department; // 
	private String notice_position; // 
	private String notice_area1; // 
	private String notice_area2; // 
	private String notice_contactType; // 
	
	private String notice_startDate; // 
	private String notice_endDate; // 
	private String notice_pay1; // 
	private String notice_pay2; // 
	private String com_name; // 
	private String com_tel; // 
	
	private String notice_stack; // 
	private String notice_condition; // 
	private String notice_prefer; // 
	private String notice_benefit; // 
	private String user_email; // 
	private Date joincompany_date; // 
//	private String notice_status; // 
	
	
	private String notice_final; // 진행중, 마감 여부 String 로 표시
	private int totalCount; // 전체 공고수
	private int onCount; // 진행중 공고수
	private int offCount; // 마감된 공고수
	
	
// ===================================== jobpostingList 끝 ================================
	
	private String user_name; // 지원자 이름
	private String resume_gender; // 지원자 성별
	private Timestamp resume_age; // 지원자 나이 (날짜로 돼있어서 계산해야됨)
	private String resume_stack; // 지원자 스택
	private String career_month; // 지원자 경력
	private String resume_writeDate; // 지원자 이력서작성날짜
	private int resume_num; // 
	private int t_count; // 지원자 카운트
	private int korean_age; // 지원자 카운트

	
	
// ===================================== jobpostingSupport 끝 ================================
	
	
	private String offer_title;
	private String offer_name;
	private String offer_content;
	
	private String offer_job;
	private String offer_career;
	private String offer_pay;
	
	private String offer_agree;
	private String resume_agree;
	private String resume_submitDate;
//	private String user_email;
//	private String com_email;
//	private String notice_num;
	
	
	
	
// ===================================== jobpostingOffer 끝 ================================


}
