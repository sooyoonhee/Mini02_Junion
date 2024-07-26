package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyAttachDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
	private String com_email;

//	public String getImageURL() {
//		return URLEncoder.e
//	}
}

//create table board_attach
//-- join, 어떤 게시판의 댓글인지 알기 위해 boardNo 필요 
//(uuid varchar(100) primary key
//, uploadpath varchar(200) not null -- 파일을 업로드하는 경로
//, filename varchar(100) not null
//, image char(1) -- 이미지 파일의 여부(character)
//, boardNo int -- join할 게시판 번호
//)