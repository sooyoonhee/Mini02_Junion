package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.DTO.boardCommentDTO;
import com.boot.Service.boardCommentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/boardComment")
public class boardCommentController {
	//서비스단
	@Autowired
	private boardCommentService service;
	
	@PostMapping("/boardSave")  // save, findAll 을 'commentList' 에 담고 넘어감
//	public ArrayList<CommentDTO> save(@RequestParam HashMap<String, String> param) {
	public @ResponseBody ArrayList<boardCommentDTO> boardSave(@RequestParam HashMap<String, String> param, HttpServletRequest httpServletRequest, Model model) {
		log.info("@# save");
		log.info("@# param=>"+param);
		
		service.boardSave(param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<boardCommentDTO> commentList = service.boardFindAll(param);
		
		HttpSession session = httpServletRequest.getSession();
		session.getAttribute("login_email");
		model.addAttribute("login_email",session.getAttribute("login_email"));
		
		return commentList;
	}
}











