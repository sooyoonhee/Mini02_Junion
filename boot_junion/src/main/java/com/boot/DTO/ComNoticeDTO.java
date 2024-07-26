package com.boot.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ComNoticeDTO {

	private int notice_num;//공고 번호
	private int notice_hit;//공고 조회수
	private int notice_scrap;//좋아요/스크랩 수
	private String com_email;//기업 이메일
	private String notice_title;//공고 제목
	private String notice_job;//직무, 직업
	private int notice_recruitNum;//모집 인원
	private String notice_career;//요구 경력
	private String notice_jobInfo;//주요 업무
	private String notice_department;//근무 부서
	private String notice_position;//직책
	private String notice_area1;//근무 지역1(..시)
	private String notice_area2;//근무 지역2(..군/구)
	private String notice_contactType;//근무 형태
	private String notice_startDate;//접수 시작일
	private String notice_endDate;//접수 마감일
	private String notice_pay1;//급여 형태
	private int notice_pay2;//급여
	private String com_name;//기업명
	private String com_tel;//기업 연락처
	private String notice_stack;//기술/스택/툴
	private String notice_condition;//자격 요건
	private String notice_prefer;//우대사항
	private String notice_benefit;//혜택/복지
	private String resumeNoArr;//지원자 이력서번호 배열
	

	private String uuid; // uuid
	private String uploadPath;  // 경로
	private String fileName; // 파일이름
	private boolean image; // 이미지구분여부 (필요x)
	
	private List<ComNoticeAttachDTO> comNoticeAttachList;
//	private List<ComRegisterUploadDTO> attachList;
	
	private String stack; //공고 스택
	private String stackValue; //공고 스택 하나씩
	private String notice_status; //공고 상태
	
	private int noticeDday; //공고 마감 디데이
}
