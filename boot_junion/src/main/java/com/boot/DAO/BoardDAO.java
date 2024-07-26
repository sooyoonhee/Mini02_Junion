package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.BoardDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface BoardDAO {
	public ArrayList<BoardDTO> list();
	public void write(BoardDTO boardDTO);
	public BoardDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
















