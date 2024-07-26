package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.Criteria;
import com.boot.DTO.Criteria2;
import com.boot.DTO.PageDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.Service.PageService;
import com.boot.Service.ResumeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PageController {
	
	@Autowired
	ResumeService resumeService;
	
	@Autowired
	private PageService service;
	
	// 게시판 목록 조회
//	@RequestMapping("/listWithPaging")
	@RequestMapping("/resumeList")
	public String listWithPaging(Model model, Criteria2 cri2, HttpServletRequest request) 
	{
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
		
		log.info("@# user_email=>"+user_email);
		
		ArrayList<ResumeDTO> resumeList = service.listWithPaging(cri2, request);		
//		ArrayList<ResumeDTO> resumeList = service.listWithPaging(cri,user_email);		
		int total = service.getTotalCount(user_email);
		log.info("@# total=>"+total);
		
		log.info("@# resumeList=>" + resumeList);
		log.info("@# cri2=>"+cri2);		
		
		
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("pageMaker", new PageDTO(total,cri2));			
						
		
		
		return "resumeList";
	}
}
