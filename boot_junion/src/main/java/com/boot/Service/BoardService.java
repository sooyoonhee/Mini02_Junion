package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.BoardDTO;


public interface BoardService {
	public ArrayList<BoardDTO> list();
	public void write(BoardDTO boardDTO);
	public BoardDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
