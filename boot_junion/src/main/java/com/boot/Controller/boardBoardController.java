package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardCommentDTO;
import com.boot.Service.boardBoardService;
import com.boot.Service.boardCommentService;
import com.boot.Service.boardUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class boardBoardController {
	@Autowired
	private boardBoardService service;
	
	@Autowired
	private boardCommentService commentService;

	@Autowired
	private boardUploadService uploadService;
	
//	@RequestMapping("/list") 
//	@RequestMapping("/list_old") // 안쓰는 것 같은데 나주엥 확인하기
//	public String list(Model model) {
//		log.info("@# list");
//		
//		ArrayList<BoardDTO> list = service.list();
//		model.addAttribute("list", list);
//		
//		return "board_list_view";
//	}
	

	
	
	@RequestMapping("/boardWrite")
//	public String write(@RequestParam HashMap<String, String> param) {
	public String boardWrite(boardBoardDTO boardDTO) {
		log.info("@# 보드컨트롤러 boardWrite");
		log.info("@# 보드컨트롤러 boardDTO=>"+boardDTO);
		
		if (boardDTO.getAttachList() != null) {
			boardDTO.getAttachList().forEach(attach -> log.info("@# 보드컨트롤러 write / attach 호출=>"+attach));
		}
		
//		service.write(param);
		service.boardWrite(boardDTO);
		
		return "redirect:boardList";
	}
	
	@RequestMapping("/boardWriteView")
	public String boardWriteView() {
		log.info("@# boardWriteView");
		
		return "boardWriteView";
	}
	
	
	
	@RequestMapping("/boardDetailView")  // content_view 사용하지만 글 눌렀을때 이쪽타고 '글 상세보기' 보여줌
	public String boardDetailView(@RequestParam HashMap<String, String> param, Model model, boardBoardDTO boardDTO) {
		log.info("@# 보드컨트롤러  boardDetailView");
		
		int hitcount = service.hitcount(boardDTO);
		model.addAttribute("hitcount", hitcount);
		
		boardBoardDTO dto = service.boardDetailView(param);
		model.addAttribute("boardDetailView", dto);
		
		
//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
//		model.addAttribute("hitcount",hit)
		
		
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<boardCommentDTO> commentList = commentService.boardFindAll(param);
		model.addAttribute("commentList", commentList);
		
		return "boardDetailView";
	}
	
	
	@RequestMapping("/boardModifyView")  // content_view 사용하지만 글 눌렀을때 이쪽타고 '글 상세보기' 보여줌
	public String boardModifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# 보드컨트롤러  boardModifyView");
		
		boardBoardDTO dto = service.boardModifyView(param);
		model.addAttribute("boardModifyView", dto);
		
//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<boardCommentDTO> commentList = commentService.boardFindAll(param);
		model.addAttribute("commentList", commentList);
		
		return "boardModifyView";
	}
	
	
	
	
	@RequestMapping("/boardModify")
//	public String modify(@RequestParam HashMap<String, String> param) {
	public String boardModify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr ) {
		log.info("@# boardModify");
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
		
		
		return "redirect:boardList";
	}
	
	@RequestMapping("/boardDelete")
//	public String delete(@RequestParam HashMap<String, String> param) {
	public String boardDelete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# boardDelete");
		log.info("@# param=>"+param);
		log.info("@# board_no=>"+param.get("board_no"));
		
		List<boardAttachDTO> fileList = uploadService.boardGetFileList(Integer.parseInt(param.get("board_no")));
		log.info("@# fileList=>"+fileList);
		
		service.boardDelete(param);
		uploadService.boardDeleteFile(fileList);
		
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		
		return "redirect:boardList";
	}
	
	
	
	
}
















