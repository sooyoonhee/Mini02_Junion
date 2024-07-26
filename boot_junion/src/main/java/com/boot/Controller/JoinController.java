package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.JoinDTO;
import com.boot.DTO.UserDTO;
import com.boot.Service.JoinService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	// 회원가입 선택 개인or기업
	@RequestMapping("/joinSelect")
	public String joinSelect() 
	{
		log.info("@# joinSelect");		
		
		return "joinSelect";
	}
	
	// 개인 1단계
	@RequestMapping("/joinIndividual")
	public String joinIndividual() 
	{
		log.info("@# joinIndividual");
		
		
		return "joinIndividual";
	}		

	
	// 중복 이메일 확인
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("user_email") String user_email) 
	{
		log.info("@# emailCheck");
		int result = joinService.emailCheck(user_email);
		
		return result;
	}
		
	// 가입확인
	@RequestMapping("/joinOk")
	public String joinOk(@RequestParam HashMap<String, String> param, Model model, RedirectAttributes redirectAttributes) 
	{
		log.info("@# joinOk");		
		
		log.info("@# param 1 : 날리기전 " + param);
		model.addAttribute("user_email", param.get("user_email"));		
		
		
		joinService.join(param);
		log.info("@# param 2 : 날린 후" + param);	
		
		String userEmail = param.get("user_email");
		redirectAttributes.addFlashAttribute("user_email", userEmail);
		
		log.info("@# userEmail===>" + userEmail);	
		
		return "redirect:joinIndividualTwo";
//		return null;
//		return "redirect:joinIndividualTwo?user_email=${user_email}";
	}
	
	// 가입확인
	@RequestMapping("/joinIndividualTwo")
	public String joinIndividualTwo(@RequestParam HashMap<String, String> param, Model model) 
//	public void joinIndividualTwo(@RequestParam HashMap<String, String> param) 
	{
		log.info("@# joinIndividualTwo로 넘어옴");		
		log.info("@# param3 2단계==>" + param);
//				model.addAttribute(null, param.);
		
		String userEmail = (String) model.getAttribute("user_email");
        log.info("@# userEmail===>" + userEmail);
        model.addAttribute("user_email", userEmail);
        
		// 플래시 속성에서 user_email 가져오기
        if (!model.containsAttribute("user_email")) {
            throw new IllegalArgumentException("Model has no value for key 'user_email'");
        }
        				
//		joinService.modify(param);		
		List<JoinDTO> stack = joinService.stack();		
		model.addAttribute("stack_name", stack);
		
		List<JoinDTO> stack2 = joinService.stack2();		
		model.addAttribute("stack_name2", stack2);
		
		List<JoinDTO> stack3 = joinService.stack3();		
		model.addAttribute("stack_name3", stack3);
		
		List<JoinDTO> job = joinService.job();		
		model.addAttribute("job_name", job);
		
		List<JoinDTO> job2 = joinService.job2();		
		model.addAttribute("job_name2", job2);
		
		List<JoinDTO> job3 = joinService.job3();		
		model.addAttribute("job_name3", job3);		
		
		return "joinIndividualTwo";
//		return "joinIndividualTwo";
	}
	
	@RequestMapping("/insertTwo")
	public String insertJob(@RequestParam String user_email, @RequestParam String job_name, @RequestParam String stack_name, 
							Model model, HttpServletRequest request) 
	{		
		log.info("@# insertJob로 넘어옴");		
		log.info("@# insertJob user_email==>" + user_email);
		log.info("@# insertJob job_name==>" + job_name);
		log.info("@# insertJob stack_name==>" + job_name);
		
		String arr [] = job_name.split(",");
		for(int i = 0; i<arr.length; i++) 
		{
			joinService.insertJob(user_email, arr[i]); 
		}
		
		String arr2 [] = stack_name.split(",");
		for(int i = 0; i<arr2.length; i++) 
		{
			joinService.insertStack(user_email, arr2[i]); 
		}		     
		
		return "redirect:login";
	}
			
	
	// ================ 기업 =============================
	
		// 기업 회원가입 페이지
		@RequestMapping("/joinCompany")
		public String joinCompany() 
		{
			log.info("@# joinCompany");
			
			
			return "joinCompany";
		}
		
		// 중복 이메일 확인
		@PostMapping("/emailComCheck")
		@ResponseBody
		public int emailComCheck(@RequestParam("com_email") String com_email) 
		{
			log.info("@# emailComCheck");
			int result = joinService.emailComCheck(com_email);
			
			return result;
		}
		
		// 중복 사업자번호 확인
		@PostMapping("/serialCheck")
		@ResponseBody
		public int serialCheck(@RequestParam("com_serial_number") String com_serial_number) 
		{
			log.info("@# serialCheck");
			int result = joinService.serialCheck(com_serial_number);
			
			return result;
		}
		
		// 기업 가입확인
		@RequestMapping("/joinCompanyOk")
		public String joinCompanyOk(@RequestParam HashMap<String, String> param, Model model) 
		{
			log.info("@# joinOk");		
			
			log.info("@# param 1 : 날리기전 " + param);
			model.addAttribute("com_email", param.get("com_email"));		
			
			joinService.joinCompany(param);
			log.info("@# param 2 : 날린 후" + param);		
				
			return "redirect:login";
//			return null;
//			return "redirect:joinIndividualTwo?user_email=${user_email}";
		}
	
	
	
	
}
