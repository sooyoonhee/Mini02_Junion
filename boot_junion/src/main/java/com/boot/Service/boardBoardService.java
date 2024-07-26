package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.boardBoardDTO;





public interface boardBoardService {
	public ArrayList<boardBoardDTO> boardList();  // 게시판 목록
	
//	public void write(HashMap<String, String> param);
//	public BoardDTO contentView(HashMap<String, String> param);
	public boardBoardDTO boardDetailView(HashMap<String, String> param);
	public boardBoardDTO boardModifyView(HashMap<String, String> param);
//	public void upHit(String boardNo); 생략
	public void boardWrite(boardBoardDTO boardDTO);
	public void boardModify(HashMap<String, String> param);
	public void boardDelete(HashMap<String, String> param);
	
	public int hitcount(boardBoardDTO boardDTO);
	
	int checkLike(@Param("board_no") int board_no, @Param("user_email") String user_email);
	void insertLike(@Param("board_no") int board_no, @Param("user_email") String user_email);

}
