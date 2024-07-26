package com.boot.DTO;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	private String user_email;
	private int board_no;
	private String board_title;
	private String board_file;
	private String board_content;
	private Timestamp create_date;
	private int board_hit;
	private int board_like;
	private int user_type;
	
	
//	private List<BoardAttachDTO> attachList;
}









