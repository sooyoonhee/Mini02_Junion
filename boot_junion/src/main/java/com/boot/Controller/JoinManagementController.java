package com.boot.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.NoticeDTO;
import com.boot.Service.JoinManagementService;
import com.boot.Service.JoinService;
import com.boot.Service.LoginService;
import com.boot.Service.ResumeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JoinManagementController {
	
	@Autowired
	ResumeService resumeService;	
	@Autowired
	private JoinService joinService;	
	@Autowired
	private LoginService loginService;
	@Autowired
	private JoinManagementService joinManagementService;
	
//	// 개인 - 입사지원관리
//	@RequestMapping("/joinManagementList2")
//	public String joinManagementList(Model model, HttpServletRequest request, String noticeCheck, String user_email) 
//	{
//		log.info("@# joinManagementList2");
//		// 세션에 이메일 담아서 쓰는 법
//		HttpSession session = request.getSession();		
//		user_email = (String)session.getAttribute("login_email");	
//		ArrayList<NoticeDTO> noticeDTO = joinManagementService.joinManagementList(user_email);
////		NoticeDTO noticeDTO2 = joinManagementService.joinManagementList2(login_email);
//		log.info("@# noticeDTO==>"+noticeDTO);
//		int total = joinManagementService.TotalJoinManagementNum(user_email, noticeCheck);
//		int check = joinManagementService.CheckJoinManagementNum(user_email, noticeCheck);
//		int uncheck = joinManagementService.UnCheckJoinManagementNum(user_email, noticeCheck);
//		
//		model.addAttribute("joinManagementList",noticeDTO);	
//		model.addAttribute("total",total);	
//		model.addAttribute("check",check);	
//		model.addAttribute("uncheck",uncheck);	
//		
//		
//		return "joinManagementList";
//	}
	
//	// 입사지원관리 - 공고상태
//	@RequestMapping("/noticeStatus")
//	public String noticeStatus(String noticeCheck,  String notice_status, String user_email, Model model, HttpServletRequest request) 
//	{
//		log.info("@# noticeStatus");			
//		HttpSession session = request.getSession();		
//		user_email = (String)session.getAttribute("login_email");	
//		
//		model.addAttribute("notice_status",notice_status);		
//		model.addAttribute("noticeCheck",noticeCheck);		
//		ArrayList<NoticeDTO> noticeDTO = joinManagementService.notice_status(noticeCheck, notice_status, user_email);
//		
//		int total = joinManagementService.TotalJoinManagementNum(user_email, noticeCheck);
//		int check = joinManagementService.CheckJoinManagementNum(user_email, noticeCheck);
//		int uncheck = joinManagementService.UnCheckJoinManagementNum(user_email, noticeCheck);
//		
//		model.addAttribute("joinManagementList",noticeDTO);	
//		model.addAttribute("total",total);	
//		model.addAttribute("check",check);	
//		model.addAttribute("uncheck",uncheck);
//		
//		model.addAttribute("joinManagementList",noticeDTO);
//		log.info("@# noticeStatus noticeDTO ===>"+ noticeDTO);
//		
//        return "joinManagementList";
//	}	
	
	@RequestMapping("/cancelJoin")
	public String cancelJoin(String resume_num, HttpServletRequest request,RedirectAttributes rttr) 
//	public String resumeDelete(@RequestParam("deleteResume")String[]deleteResume, HashMap<String, String> param) 
	{
		log.info("@# cancelJoin");		
		
		
		String[] ajaxMsg = request.getParameterValues("valueArr");		
        int size = ajaxMsg.length;
        log.info("@# ajaxMsg====>"+ajaxMsg);	
        for(int i=0; i<size; i++) {
//        	joinManagementService.cancelJoin(param);
        	joinManagementService.cancelJoin(ajaxMsg[i]);
        }
//		resumeService.resumeDelete(param);
//        rttr.addAttribute("pageNum",param.get("pageNum"));
//		rttr.addAttribute("amount",param.get("amount"));	
		
		return "joinManagementList";
	}
	
}
