package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
//@NoArgsConstructor
public class Criteria {  // 페이지당 글 갯수 설정 / 페 
	private int pageNum;//페이지 번호
	private int amount;//페이지당 글 갯수
	private String user_email;
	
	private String type;  // 작성자, 제목, 내용 타입인듯?
	private String keyword;  // 검색기능? 
	
	public Criteria() {  // 페이징에 표기될 크기설정 / ex) 1페이지~10페이지
		this(1, 10);
	}
	public Criteria(int pageNum, int amount) {  // 페이지 번호와 표기될 개수를 합쳐놓은 객체
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
