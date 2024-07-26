package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.jobpostingDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface jobpostingDAO {
	
	public ArrayList<jobpostingDTO> jobpostingList(String login_email); // 전체공고
	/*
	 * public ArrayList<jobpostingDTO> jobpostingOnList(String login_email); //
	 * 진행중공고 public ArrayList<jobpostingDTO> jobpostingOffList(String login_email);
	 * // 마감된공고
	 */	
	public void jobpostingDelete(String notice_num); // 공고삭제
	// DTO로 받는건 여러 컬럼 받아올때 사용
	public jobpostingDTO jobpostingTotalCount(String login_email); // 토탈카운트 (전체, 진행, 마감 3개 들어있음)
	
	
	public ArrayList<jobpostingDTO> jobpostingSupport(String login_email, String notice_num); // 공고목록 > 지원자 목록
	
	public jobpostingDTO jobpostingSupportCount(String login_email); // 지원자 카운트
	
	public void jobpostingOffer(jobpostingDTO jobpostingDTO); // 포지션제안 Insert 문

}

