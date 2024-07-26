package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.LoginDTO;
import com.boot.Service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {

	@Autowired
	private LoginService service;
	
	@RequestMapping("/login")
	public String login() {
		log.info("@# login");
		
		return "login";
	}
	
	// (개인회원 로그인) 비밀번호 일치 확인
	@RequestMapping("/login_ynI")
	public String login_yn(@RequestParam HashMap<String, String> param, HttpServletRequest httpServletRequest, Model model) {
		log.info("@# login_ynI");
		
		ArrayList<LoginDTO> dtos = service.loginynI(param);
		
		if (dtos.isEmpty()) {
			httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
			httpServletRequest.setAttribute("url", "/login");
			return "/alert";
		} else {
			if (param.get("user_pw").equals(dtos.get(0).getUser_pw())) {
		        // 비밀번호 확인 =>로그인ok 가기전  세션 생성

		        // 세션을 생성하기 전에 기존의 세션 파기
		        httpServletRequest.getSession().invalidate();
		        HttpSession session = httpServletRequest.getSession(true);  // Session이 없으면 생성
				
		        // 세션에 userId를 넣어줌
		        session.setAttribute("login_email", dtos.get(0).getUser_email());
		        session.setAttribute("login_pw", dtos.get(0).getUser_pw());
		        session.setAttribute("login_name", dtos.get(0).getUser_name());
		        session.setAttribute("login_usertype", dtos.get(0).getUser_type());
		        
		        log.info("@# session login_email=>"+session.getAttribute("login_email"));
		        
		        //로그인 한 상태가 필요한 페이지에는 아래 행 추가
		        model.addAttribute("loginType", "session-login");
		        model.addAttribute("pageName", "세션 로그인");
		        
		        session.setMaxInactiveInterval(1800); // Session이 30분동안 유지
		        return "redirect:main";
			} else {
				httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
				httpServletRequest.setAttribute("url", "/login");
				return "alert";			}
		}
	}
	
	
	
	// (기업회원 로그인) 비밀번호 일치 확인
	@RequestMapping("/login_ynC")
	public String login_ync(@RequestParam HashMap<String, String> param,  HttpServletRequest httpServletRequest, Model model) {
		log.info("@# login_ynC");
		
		ArrayList<LoginDTO> dtosc = service.loginynC(param);
		
		if ( dtosc.isEmpty()) {
			httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
			httpServletRequest.setAttribute("url", "/login");
			return "/alert";
		} else {
			if (param.get("com_pw").equals(dtosc.get(0).getCom_pw())) {
				
				 // 비밀번호 확인 =>로그인ok 가기전  세션 생성

				
		        // 세션을 생성하기 전에 기존의 세션 파기
		        httpServletRequest.getSession().invalidate();
		        HttpSession session = httpServletRequest.getSession(true);  // Session이 없으면 생성
				
				
		        // 세션에 userId를 넣어줌
		        session.setAttribute("login_email", dtosc.get(0).getCom_email());
		        session.setAttribute("login_pw", dtosc.get(0).getCom_pw());
		        session.setAttribute("login_name", dtosc.get(0).getCom_name());
		        session.setAttribute("login_usertype", dtosc.get(0).getUser_type());
		        
		        log.info("@# session login_email=>"+session.getAttribute("login_email"));
		        
		        //로그인 한 상태가 필요한 페이지에는 아래 행 추가
		        model.addAttribute("loginType", "session-login");
		        model.addAttribute("pageName", "세션 로그인");
		        
		        session.setMaxInactiveInterval(1800); // Session이 30분동안 유지
		        return "company/companyMain";
//		        return "redirect:company/companyMain";
//				return "redirect:companyMain";
			} else {
				httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
				httpServletRequest.setAttribute("url", "/login");
				return "/alert";
			}
		}
	}
	

	//(개인회원) 이메일찾기 정보 입력, 이메일 조회
	@RequestMapping("/findEI")
	public String findEI(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest httpServletRequest)
	{
		
		log.info("@# findEI");
		ArrayList<LoginDTO> dtos = service.findEI(param);
		log.info("@# dtos findEI"+dtos);
		
		if (dtos.isEmpty()) {
			log.info("@# 실패");
			httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
			httpServletRequest.setAttribute("url", "/findEmailIndividual");
			return "/alert";
		}else {
			if ((param.get("user_name").equals(dtos.get(0).getUser_name()) 
					&& Integer.parseInt(param.get("user_questionNum")) == ((dtos.get(0).getUser_questionNum())) 
					&& param.get("user_questionAnswer").equals(dtos.get(0).getUser_questionAnswer())) ) {
				
				List<String> userEmail = dtos.stream().map(LoginDTO::getUser_email).toList();
				model.addAttribute("userFindEmail", userEmail);

				log.info("@# 성공" + dtos.get(0).getUser_email() );
				
				return "findEmailCheckI";
			}else {
				log.info("@# 실패");
				httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
				httpServletRequest.setAttribute("url", "/findEmailIndividual");
				return "/alert";
			}
		}
		
	}
	
	//(기업회원) 이메일찾기 정보 입력, 이메일 조회
		@RequestMapping("/findEC")
		public String findEC(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest httpServletRequest)
		{
			
			log.info("@# findEC");
			ArrayList<LoginDTO> dtos = service.findEC(param);
			log.info("@# dtos findEC"+dtos);
			
			if (dtos.isEmpty()) {
				httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
				httpServletRequest.setAttribute("url", "/findEmailCompany");
				return "/alert";
			}else {
				if ((param.get("com_name").equals(dtos.get(0).getCom_name()) 
						&& param.get("com_serial_number").equals(dtos.get(0).getCom_serial_number())) ) {
					
					List<String> comEmail = dtos.stream().map(LoginDTO::getCom_email).toList();
					model.addAttribute("comFindEmail", comEmail);

					log.info("@# 성공" + dtos.get(0).getCom_email() );
					
					return "/findEmailCheckC";
				}else {
					log.info("@# 실패");
					httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
					httpServletRequest.setAttribute("url", "/findEmailCompany");
					return "/alert";
				}
			}
			
		}
	
	//(개인회원) 비밀번호찾기 정보 입력
	@RequestMapping("/findPWI")
	public String findPWI(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest httpServletRequest)
	{
		
		log.info("@# findPWI");
		ArrayList<LoginDTO> dtos = service.findPWI(param);
		log.info("@# dtos findPWI"+dtos);
		
		if (dtos.isEmpty()) {
			httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
			httpServletRequest.setAttribute("url", "/findPasswordIndividual");
			return "/alert";
		}else {
			if (param.get("user_email").equals(dtos.get(0).getUser_email())
					&& param.get("user_name").equals(dtos.get(0).getUser_name()) 
					&& Integer.parseInt(param.get("user_questionNum")) == ((dtos.get(0).getUser_questionNum())) 
					&& param.get("user_questionAnswer").equals(dtos.get(0).getUser_questionAnswer()) ) {
				
				model.addAttribute("userEmailP",dtos.get(0).getUser_email());

				log.info("@# 성공" + dtos.get(0).getUser_email() );
				
				return "/passwordResetI";
			}else {
				log.info("@# 실패 ㅠㅠ");
				httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
				httpServletRequest.setAttribute("url", "/findPasswordIndividual");
				return "/alert";
			}
		}
		
	}
	
	//(기회원) 비밀번호찾기 정보 입력
	@RequestMapping("/findPWC")
	public String findPWC(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest httpServletRequest)
	{
		
		log.info("@# findPWI");
		ArrayList<LoginDTO> dtos = service.findPWC(param);
		log.info("@# dtos findPWC"+dtos);
		
		if (dtos.isEmpty()) {
			httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
			httpServletRequest.setAttribute("url", "/findPasswordCompany");
			return "/alert";
		}else {
			if (param.get("com_email").equals(dtos.get(0).getCom_email())
					&& param.get("com_name").equals(dtos.get(0).getCom_name()) 
					&& param.get("com_serial_number").equals(dtos.get(0).getCom_serial_number()) ) {
				
				model.addAttribute("comEmailP",dtos.get(0).getCom_email());
				
				log.info("@# 성공" + dtos.get(0).getCom_email() );
				
				return "/passwordResetC";
			}else {
				log.info("@# 실패 ㅠㅠ");
				httpServletRequest.setAttribute("msg", "없는 회원정보입니다. 확인해주세요");
				httpServletRequest.setAttribute("url", "/findPasswordCompany");
				return "/alert";
			}
		}
		
	}
	
	//(개인회원) 비밀번호 재설정
	@RequestMapping("/resetPWI")
	public String resetPWI(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# resetPWI");

		model.getAttribute("userEmailP");
		
		service.resetPWI(param);
		log.info("@# resetPWI param"+param);
		
		return "/login";
		
	}
	//(기업회원) 비밀번호 재설정
	@RequestMapping("/resetPWC")
	public String resetPWC(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# resetPWC");
		
		model.getAttribute("comEmailP");
		
		service.resetPWC(param);
		log.info("@# resetPWC param"+param);
		
		return "/login";
		
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest httpServletRequest) {
		log.info("@# logout");
		
		httpServletRequest.getSession().invalidate();
		return "/login";
	}
	
	
	//이메일찾기
	@RequestMapping("/findEmail")
	public String findEmail(Model model) 
	{
		log.info("@# findEmail");		
		
		return "/findEmail";
	}
	
	//비밀번호찾기
	@RequestMapping("/findPassword")
	public String findPassword(Model model) 
	{
		log.info("@# findPassword");		
		
		return "/findPassword";
	}
	
	//개인회원 이메일찾기
	@RequestMapping("/findEmailIndividual")
	public String findEmailIndividual(Model model) 
	{
		log.info("@# findEmailIndividual");		
		
		return "/findEmailIndividual";
	}
	
	//개인회원 비밀번호찾기
	@RequestMapping("/findPasswordIndividual")
	public String findPasswordIndividual(Model model) 
	{
		log.info("@# findPasswordIndividual");		
		
		return "/findPasswordIndividual";
	}
	
	//기업회원 이메일찾기
	@RequestMapping("/findEmailCompany")
	public String findEmailCompany(Model model) 
	{
		log.info("@# findEmailCompany");		
		
		return "/findEmailCompany";
	}
	
	//기업회원 비밀번호찾기
	@RequestMapping("/findPasswordCompany")
	public String findPasswordCompany(Model model) 
	{
		log.info("@# findPasswordCompany");		
		
		return "/findPasswordCompany";
	}
}
