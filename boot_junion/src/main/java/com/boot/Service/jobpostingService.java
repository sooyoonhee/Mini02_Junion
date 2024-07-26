package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.jobpostingDTO;


public interface jobpostingService {
	
	public ArrayList<jobpostingDTO> jobpostingList(String login_email); // 전체공고
	/*
	 * public ArrayList<jobpostingDTO> jobpostingOnList(String login_email); //
	 * 진행중공고 public ArrayList<jobpostingDTO> jobpostingOffList(String login_email);
	 * // 마감된공고
	 */	
	public void jobpostingDelete(String notice_num); // 공고삭제
	public jobpostingDTO jobpostingTotalCount(String login_email); // 토탈카운트 (전체, 진행, 마감 3개 들어있음)
	
	public ArrayList<jobpostingDTO> jobpostingSupport(String login_email, String notice_num); // 공고목록 > 지원자 목록

	public jobpostingDTO jobpostingSupportCount(String login_email); // 지원자 카운트
	
	public void jobpostingOffer(jobpostingDTO jobpostingDTO); // 포지션제안 Insert 문
}
