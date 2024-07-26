package com.boot.Service;

import java.util.ArrayList;

import com.boot.DTO.ComNoticeDTO;

public interface MainService {
	public ArrayList<ComNoticeDTO> mainNotice(); // main 신입 개발자 채용 공고 가져오기
	public ArrayList<ComNoticeDTO> mainNewCareer(); // main 신입 top5 가져오기
	public ArrayList<ComNoticeDTO> mainCareerhit(); // main 경력 인기 top5 가져오기
	public ArrayList<ComNoticeDTO> mainTodayhit(); // main 오늘 뜬 인기 top5 가져오기
}
