package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.boot.DTO.JoinDTO;

public interface JoinService {
	
	//이메일 중복 체크
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
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> stack();
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> stack2();
	
	// 회원가입-개인2단계 항목뿌리기
	public List<JoinDTO> stack3();
	
	public void insertJob(String job_name, String user_email);
//	public void insertJob(HashMap<String, String> param);
	
	public void insertStack(String stack_name, String user_email);
//	public void insertJob(HashMap<String, String> param);
	
	// 기업 이메일 중복 체크
	public int serialCheck(String com_serial_number);
	
	// 기업 이메일 중복 체크
	public int emailComCheck(String com_email);
	
	// 회원가입-개인
	public void joinCompany(HashMap<String, String> param);
}
