package com.boot.DTO;

import lombok.Getter;
import lombok.ToString;


//@Data
//@AllArgsConstructor
//@NoArgsConstructor

@Getter
@ToString
public class CardPageDTO {
	private int startpage;//시작페이지: 1, 11
	private int endpage;//끝페이지: 10, 20
	private boolean prev, next; // 이전, 다음
	private int total; //총 갯수
	private Standard std; // 한 페이지지의 번호, 화면에 출력할 글 갯수
	
	
	public CardPageDTO(int total, Standard std) {//총 페이지 갯수와 std 객체의 setter 설정
		this.total = total;
		this.std = std;
		
//		Math.ceil : 자바 내장 함수 중 올림 메소드(return type : double)
//		ex> 3페이지 : 3/10 -> 0.3 ->1(올림) * 10(끝페이지)
		this.endpage = (int) (Math.ceil(std.getPageNum()/10.0))*10;//끝 페이지 10단위 고정
		
		this.startpage = this.endpage-9;//시작 페이지 기준 설정
		

		int realEnd = (int)(Math.ceil(total *1.0))/std.getAmount();//현재 페이지를 기준으로 한 실제 페이지 번호
	
	
		if (realEnd<=this.endpage) {
			this.endpage = realEnd;
		}
		
		this.prev = this.startpage>1;//1페이지보다 크면 존재(boolean으로 정의)
		this.next = this.endpage<realEnd;//실제 페이지보다 끝페이지가 작을 때 존재
	
	}
	
	
	
//	private int pageNum;// 페이지 번호
//	private int amount;// 페이지당 글 갯수
//	
//	public CardPageDTO() {//카드 형식의 목록은 12개가 한 페이지 갯수
//		this.pageNum = 1;
//		this.amount = 12;
//	}
	
	
}
