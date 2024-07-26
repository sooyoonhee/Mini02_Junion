package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class Criteria2 {
	private int pageNum; // 페이지번호
	private int amount; // 페이지당 글 갯수	
	private String user_email;
	
	public Criteria2() 
	{
		this(1, 5);
	}
	
	public Criteria2(int pageNum, int amount) 
	{
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
