package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.Criteria;
import com.boot.DTO.boardBoardDTO;

public interface boardPageService {
	public ArrayList<boardBoardDTO> boardListWithPaging(Criteria cri);
//	public int getTotalCount();
	public int boardGetTotalCount(Criteria cri);
}
