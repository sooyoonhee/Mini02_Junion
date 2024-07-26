package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.Criteria;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;

public interface comBoardPageService {  // 
//	Criteria 객체를 이용해서 페이징 처리
	// 페이징 기능 사용?// 크리테리아 객체를 cri로 가져옴 / cri에 배열로 받아온 boardDTO 를 넣고 / 페이징 기능에 사용함??
	public ArrayList<comBoardBoardDTO> boardListWithPaging(Criteria cri);  
//	public int getTotalCount();
	public int boardGetTotalCount(Criteria cri);  // 총 페이지 갯수? 카운트? // 크리테리아 객체를 cri로 가져옴 
}
