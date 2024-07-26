package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SubmitDTO;

public interface ComNoticeDAO {
//	public ArrayList<ComNoticeDTO> JobPostCard();//채용공고(카드형) 목록 가져오기
//	public ComNoticeDTO JobPost(int notice_num);//상세 채용공고 정보 가져오기
//	public String comLocation(String com_email);//상세 채용공고-회사 위치 가져오기
//	
	
	public ArrayList<ComNoticeDTO> JobPostCard();//채용공고(카드형) 목록 가져오기
	public void hitUP(int notice_num);//채용공고 선택시 조회수 증가
	public ComNoticeDTO JobPost(int notice_num);//상세 채용공고 정보 가져오기
	public String comLocation(String com_email);//상세 채용공고-회사 위치 가져오기
	public ComNoticeDTO getNoticeInfo(int notice_num);//지원하기 클릭, 공고 정보 가져오기
	public ArrayList<ResumeDTO> getProfileList(String user_email);//지원하기 클릭, 이력서 정보 가져오기
	public ArrayList<ComNoticeDTO> getResumeNum(int notice_num);//이력서 선택, 지원 완료시 공고 테이블에 이력서 배열값 가져오기
	public void insertResumNum(HashMap<String, String> param);//이력서 선택, 지원 완료시 공고 테이블에 이력서 번호 추가
	public void updateSubmitData(SubmitDTO submitDTO);//이력서지원정보 저장
		
	

    
	public void registerNotice(ComNoticeDTO comNoticeDTO); //공고등록
	public void noticeInsertStack(ComNoticeDTO comNoticeDTO); //공고등록-스택 테이블 insert
	public void noticeStauts(ComNoticeDTO comNoticeDTO); //공고 상태 업데이트
	
//	파일업로드는 파라미터를 DTO 사용
	public void registInsertFile(ComNoticeAttachDTO vo);  // 파라미터가 ComNoticeAttachDTO / 파일추가
	public List<ComNoticeAttachDTO> registGetFileList(int notice_num); // int타입 notice_num파라미터를 list타입 <ComNoticeAttachDTO> getFileList로 사용하려함 / 파일열람
	public void registDeleteFile(String notice_num);  // notice_num 맞춰서 파일삭제로직 / 파일삭제
	
    public List<Integer> getNoticeNums(@Param("com_email") String com_email); //notice_num 배열 가져오기

	
}
