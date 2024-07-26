package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.Criteria;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardPageDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.Service.boardBoardService;
import com.boot.Service.boardPageService;
import com.boot.Service.comBoardBoardService;
import com.boot.Service.comBoardPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class comBoardPageController {
	@Autowired
	private comBoardPageService service;
	
	@Autowired
	private comBoardBoardService boardservice;
	
//	@RequestMapping("/boardCommunity")  
//	public String community(HttpServletRequest httpServletRequest, Model model) {
//
//	    HttpSession session = httpServletRequest.getSession(false); // false: 세션이 없으면 새로 생성하지 않음
//	    if (session == null) {
//	        // 세션이 없으면 로그인 페이지로 리다이렉트
//	        return "redirect:/login";
//	    }
//
//	    // 세션에서 "login_usertype" 속성을 가져오고, 타입을 String으로 변환
//	    Object userTypeObject = session.getAttribute("login_usertype");
//	    String userType = (userTypeObject != null) ? userTypeObject.toString() : null;
//
//	    log.info("@# session userType => " + userType);
//	    
//	    if ("1".equals(userType)) {
//	        return "redirect:/boardList";
//	    } else if ("2".equals(userType))  	{
//	        return "redirect:/comBoardList";
//	    } else {
//	        return "redirect:/login";
//	    }
//	}
	
	
	
	
	
//	@RequestMapping("/listWithPaging")
	@RequestMapping("/comBoardList")  
	public String listWithPaging(Criteria cri, Model model,  comBoardBoardDTO boardDTO, HttpServletRequest httpServletRequest) {  // listWithPaging = 'list'로 담아서넘김 / getTotalCount + PageDTO = 'pageMaker'로 담아서넘김
		log.info("@# list");
		log.info("@# cri=>"+cri);

		
		
		
		ArrayList<comBoardBoardDTO> list = service.boardListWithPaging(cri);
//		int total = service.getTotalCount();
//		xml에 추가한 크리테리아 받기위해서 cri 넣어줌 (페이징 비어있는거 수정)
//		int total = service.getTotalCount();
		int total = service.boardGetTotalCount(cri);
		log.info("@# total=>"+total);
		
		model.addAttribute("boardList", list);  // BOARD DTO 보냄
//		model.addAttribute("pageMaker", new PageDTO(123, cri));
		model.addAttribute("pageMaker", new boardPageDTO(total, cri));  // PAGE DTO (토탈,CRI) 보냄
		
//		int checkLike = boardservice.checkLike(boardDTO);
//		model.addAttribute("checkLike", checkLike);
		
		
		return "comBoardListView";
	}
	
}
















