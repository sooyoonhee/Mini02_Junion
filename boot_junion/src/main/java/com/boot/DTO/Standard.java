package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Standard {
	private int pageNum;// 페이지 번호
	private int amount;// 페이지당 글 갯수
	
	public Standard() {//카드 형식의 목록은 12개가 한 페이지 갯수
		this(1, 12);
	}
}
