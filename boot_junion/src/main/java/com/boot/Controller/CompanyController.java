package com.boot.Controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.JoinDTO;
import com.boot.Service.CompanyInfoService;
import com.boot.Service.JoinService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController {
	
	@Autowired
	private CompanyInfoService infoService;
	@Autowired
	private JoinService joinService;

	@RequestMapping("/companyMain")
	public String companyMain() {//기업 마이페이지 메인
		log.info("CompanyMain!!");
		
		return "/company/companyMain";
	}
	
	
	@RequestMapping("/companyInfoManagement")
	public String company_InfoManagement(HttpServletRequest request, Model model) throws Exception{//기업 정보 관리 메인
//		log.info("@# company_InfoManagement");
		log.info("@# companyInfoManagement");
		
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("login_email");
		
		CompanyInfoDTO dto = infoService.companyInfo(email);
		model.addAttribute("companyInfo", dto);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		/*
		 24.07.24 임하진
		 오류로 인해 임시 주석 처리함.
		if (dto.getCom_year() != null) {
			String year = dto.getCom_year();
			Date date = format.parse(year);
			LocalDate now = LocalDate.now();
			
			String getYear= format.format(date);
			model.addAttribute("year", getYear);
		}
		*/
		
//		return "company/company_InfoManagement"; 24.07.24 파일명, 경로 수정
		return "company/companyInfoManagement";
	}
	
	
	@RequestMapping("/companyInfoUpdate")
	public String Company_InfoUpdate(HttpServletRequest request, Model model) {//기업 정보 수정 페이지로 이동
//		log.info("@# company_InfoUpdate");		
		log.info("@# companyInfoUpdate");		
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("login_email");
		CompanyInfoDTO dto = infoService.InfoMini(email);
		model.addAttribute("companyInfo", dto);
		
//		return "company/company_InfoUpdate"; 24.07.24 파일명, 경로 수정
		return "company/companyInfoUpdate";
	}
	
	@RequestMapping("/modify_Info")
	public String modify_Info(@RequestParam HashMap<String, String> param) {//기업 기본 정보 수정
		log.info("@# modify_Info");
		log.info("@# param modify_Info=>"+param);
		
		infoService.modify_Info(param);
//		info.companyInfo(param.get);
//		return "redirect:company_InfoManagement";
		return "redirect:companyInfoManagement";
	}

	@RequestMapping("/companyPW")
	public String PWChange(HttpServletRequest request, Model model) {//비밀번호 변경 팝업
		log.info("@# companyPW open!!");
		
		HttpSession session = request.getSession();
		String login_pw = (String) session.getAttribute("login_pw");
		model.addAttribute("login_pw", login_pw);
		return "/company/companyPW";
	}
	
	@RequestMapping("/comPwChange")
	public void comPwChange(@RequestParam HashMap<String, String> param) {
		log.info("comPwChange");
		
	}
	
		
	@RequestMapping("/companyInfoDetailUpdate")
	public String company_InfoDetailUpdate(HttpServletRequest request, Model model){//기업 상세정보 수정 페이지로 이동
		log.info("@# company_InfoDetailUpdate");		
		
		HttpSession session = request.getSession();
		String com_email = (String)session.getAttribute("login_email");
		CompanyInfoDTO dto = infoService.companyInfoUpdate(com_email);
		model.addAttribute("companyInfo", dto);
		log.info("@# stack ==>" + dto);
				

		List<JoinDTO> stack = joinService.stack();		
		model.addAttribute("stack_name", stack);
		
		List<JoinDTO> stack2 = joinService.stack2();		
		model.addAttribute("stack_name2", stack2);
		
		List<JoinDTO> stack3 = joinService.stack3();		
		model.addAttribute("stack_name3", stack3);
		
		log.info("@# stack ==>" + stack);
		log.info("@# stack2 ==>" + stack2);
		log.info("@# stack3 ==>" + stack3);

		return "company/companyInfoDetailUpdate";
		
	}
	
	
	
	@RequestMapping("/modifyDetail")
	public String modify_Detail(@RequestParam HashMap<String, String> param, CompanyInfoDTO companyInfoDTO) {//기업 상세 정보 수정
		log.info("@# modify_Detail");
		log.info("@# param modify_Detail=>"+param);
		
		infoService.modify_Detail(param);
		
		if (companyInfoDTO.getCompanyAttachList() != null) {
			companyInfoDTO.getCompanyAttachList().forEach(attach -> log.info("@# attach=>"+attach));
		}

		infoService.modify_Detail(companyInfoDTO);
//		return "company/company_InfoManagement";
		return "redirect:companyInfoManagement";
	}
	
}
