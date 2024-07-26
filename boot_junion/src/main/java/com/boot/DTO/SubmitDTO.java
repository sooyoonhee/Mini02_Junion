package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubmitDTO {
	private int resume_num; //이력서 번호
	private int notice_num; //이력서 번호
	private String user_email; //지원자 이메일
	private String com_email;//공고올린 기업 이메일
	private String com_name;//공고올린 기업명
	

}
