package com.boot.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class boardBoardDTO {
	private int board_no; // 보드넘버
	private String user_email; // 작성자
	private String board_title; // 제목
	private String board_content; // 내용
	private String create_date; // 날짜
	private int board_hit; // 조회수
	private int user_type; // 유저타입
	
	
	private List<boardAttachDTO> attachList;  // 파일업로드 attachDTO를 가져와서 attachList에 담음
	
	
	private int board_like; // 추천수
	private int board_like_count; // 추천을 눌렀는지 확인하는 변수
	

}






