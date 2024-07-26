package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.CompanyInfoDTO;

@Mapper
public interface CompanyInfoDAO {
	public CompanyInfoDTO companyInfo(String email);//기업 정보 페이지
	public CompanyInfoDTO InfoMini(String email);//기업 기본정보 조회 페이지
	public void modify_Info(HashMap<String, String> param);//기업 기본정보 수정
	public CompanyInfoDTO companyInfoUpdate(String com_email);//기업 상세정보 수정 페이지
	public void modify_Detail(HashMap<String, String> param);// 기업 상세정보 수정
	
	public ArrayList<CompanyInfoDTO> getStackList(String com_email);//기업상세정보 수정시 기존 스택 정보를 1. 우선 전부 조회
	public void removeStack(@Param("stack") String stack, @Param("com_email") String com_email);//2. 기존 스택 값이 여러개일 경우, 첫번째 스택 제외 모든 컬럼 삭제
	public void oneStack(@Param("stack") String stack, @Param("com_email") String com_email);//3. 스택 선택값이 하나일 경우 or 여러개 중 첫번째 스택 추가
	public void addStacks(@Param("stack") String stack, @Param("com_email") String com_email);//4. 스택 선택값이 여러개의 경우, 두번 째 스택 값부터 테이블 추가
	
	public void modify_Detail(CompanyInfoDTO companyInfoDTO);//파일 업로드 관련 메소드?
	public ArrayList<CompanyInfoDTO> comList();//기업목록
	public ArrayList<CompanyInfoDTO> comListByNum(String comScrapArrStr);//기업목록
	public CompanyInfoDTO comInfoByNum(int com_num);//기업정보조회
}
