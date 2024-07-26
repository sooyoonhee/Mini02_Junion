package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.JoinDTO;

@Mapper
public interface JoinDAO {
	
	// 이메일 중복 체크
	public int emailCheck(String user_email);
	
	// 회원가입-개인
	public void join(HashMap<String, String> param);
	
	// 회원가입-개인2단계
	public void modify(HashMap<String, String> param);
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> job();
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> job2();
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> job3();
	
	// 회원가입-개인 job 저장
	public void insertJob(@Param("job_name")String job_name, @Param("user_email")String user_email);
//	public void insertJob(HashMap<String, String> param);
	
	// 회원가입-개인 stack 저장
	public void insertStack(@Param("stack_name")String stack_name, @Param("user_email")String user_email);
//	public void insertJob(HashMap<String, String> param);
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> stack();
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> stack2();
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> stack3();
	
	
	// 기업 이메일 중복 체크
	public int emailComCheck(String com_email);
	
	// 기업 이메일 중복 체크
	public int serialCheck(String com_serial_number);
	
	// 회원가입-개인
	public void joinCompany(HashMap<String, String> param);
}
