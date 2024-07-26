package com.boot.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.Service.WithDrawService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WithdrawController {
	
	@Autowired
	private WithDrawService serivce;
	
	
	//개인회원 탈퇴페이지로 가기
	@RequestMapping("/individualWithdraw")
	public String individualWithdraw(Model model) {
		log.info("@# individualWithdraw");		
		
		model.addAttribute("loginType", "session-login");
		model.addAttribute("pageName", "세션 로그인");
		
		return "individualWithdraw";
	}

	
	//개인회원정보 삭제하기
	@RequestMapping("/delUserInfo")
	public String delUserInfo(@RequestParam HashMap<String, String> param, HttpServletRequest httpServletRequest) {
		log.info("@# delUserInfo mapping");
		
		serivce.withdrawIndi(param);//개인회원정보 삭제
		httpServletRequest.getSession().invalidate();//세션 파기
		
		return "withdraw_ok";
		
	}
	
	//기업회원 탈퇴페이지로 가기
	@RequestMapping("/companyWithdraw")
	public String companyWithdraw(Model model) {
		log.info("@# companyWithdraw");		
		
		model.addAttribute("loginType", "session-login");
		model.addAttribute("pageName", "세션 로그인");
		
		return "companyWithdraw";
	}
	
	
	//개인회원정보 삭제하기
	@RequestMapping("/delComInfo")
	public String delComInfo(@RequestParam HashMap<String, String> param, HttpServletRequest httpServletRequest) {
		log.info("@# delComInfo mapping");
		
		serivce.withdrawCom(param);//개인회원정보 삭제
		httpServletRequest.getSession().invalidate();//세션 파기
		
		return "withdraw_ok";
		
	}
	
	
	//아이디 비번 일치 확인하기 하고 개인회원정보 삭제하기
//	@RequestMapping("/delUserInfo")
//	public String delUserInfo(@RequestParam HashMap<String, String> param) {
//		log.info("@# login_ok mapping");
//		
//		ArrayList<UserDTO> user = serivce.getUserInfo(param);
//		
//		if(user.isEmpty()) {
//			return "redirect:individualWithdraw";
//		}else {
//			if(param.get("user_pw").equals(user.get(0).getUser_pw())){
//				
//				return "withdraw_ok";
//			}else {
//				return "redirect:individualWithdraw";
//			}
//		}
//	}
}
