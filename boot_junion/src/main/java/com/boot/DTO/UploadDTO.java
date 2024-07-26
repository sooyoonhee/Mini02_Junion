package com.boot.DTO;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadDTO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
	private int boardNo;
	private int resume_num;
}