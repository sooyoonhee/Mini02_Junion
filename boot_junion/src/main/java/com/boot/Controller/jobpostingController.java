package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.jobpostingDTO;
import com.boot.Service.jobpostingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class jobpostingController {

	
	@Autowired
	private jobpostingService jobpostingService;
	
	// 채용공고 리스트
	@RequestMapping("/jobpostingList")
	public String jobpostingList(Model model, HttpServletRequest request) //jobpostingList
	{

		log.info("@# jobpostingList");	
		
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");  // @ 세션으로 이메일 값 받아와서 이메일에 맞는 공고만 출력
//		String login_email = "a@junion.com";  // @ 이메일 없으므로 임시로 지정해줌
		log.info("@# login_email=>"+login_email);
		ArrayList<jobpostingDTO> jobpostingList = jobpostingService.jobpostingList(login_email);
//		ArrayList<jobpostingDTO> jobpostingOnList = jobpostingService.jobpostingOnList(login_email);
//		ArrayList<jobpostingDTO> jobpostingOffList = jobpostingService.jobpostingOffList(login_email);
		model.addAttribute("jobpostingList",jobpostingList);	
//		model.addAttribute("jobpostingOnList",jobpostingOnList);	
//		model.addAttribute("jobpostingOffList",jobpostingOffList);	
		
		
        String notice_num = (String) session.getAttribute("notice_num");
        
        jobpostingDTO totalCount = jobpostingService.jobpostingTotalCount(login_email);
        model.addAttribute("totalCount", totalCount);
		log.info("@# login_email=>"+login_email);
		
		
        jobpostingDTO supportCount = jobpostingService.jobpostingSupportCount(notice_num);
        model.addAttribute("supportCount", supportCount);
		log.info("@# login_email=>"+notice_num);
		
	
		return "jobpostingList";
	}
	
	

    // 채용공고 삭제
    @RequestMapping("/jobpostingDelete")
    public String jobpostingDelete(HashMap<String, String> param, HttpServletRequest request) 
    {
		log.info("@# jobpostingDelete");		
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        log.info("@# ajaxMsg====>"+ajaxMsg);	
        for(int i=0; i<size; i++) {
        	jobpostingService.jobpostingDelete(ajaxMsg[i]);
        }
//		resumeService.resumeDelete(param);
        	
		return "redirect:jobpostingList";
    }
    

    // =============================  LIST 끝 ==========================


    

    // 채용공고 지원자 리스트
    @RequestMapping("/jobpostingSupport")
    public String jobpostingSupport(Model model, HttpServletRequest request) 
    {
		log.info("@# jobpostingSupport");	
		
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");  // @ 세션으로 이메일 값 가져옴
		String notice_num = (String)session.getAttribute("notice_num");  // @ 공고 넘버
//		String login_email = "a@junion.com";  // @ 이메일 없으므로 임시로 지정해줌
		log.info("@# login_email=>"+notice_num);
		ArrayList<jobpostingDTO> jobpostingSupport = jobpostingService.jobpostingSupport(null, notice_num);
		model.addAttribute("jobpostingSupport",jobpostingSupport);	
		
		
		ArrayList<jobpostingDTO> jobpostingList = jobpostingService.jobpostingList(login_email);
		model.addAttribute("jobpostingList",jobpostingList);	
		
		
		return "jobpostingSupport";
    }
    
    
    
    
    // 인재풀 리스트 (개인)
    @RequestMapping("/jobpostingIndividualSupport")
    public String jobpostingIndividualSupport(Model model, HttpServletRequest request) 
    {
    	log.info("@# jobpostingIndividualSupport");	
    	
    	// 세션에 이메일 담아서 쓰는 법
    	HttpSession session = request.getSession();		
//		String login_email = (String)session.getAttribute("login_email");
    	String notice_num = (String)session.getAttribute("notice_num"); 
    	String login_email = "a@junion.com";  // @ 이메일 없으므로 임시로 지정해줌  
    	log.info("@# notice_num=>"+notice_num);
    	ArrayList<jobpostingDTO> jobpostingIndividualSupport = jobpostingService.jobpostingSupport(null, notice_num);  // 전체로 공개하기때문에 이메일값 null
    	model.addAttribute("jobpostingIndividualSupport",jobpostingIndividualSupport);	
    	
    	

    	return "jobpostingIndividualSupport";
    }
    // =============================  SUPPORT 끝  ==========================
    
    
    // 채용공고 지원자 포지션제안 Insert
    @RequestMapping("/jobpostingOffer")
    public String jobpostingOffer(jobpostingDTO jobpostingDTO) 
    {

    	jobpostingService.jobpostingOffer(jobpostingDTO);
    	
  
    	return "redirect:jobpostingSupport";
    }
    // =============================  Offer 끝  ==========================

    
}
