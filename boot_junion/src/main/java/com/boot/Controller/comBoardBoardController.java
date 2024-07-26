package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.comBoardAttachDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.comBoardCommentDTO;
import com.boot.Service.boardBoardService;
import com.boot.Service.boardCommentService;
import com.boot.Service.boardUploadService;
import com.boot.Service.comBoardBoardService;
import com.boot.Service.comBoardCommentService;
import com.boot.Service.comBoardUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class comBoardBoardController {
	@Autowired
	private comBoardBoardService service;
	
	@Autowired
	private comBoardCommentService commentService;

	@Autowired
	private comBoardUploadService uploadService;
	
	
	@RequestMapping("/comBoardWrite")
//	public String write(@RequestParam HashMap<String, String> param) {
	public String boardWrite(comBoardBoardDTO boardDTO) {
		log.info("@# 보드컨트롤러 comBoardWrite");
		log.info("@# 보드컨트롤러 comBoardDTO=>"+boardDTO);
		
		if (boardDTO.getAttachList() != null) {
			boardDTO.getAttachList().forEach(attach -> log.info("@# 보드컨트롤러 write / attach 호출=>"+attach));
		}
		
//		service.write(param);a
		service.boardWrite(boardDTO);
		
		
//		
//	  HttpSession session = httpServletRequesth.getSession();
//      session.getAttribute("login_email");
//      log.info("@# session  =>"+(String) session.getAttribute("login_email"));
//      
//      model.addAttribute("logim_email",session.getAttribute("login_email"));
		
		return "redirect:comBoardList";
	}
	
	@RequestMapping("/comBoardWriteView")
	public String boardWriteView(HttpServletRequest httpServletRequest, Model model) {
		log.info("@# comBoardWriteView");
		
		  HttpSession session = httpServletRequest.getSession();
	      session.getAttribute("login_email");
	      log.info("@# session  =>"+(String) session.getAttribute("login_email"));
	      
	      model.addAttribute("logim_email",session.getAttribute("login_email"));
	      
	      
	      
		return "comBoardWriteView";
	}
	
	
	
	@RequestMapping("/comBoardDetailView")  // content_view 사용하지만 글 눌렀을때 이쪽타고 '글 상세보기' 보여줌
	public String boardDetailView(@RequestParam HashMap<String, String> param, Model model, comBoardBoardDTO boardDTO, HttpServletRequest httpServletRequesth) {
		log.info("@# 보드컨트롤러  comBoardDetailView");
		
		int hitcount = service.hitcount(boardDTO);
		model.addAttribute("hitcount", hitcount);

		comBoardBoardDTO dto = service.boardDetailView(param);
		model.addAttribute("boardDetailView", dto);
		
		
//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
		
		
		
		
		
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<comBoardCommentDTO> commentList = commentService.boardFindAll(param);
		model.addAttribute("commentList", commentList);
		
		
		 HttpSession session = httpServletRequesth.getSession();
		 session.getAttribute("login_email");
		 log.info("@# session  =>"+(String) session.getAttribute("login_email"));
		  
		 model.addAttribute("login_email",session.getAttribute("login_email"));
		
		return "comBoardDetailView";
	}
	
	
	@RequestMapping("/comBoardModifyView")  
	public String boardModifyView(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest httpServletRequesth) {
		log.info("@# 보드컨트롤러  comBoardModifyView");
		
		comBoardBoardDTO dto = service.boardModifyView(param);
		model.addAttribute("boardModifyView", dto);
		
//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<comBoardCommentDTO> commentList = commentService.boardFindAll(param);
		model.addAttribute("commentList", commentList);
		
	  HttpSession session = httpServletRequesth.getSession();
      session.getAttribute("login_email");
      log.info("@# session  =>"+(String) session.getAttribute("login_email"));
      
      model.addAttribute("login_email",session.getAttribute("login_email"));
		
		return "comBoardModifyView";
	}
	
	
	
	
	@RequestMapping("/comBoardModify")
//	public String modify(@RequestParam HashMap<String, String> param) {
	public String boardModify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr ) {
		log.info("@# comBoardModify");
		log.info("@# param=>"+param);
		
		
		service.boardModify(param);
		
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		

		//if (boardDTO.getAttachList() != null) {
			//boardDTO.getAttachList().forEach(attach -> log.info("@# 보드컨트롤러 write / attach 호출=>"+attach));
		//}
		
//		service.write(param);
		//service.modify(param, boardDTO);
		
		
		return "redirect:comBoardList";
	}
	
	@RequestMapping("/comBoardDelete")
//	public String delete(@RequestParam HashMap<String, String> param) {
	public String boardDelete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# comBoardDelete");
		log.info("@# param=>"+param);
		log.info("@# board_no=>"+param.get("board_no"));
		
		List<comBoardAttachDTO> fileList = uploadService.boardGetFileList(Integer.parseInt(param.get("board_no")));
		log.info("@# fileList=>"+fileList);
		
		service.boardDelete(param);
		uploadService.boardDeleteFile(fileList);
		
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		
		return "redirect:comBoardList";
	}



	// 추천기능 구현
    @RequestMapping(value = "/comBoardLike", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> addLike(@RequestParam("board_no") int board_no, @RequestParam("com_email") String com_email) {
        int likeCount = service.checkLike(board_no, com_email);
        if (likeCount == 0) {
        	service.insertLike(board_no, com_email);
            return ResponseEntity.ok().body("추천되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("이미 추천을 누른 글입니다.");
        }
    }
	
}
















