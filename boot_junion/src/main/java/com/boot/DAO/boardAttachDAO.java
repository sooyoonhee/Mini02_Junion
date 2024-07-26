package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.boardAttachDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface boardAttachDAO {  // 파일추가, 열람, 삭제
//	파일업로드는 파라미터를 DTO 사용
	public void boardInsertFile(boardAttachDTO vo);  // 파라미터가 boardattachDTO / 파일추가
	public List<boardAttachDTO> boardGetFileList(int board_no); // int타입 boardNO파라미터를 list타입 <boardattachDTO> getFileList로 사용하려함 / 파일열람
	public void boardDeleteFile(String board_no);  // boardNO 맞춰서 파일삭제로직 / 파일삭제
}
















