package com.boot.Service;

import java.util.ArrayList;

import com.boot.DAO.CardPageDAO;
import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.Standard;

public interface CardPageService {
	public ArrayList<ComNoticeDAO> cardPageList(Standard std);// 페이징을 위한 메소드
//	public ArrayList<ComNoticeDAO> cardPageList(CardPageDAO dao);// 페이징을 위한 메소드
}
