package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DTO.boardBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("boardBoardService")
public class boardBoardServiceImpl implements boardBoardService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<boardBoardDTO> boardList() {  // service에 있는 list 가져와서 오버라이드함
		log.info("@# 보드서비스임플 list");
		
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class);  // session으로 불러온 BoardDao.class값을 dao에 집어넣음 
		ArrayList<boardBoardDTO> list=dao.boardList();  // dao값을 배열boardDTO 'list' 에 집어넣음 
		
		return list;
	}

	@Override
//	public void write(HashMap<String, String> param) {
//	파일업로드는 파라미터를 DTO 사용
	public void boardWrite(boardBoardDTO boardDTO) {
		
		log.info("@# 보드서비스임플 write");
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class); 
//		dao.write(param);
		dao.boardWrite(boardDTO);
		log.info("@# 보드서비스임플 boardDTO=>"+boardDTO);
		
		
		
		log.info("@# 보드서비스임플 boardDTO.getAttachList()=>"+boardDTO.getAttachList());
		boardAttachDAO adao = sqlSession.getMapper(boardAttachDAO.class);  // 파일추가 adao
//		첨부파일 있는지 체크
		if (boardDTO.getAttachList() == null || boardDTO.getAttachList().size() == 0) {
			log.info("@# null");
			return;
		}
		
//		첨부파일이 있는 경우 처리  // 첨부파일이 있는 경우에는 그 게시글와 boardNO로 일치하는 위치에 insertFile해준다.
		
		boardDTO.getAttachList().forEach(attach -> {   // boardDTO에 파일리스트에 반복문 실행, 'attach' 변수? 에 boardDTO 에 있는 getBoardNo를/'attach'에 setBoardNo를 사용하여 담는다
			attach.setBoard_no(boardDTO.getBoard_no());
			
			adao.boardInsertFile(attach);  // ('adao.insertFile'(BoardAttachDAO 에 있는 객체?))에 'attach' 정보를 담는다
		});
	}

	
	

	@Override
	public boardBoardDTO boardDetailView(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 detailView");
		
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class);  // 'dao' 에  sqlSession.getMapper( BodarDAO.class)를 담는다.
		boardBoardDTO dto = dao.boardDetailView(param);  // dao.contentView(param)값을 dto에 담는다.
		
		return dto;
	}
	
	
	@Override
	public boardBoardDTO boardModifyView(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 detailView");
		
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class);  // 'dao' 에  sqlSession.getMapper( BodarDAO.class)를 담는다.
		boardBoardDTO dto = dao.boardModifyView(param);  // dao.contentView(param)값을 dto에 담는다.
		
		return dto;
	}
	
	

	@Override
	public void boardModify(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 modify");
		log.info("@# BoardServiceImpl modify");
		
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class);
		dao.boardModify(param);
	}

	
	
	@Override
	public void boardDelete(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 delete");
		log.info("@# param=>"+param);
		
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class);
		boardAttachDAO attachDAO = sqlSession.getMapper(boardAttachDAO.class);
		
		
		dao.boardDelete(param);
		attachDAO.boardDeleteFile(param.get("board_no"));  // deleteFile에 param에서 구한 "boardNo"값을 넣어준다
	}

	@Override
	public int hitcount(boardBoardDTO boardDTO) {
		boardBoardDAO dao = sqlSession.getMapper(boardBoardDAO.class); 
		return dao.hitcount(boardDTO);
		
	}

//	@Override
//	public BoardDTO hitcount(HashMap<String, String> param) {
//		
//		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
//		BoardDTO dto = dao.hitcount(param);
//		
//		return dto;
//	}
	
}







