package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.Service.CompanyInfoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@RequestMapping("/main")
	public String main() {
		log.info("main!!!!!!");
//		String user_email ="tls123";
//		int user_type = 1;

//		HttpSession session = request.getSession();
//		LoginDTO dto = (LoginDTO) session.getAttribute("user_email");
//		return "login_ok";
		return "main";
	};
	
	@Autowired
	private CompanyInfoService infoService;
	
	@RequestMapping("/comList")
	public String comlist(HttpServletRequest request, Model model) {
		log.info("comList!!!!!!");
		
		ArrayList<CompanyInfoDTO> list = infoService.comList();
		model.addAttribute("comList", list);
		
		return "comList";
	};
	
	
	@RequestMapping("/comDetail")
	public String comDetail(String com_email, Model model) {//기업정보 상세
//		public String JobPost(int notice_num, Model model, @RequestParam HashMap<String, String> param) {//기업정보 상세
		log.info("comDetail");
		log.info("com_email!!!"+com_email);

		CompanyInfoDTO dto = infoService.companyInfo(com_email);
		model.addAttribute("company", dto);
		
		return "/comDetail";
	}
	
}
