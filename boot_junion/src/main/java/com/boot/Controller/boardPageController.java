package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.Criteria;
import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.boardPageDTO;
import com.boot.Service.boardBoardService;
import com.boot.Service.boardCommentService;
import com.boot.Service.boardPageService;
import com.boot.Service.boardUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class boardPageController {
	@Autowired
	private boardPageService service;
	
	@Autowired
	private boardBoardService boardservice;
	
//	@RequestMapping("/listWithPaging")
	@RequestMapping("/boardList")  
	public String listWithPaging(Criteria cri, Model model) {  // listWithPaging = 'list'로 담아서넘김 / getTotalCount + PageDTO = 'pageMaker'로 담아서넘김
		log.info("@# list");
		log.info("@# cri=>"+cri);

		
		ArrayList<boardBoardDTO> list = service.boardListWithPaging(cri);
//		int total = service.getTotalCount();
//		xml에 추가한 크리테리아 받기위해서 cri 넣어줌 (페이징 비어있는거 수정)
//		int total = service.getTotalCount();
		int total = service.boardGetTotalCount(cri);
		log.info("@# total=>"+total);
		
		model.addAttribute("boardList", list);  // BOARD DTO 보냄
//		model.addAttribute("pageMaker", new PageDTO(123, cri));
		model.addAttribute("pageMaker", new boardPageDTO(total, cri));  // PAGE DTO (토탈,CRI) 보냄
		
		
		
		return "boardListView";
	}
	
}
















