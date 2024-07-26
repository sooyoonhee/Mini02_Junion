package com.boot.DTO;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StarDTO {
	private int notice_num; // 공고 식별번호
	private String com_email; // 회사 이메일
	private String user_email; // 회사 이메일
	private int com_star; // 별
}

