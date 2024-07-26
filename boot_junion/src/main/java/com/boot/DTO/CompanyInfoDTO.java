package com.boot.DTO;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyInfoDTO {
	private String com_email;//기업 이메일
	private String com_pw;//기업 회원 비밀번호
	private String com_name;//기업 회원 비밀번호 확인
	private String com_serial_number;//사업자번호
//	private int user_type;//개인.기업 구분 : 기업 :2
	private char user_type;//개인.기업 구분 : 기업 :2
	private String com_tel;//기업 연락처
	private int com_star;//기업 평점
	private String com_location;//회사 주소
//	private int com_year;
//	private Date com_year;//창립일
	private String com_year;//창립일
	private String com_content;//회사 소개
	private int com_sale;//회사 매출액
//	private String com_sale;
	private String com_type;//기업 유형
	private int com_salary;//평균 연봉
//	private String com_salary;
	private String com_CEO;//회사 대표자명
	private String com_site;//회사 홈페이지
	private int com_employee;//사원 수
	private String com_person;//인사담당자명
//	private String com_job;
	private String com_stack;
//	private String stack;// 이름 변경 : 쿼리 이름과 일치시켜야 해서 수정했는데 다른 곳의 변수명과 불일치로 오류 발생
//	private int notice_num;//공고 번호
//	private String notice_num;//공고 번호
	private int com_scrap;//스크랩 수
	
	private List<CompanyAttachDTO> companyAttachList;
	
}
