package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginDTO {
	private String user_email;
	private String user_pw;
	private String user_pw_check;
	private String user_name;
	private int user_questionNum;
	private String user_questionAnswer;

	private String com_email;
	private String com_pw;
	private String com_pw_check;
	private String com_name;
	private String com_serial_number;
	
	private char user_type;//0704 서연주 세션때문에 추가
}
