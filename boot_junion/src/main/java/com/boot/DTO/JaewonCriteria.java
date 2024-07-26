package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class JaewonCriteria {
	private int pageNum; // 페이지번호
	private int amount; // 페이지당 글 갯수	
	private String user_email;
	private String noticeCheck;
	private String notice_status;
	
	public JaewonCriteria() 
	{
		this(1, 5);
	}
	
	public JaewonCriteria(int pageNum, int amount) 
	{
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
