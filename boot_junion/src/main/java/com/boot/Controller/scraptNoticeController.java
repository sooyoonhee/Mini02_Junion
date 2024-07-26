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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardCommentDTO;
import com.boot.Service.boardBoardService;
import com.boot.Service.boardCommentService;
import com.boot.Service.boardUploadService;
import com.boot.Service.scrapNoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class scraptNoticeController {
	@Autowired
	private scrapNoticeService service;
	
	@RequestMapping("/noticeScrap") //스크랩 공고
	public String noticeScrap(HttpServletRequest request, Model model) {
		log.info("@# noticeScrap");	
		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# noticeScrap  user_email=>"+user_email);	
		
		// 사용자정보의 최근본 채용공고 목록배열 가져오기
		String noticeScrapArray =service.getnNoticeScrapArray(user_email);
		log.info("@# noticeScrap noticeScrapArray=>"+noticeScrapArray);		
		
		// 사용자정보의 최근본 채용공고 목록 가져오기
		ArrayList<ComNoticeDTO> list =service.getScrapNoticList(noticeScrapArray);
		log.info("@# noticeScrap noticeScrapArray list=>"+list);		
				
		
		model.addAttribute("noticeList", list);
		
		
		return "individualNoticeScrap";
	}
	
	
	

	

	
	
}
















