package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.Criteria;
import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.NoticeDTO;
import com.boot.DTO.PageDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.StarDTO;
import com.boot.DTO.JoinManagementPageDTO;
import com.boot.Service.JoinManagementPageService;
import com.boot.Service.JoinManagementService;
import com.boot.Service.PageService;
import com.boot.Service.ResumeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JoinManagementPageController {
		
	@Autowired
	private JoinManagementPageService joinManagementPageService;
	
	@Autowired
	private JoinManagementService joinManagementService;
	
	// 게시판 목록 조회
//	@RequestMapping("/listWithPaging")
	@RequestMapping("/joinManagementList")
	public String joinManagementPaging(Model model, JaewonCriteria cri3, HttpServletRequest request, String noticeCheck, String user_email) 
	{
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		user_email = (String)session.getAttribute("login_email");
		
		log.info("@# user_email=>"+user_email);
		
		ArrayList<NoticeDTO> noticeDTO = joinManagementPageService.joinManagementPaging(cri3, request);		
//		ArrayList<ResumeDTO> resumeList = service.listWithPaging(cri,user_email);		
		int total = joinManagementPageService.joinManagementGetTotalCount(user_email);
		log.info("@# total=>"+total);
		
		log.info("@# noticeDTO" + noticeDTO);
		log.info("@# cri3"+cri3);			

		log.info("@# noticeDTO==>"+noticeDTO);
		int total2 = joinManagementService.TotalJoinManagementNum(user_email, noticeCheck);
		int check = joinManagementService.CheckJoinManagementNum(user_email, noticeCheck);
		int uncheck = joinManagementService.UnCheckJoinManagementNum(user_email, noticeCheck);
		
			
		model.addAttribute("total",total2);	
		model.addAttribute("check",check);	
		model.addAttribute("uncheck",uncheck);			
		model.addAttribute("joinManagementList",noticeDTO);
		model.addAttribute("pageMaker", new JoinManagementPageDTO(total,cri3));			
		
		return "joinManagementList";
	}
	
	// 입사지원관리 - 공고상태
	@RequestMapping("/noticeStatus")
	public String noticeStatus2(String noticeCheck, JaewonCriteria cri3, String notice_status, String user_email, Model model, HttpServletRequest request) 
	{
		log.info("@# noticeStatus");			
		HttpSession session = request.getSession();		
		user_email = (String)session.getAttribute("login_email");	
		log.info("@# noticeStatus===>" + notice_status);
		log.info("@# noticeCheck===>" + noticeCheck);			
		int total = joinManagementPageService.joinManagementGetTotalCount(user_email);
		
		log.info("@# total===>" + total);
		log.info("@# total===>" + cri3);
		
		model.addAttribute("notice_status",notice_status);		
		model.addAttribute("noticeCheck",noticeCheck);		
		ArrayList<NoticeDTO> noticeDTO = joinManagementPageService.notice_status2(cri3,request);
		
		int total2 = joinManagementService.TotalJoinManagementNum(user_email, noticeCheck);
		int check = joinManagementService.CheckJoinManagementNum(user_email, noticeCheck);
		int uncheck = joinManagementService.UnCheckJoinManagementNum(user_email, noticeCheck);	
		
		model.addAttribute("total",total2);	
		model.addAttribute("check",check);	
		model.addAttribute("uncheck",uncheck);			
		model.addAttribute("joinManagementList",noticeDTO);
		model.addAttribute("pageMaker", new JoinManagementPageDTO(total,cri3));	
		log.info("@# noticeStatus noticeDTO ===>"+ noticeDTO);
		
        return "joinManagementList";
	}
	
	// 회사 평점 먹이는곳
	@RequestMapping("/comStar")
	public String comStar(String com_email, HttpServletRequest request, StarDTO stardto) 
	{
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");		
		stardto.setUser_email(user_email);
		
		String notice_num = stardto.getCom_email();
		log.info("@# noticeStatus notice_num ===>"+ notice_num);
		
		joinManagementPageService.comStar(stardto);
		
		return "redirect:joinManagementList";
	}
	
}
