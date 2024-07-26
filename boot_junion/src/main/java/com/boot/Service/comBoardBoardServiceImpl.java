package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DAO.comBoardAttachDAO;
import com.boot.DAO.comBoardBoardDAO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("comBoardBoardService")
public class comBoardBoardServiceImpl implements comBoardBoardService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<comBoardBoardDTO> boardList() {  // service에 있는 list 가져와서 오버라이드함
		log.info("@# 보드서비스임플 list");
		
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class);  // session으로 불러온 BoardDao.class값을 dao에 집어넣음 
		ArrayList<comBoardBoardDTO> list=dao.boardList();  // dao값을 배열boardDTO 'list' 에 집어넣음 
		
		return list;
	}

	@Override
//	public void write(HashMap<String, String> param) {
//	파일업로드는 파라미터를 DTO 사용
	public void boardWrite(comBoardBoardDTO boardDTO) {
		
		log.info("@# 보드서비스임플 write");
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class); 
//		dao.write(param);
		dao.boardWrite(boardDTO);
		log.info("@# 보드서비스임플 boardDTO=>"+boardDTO);
		
		log.info("@# 보드서비스임플 boardDTO.getAttachList()=>"+boardDTO.getAttachList());
		comBoardAttachDAO adao = sqlSession.getMapper(comBoardAttachDAO.class);  // 파일추가 adao
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
	public comBoardBoardDTO boardDetailView(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 detailView");
		
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class);  // 'dao' 에  sqlSession.getMapper( BodarDAO.class)를 담는다.
		comBoardBoardDTO dto = dao.boardDetailView(param);  // dao.contentView(param)값을 dto에 담는다.
		
		return dto;
	}
	
	
	@Override
	public comBoardBoardDTO boardModifyView(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 boardModifyView");
		
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class);  // 'dao' 에  sqlSession.getMapper( BodarDAO.class)를 담는다.
		comBoardBoardDTO dto = dao.boardModifyView(param);  // dao.contentView(param)값을 dto에 담는다.
		
		return dto;
	}
	
	

	@Override
	public void boardModify(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 modify");
		log.info("@# BoardServiceImpl modify");
		
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class);
		dao.boardModify(param);
	}

	
	
	@Override
	public void boardDelete(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 delete");
		log.info("@# param=>"+param);
		
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class);
		comBoardAttachDAO attachDAO = sqlSession.getMapper(comBoardAttachDAO.class);
		
		
		dao.boardDelete(param);
		attachDAO.boardDeleteFile(param.get("board_no"));  // deleteFile에 param에서 구한 "boardNo"값을 넣어준다
	}

	@Override
	public int hitcount(comBoardBoardDTO boardDTO) {
		comBoardBoardDAO dao = sqlSession.getMapper(comBoardBoardDAO.class); 
		return dao.hitcount(boardDTO);
		
	}

    @Autowired
    private comBoardBoardDAO boardDao;

    @Transactional
    @Override
    public int checkLike(int board_no, String user_email) {
        // DAO 계층의 checkLike 메서드를 호출하여 좋아요가 이미 존재하는지 확인
        return boardDao.checkLike(board_no, user_email);
    }

    @Transactional
    @Override
    public void insertLike(int board_no, String user_email) {
        // DAO 계층의 insertLike 메서드를 호출하여 좋아요를 추가
        boardDao.insertLike(board_no, user_email);
    }

}







