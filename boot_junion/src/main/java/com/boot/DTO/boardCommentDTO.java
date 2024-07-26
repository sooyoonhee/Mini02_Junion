package com.boot.DTO;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class boardCommentDTO {
	private int commentNo;
	private String user_email;
	private String commentContent;
	private int board_no;
	private Timestamp commentCreatedTime;
}
