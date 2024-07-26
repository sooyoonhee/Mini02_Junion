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
	
	private String type;//어디서 검색할지 제목,내용..
	private String keyword;//검색에 넣은 단어
	
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
