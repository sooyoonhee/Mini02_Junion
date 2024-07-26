package com.boot.DTO;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	private int notice_num; // 공고 식별번호
	private int notice_hit; // 공고 조회수
	private int notice_scrap; // 좋아요 수
	private String com_email;  // 기업 이메일 FK
	private String notice_title; // 공고제목
	private String notice_job; // 직무,직업
	private int notice_recruitNum; // 모집인원
	private String notice_career;  // 경력
	private String notice_jobInfo;  // 주요업무
	private String notice_department; // 근무부서
	private String notice_position; // 직책
	private String notice_area1; // 근무지역1
	private String notice_area2; // 근무지역2	
	private String notice_contactType; // 근무형태
	private Timestamp notice_startDate; // 접수시작일
	private Timestamp notice_endDate;  // 접수마감일
	private String notice_pay1; // 급여형태
	private int notice_pay2; // 급여
	private String com_name; // 기업명 FK(기업)
	private String com_tel; // 기업전화번호 FK(기업)
	private String notice_stack; // 기술/스택/툴
	private String notice_condition; // 자격요건
	private String notice_prefer; // 우대사항
	private String notice_benefit; //혜택 복지
	
	private String user_email; // 이메일
	private String resume_title; // 이력서 제목
	private String joincompany_date; // 공고지원 날짜
	private String notice_status; // 공고상태 : 공고중/ 마감
	private String noticeCheck; // 공고열람 여부
	private int companyRating; // 공고 평점
	private String resume_num; // 공고열람 여부
	// 기업사진 : 이미지업로드 파일 붙어야함
}

