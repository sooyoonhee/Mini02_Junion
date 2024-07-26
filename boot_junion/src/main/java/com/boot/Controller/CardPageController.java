package com.boot.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DAO.CardPageDAO;
import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.CardPageDTO;
import com.boot.DTO.Standard;
import com.boot.Service.CardPageService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class CardPageController {// 카드 형태 목록 페이징 처리를 위한 컨트롤러
	
	@Autowired
	private CardPageService pageService;
	
	@RequestMapping("/cardPageList")
	public String cardPageList(Standard std,Model model) {
//	public String cardPageList(CardPageDAO dao,Model model) {
		log.info("@# cardPage controller");
		log.info("@# cardPage controller std!!=>"+std);
//		log.info("@# cardPage controller dao!!=>"+dao);
		
		ArrayList<ComNoticeDAO> list = pageService.cardPageList(std);
//		ArrayList<ComNoticeDAO> list = pageService.cardPageList(dao);
		model.addAttribute("jobPost", list);
//		int total = std.getPageNum();
		model.addAttribute("paging", new CardPageDTO(123, std));
		return "/recruitmentNotice/jobPostList";
	}
	

}
