package com.boot.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScrapController {

	@RequestMapping("/scrapNotice")
	public void scrapNotice(HttpServletRequest request) {//스크랩 기능 구현 예정
		log.info("@#ScrapController scripNotice!");
		
		
	}
	
}
