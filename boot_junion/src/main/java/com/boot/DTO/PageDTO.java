package com.boot.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

//@Data
//@AllArgsConstructor
//@NoArgsConstructor
@Getter
@ToString
public class PageDTO {
	private int startpage; // 시작페이지 : 1, 11
	private int endpage; // 끝페이지 : 10, 20
	private boolean prev, next;
	private int total;
	private Criteria2 cri; // 화면에 출력 갯수
	
	public PageDTO(int total, Criteria2 cri) {
//		super();
		this.total = total;
		this.cri = cri;
						// ex> 3페이지= 3/10 -> 0.3 -> 1*10 = 10(끝페이지)
						// ex> 11페이지 = 11/10 -> 1.1 -> 2*10 = 20(끝페이지)
						// ceil : 올림공식
		this.endpage = (int)(Math.ceil(cri.getPageNum() / 10.0))*10;
		this.startpage = this.endpage - 9;
		
		// ex> total : 70, 현재 페이지 : 3 -> endPage: 10 => 70*1.0 / 10 => 7페이지
		int realEnd = (int)Math.ceil((total * 1.0) / cri.getAmount());
		
		if (realEnd <= this.endpage) 
		{
			this.endpage = realEnd;
		}
		
		// 1페이지보다 크면 존재 -> 참이고 아님 거짓으로 없음
		this.prev = this.startpage >1 ;
		this.next = this.endpage < realEnd;
	}
	
	
	 // cri2의 getter 메서드 추가 (이미 Lombok @Getter가 처리하지만, 명시적으로 추가)
    public Criteria2 getCri() {
        return cri;
    }
	
}

