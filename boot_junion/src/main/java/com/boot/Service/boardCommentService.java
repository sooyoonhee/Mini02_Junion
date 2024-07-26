package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.boardCommentDTO;

public interface boardCommentService {
	public void boardSave(HashMap<String, String> param);
	public ArrayList<boardCommentDTO> boardFindAll(HashMap<String, String> param);
}
