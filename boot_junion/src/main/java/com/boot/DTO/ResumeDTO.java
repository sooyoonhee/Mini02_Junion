package com.boot.DTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.boot.DTO.UserDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeDTO {
	private int resume_num; //이력서 번호
	private Timestamp resume_writeDate; //이력서 작성일
	private String resume_title; //이력서 제목
	private String user_name; //이름
	private String resume_age; //나이
	private String resume_gender; //성별
	private String user_email; //이메일
	private String user_tel; //전화번호
	private String user_address; //주소
	private int resume_pay;	//희망 연봉
	
	private List<ResumeUploadDTO> resumeUploadList; //파일업로드	
	private String career_month; // 경력계산
	private Date career_start; //경력시작
	private Date career_end; //경력끝
	private String resume_status; //경력(재직여부)
	private String resume_comName; //경력(회사명)
	private String resume_comPart; //경력_부서
	private String resume_comPosition; //경력_직책
	private int careerNum; //경력넘버
	
	private Date resume_eduStart; //학력시작
	private Date resume_eduEnd; //학력끝
	private String resume_eduStatus; //재학여부
	private String resume_eduName; //학교명
	private String resume_eduMajor; //전공
	private int EduNum; //교육넘버
	
	private String resume_exStart; //경험활동교육 시작
	private String resume_exEnd; //경험활동교육 끝
	private String resume_exName; //경험활동교육 기관명
	private String resume_exContent; //경험활동교육내용
	private int exNum; //경험넘버
	
	private Date resume_licenseDate; //자격어학수상 취득일
	private String resume_licenseContent; //자격어학수상 이름
	private int licenseNum; //자격증넘버
	
	private String resume_portfolio_name; //	포토폴리오(파일명)	
	private String resume_portfolio_url; //	포토폴리오(파일명)	
	
	private int portfolioNum; //포트폴리오넘버
	private String resume_stack; //기술스택툴
	private String resume_intro; //자기소개서
	//private String resume_agree; //포지션 제안 수락여부
	//private Timestamp resume_agreeDate; //제안수락일
	//private Timestamp resume_submitDate; //제출일
	
	private UserDTO userDTO;
	
	private String resume_offer; // 이력서공개여부
	
	
		
//	private List<CareerDTO> career; // 커리어
//	private List<EduDTO> edu; // 교육
//	private List<ExDTO> ex; // 경험
//	private List<LicenseDTO> license; // 자격증
//	private List<PortfolioDTO> portfolio; // 포트폴리오
}
