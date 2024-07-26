package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.comBoardCommentDTO;

public interface comBoardCommentService {  // 댓글 저장, 열람
	public void boardSave(HashMap<String, String> param); // 댓글 저장 / 파라미터 해쉬맵 param
	public ArrayList<comBoardCommentDTO> boardFindAll(HashMap<String, String> param); // 댓글 열람 / 게시글번호와 맞춰 select / 파라미터 해쉬맵 param
}
