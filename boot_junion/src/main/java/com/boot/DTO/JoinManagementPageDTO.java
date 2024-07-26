package com.boot.DTO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class JoinManagementPageDTO {

	private int startpage; // 시작페이지 : 1, 11
	private int endpage; // 끝페이지 : 10, 20
	private boolean prev, next;
	private int total;
	private JaewonCriteria cri3; // 화면에 출력 갯수
	
	public JoinManagementPageDTO(int total, JaewonCriteria cri3) {
		super();
		this.total = total;
		this.cri3 = cri3;
						// ex> 3페이지= 3/10 -> 0.3 -> 1*10 = 10(끝페이지)
						// ex> 11페이지 = 11/10 -> 1.1 -> 2*10 = 20(끝페이지)
						// ceil : 올림공식
		this.endpage = (int)(Math.ceil(cri3.getPageNum() / 10.0))*10;
		this.startpage = this.endpage - 9;
		
		// ex> total : 70, 현재 페이지 : 3 -> endPage: 10 => 70*1.0 / 10 => 7페이지
		int realEnd = (int)Math.ceil((total * 1.0) / cri3.getAmount());
		
		if (realEnd <= this.endpage) 
		{
			this.endpage = realEnd;
		}
		
		// 1페이지보다 크면 존재 -> 참이고 아님 거짓으로 없음
		this.prev = this.startpage >1 ;
		this.next = this.endpage < realEnd;
	}
}
