package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.ComNoticeDAO;
import com.boot.DAO.recentNoticeDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("recentNoticeService")
public class recentNoticeServiceImpl implements recentNoticeService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String getRecentNoticeArr(String user_email) {//개인회원 정보에 저장된 최근본 공고 arr 가져오기
		recentNoticeDAO dao = sqlSession.getMapper(recentNoticeDAO.class);
		String recent_noticeNumArr = dao.getRecentNoticeArr(user_email);
		log.info("@# getRecentNoticeArr recent_noticeNumArr=>"+recent_noticeNumArr);	
		
		return recent_noticeNumArr;
	}
	
	@Override
	public ComNoticeDTO getRecentNotice(int noticeNum) {//공고번호로 공고조회하기
		recentNoticeDAO dao = sqlSession.getMapper(recentNoticeDAO.class);
		ComNoticeDTO dto = dao.getRecentNotice(noticeNum);
		log.info("@# getRecentNotice dto=>"+dto);
		
		return dto;
	}
	
	

	@Override
	public ArrayList<ComNoticeDTO> getRecentNoticeList(String recent_noticeNumArr) {//최근본 채용공고 목록 보기
		
		// 쉼표로 구분된 문자열을 정수 리스트로 변환
		List<Integer> noticeArr = Arrays.stream(recent_noticeNumArr.split(","))
				.map(String::trim)          // 각 문자열의 양쪽 공백 제거
				.map(Integer::parseInt)     // 문자열을 정수로 변환
				.collect(Collectors.toList());
		log.info("@# getRecentNoticeList noticeArr=>"+noticeArr);
		
		
		// noticeArr 번호를 하나하나씩 넣어서 쿼리 실행
		ArrayList<ComNoticeDTO> list = new ArrayList<>();
		
		recentNoticeDAO dao = sqlSession.getMapper(recentNoticeDAO.class);
		
		 for (int noticeNum : noticeArr) {
	            ComNoticeDTO dto = dao.getRecentNotice(noticeNum);
	            list.add(dto);
			log.info("@# getRecentNoticeList list=>"+list);
	     }
		 
//		for (int i=0; i<noticeArr.size(); i++) {
//			ComNoticeDTO dto = dao.getRecentNotice(noticeArr.get(i));
//			list.add(dto);
//			log.info("@# getRecentNoticeList list=>"+list);
//		}
		

		
		return list;
	}



	



	
	
	

	
//	@Override
//	public ArrayList<ComNoticeDTO> JobPostCard() {//채용정보 목록 불러오기
//		log.info("@# JobPostServiceImpl JobPostCard");
//		
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		ArrayList<ComNoticeDTO> dto = dao.JobPostCard();
//		
////		 log.info("@# JobPostCard =>"+dto);
//		
//		return dto;
////		return null;
//	}
//	
//
//	public ArrayList<ComNoticeDTO> JobPostCard(String user_email) {//채용정보 목록 불러오기
//		log.info("@# JobPostServiceImpl JobPostCard");
//		
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		ArrayList<ComNoticeDTO> dto = dao.JobPostCard();
//		
////		 log.info("@# JobPostCard =>"+dto);
//		
//		return dto;
////		return null;
//	}
//	
//	public ComNoticeDTO JobPost(int notice_num) {//채용공고 상세
//		log.info("@# JobPostServiceImpl JobPost!!!");
//		
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		ComNoticeDTO dto = dao.JobPost(notice_num);
//		
//		return dto;
//	}
//	
//	public String comLocation(String com_email){//상세 채용공고-회사 위치 가져오기
//
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		String com_location = dao.comLocation(com_email);
//		
//		return com_location;
//	}
//	
//	
//	
////	지수
//
//	
//	@Override
//	public void registerNotice(ComNoticeDTO comNoticeDTO) {
//		log.info("@# ComNoticeServiceImpl list registerNotice");
//		
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		dao.registerNotice(comNoticeDTO);
//
//		log.info("@# comNoticeDTO=>"+comNoticeDTO);
//		
////		첨부파일 있는지 체크
//		log.info("@# comNoticeDTO.getComNoticeAttachList()=>"+comNoticeDTO.getComNoticeAttachList());
//		if (comNoticeDTO.getComNoticeAttachList() == null || comNoticeDTO.getComNoticeAttachList().size() == 0) {
//			log.info("@# null");
//			return;
//		}
//		
////		첨부파일이 있는 경우 처리
//		comNoticeDTO.getComNoticeAttachList().forEach(attach -> {
//			attach.setNotice_num(comNoticeDTO.getNotice_num());
//			dao.registInsertFile(attach);
//		});
//		
//		updateNoticeNums(comNoticeDTO.getCom_email());
//	}
//	
//	@Override
//    public void updateNoticeNums(String com_email) {
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//        // com_email로 notice_num을 조회
//        List<Integer> noticeNums = dao.getNoticeNums(com_email);
//
//        // notice_num 리스트를 콤마로 구분된 문자열로 변환
//        String noticeNumsStr = noticeNums.stream()
//                                         .map(String::valueOf)
//                                         .collect(Collectors.joining(","));
//
//        // com_tb 테이블에 업데이트
//        dao.updateNoticeNums(com_email, noticeNumsStr);
//    }
//	
//	
//	
//	//파일 업로드
//	@Override
//	public List<ComNoticeAttachDTO> registGetFileList(int notice_num) {
//		log.info("@# ComNoticeServiceImpl registGetFileList");
//		
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		
//		return dao.registGetFileList(notice_num);
//	}
//
//	@Override
//	public void registDeleteFile(List<ComNoticeAttachDTO> fileList) {
//		log.info("@# ComNoticeServiceImpl deleteFiles");
//		log.info("@# ComNoticeServiceImpl fileList 값 =>"+fileList);
//		
//		if (fileList == null || fileList.size() == 0) {
//			return;
//		}
//		
//		fileList.forEach(attach -> {
//			try {
//				Path file = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\"
//											 +attach.getUuid()+"_"+attach.getFileName());
//				Files.deleteIfExists(file);
//				
//				if (Files.probeContentType(file).startsWith("image")) {
//					Path thumbNail = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\s_"
//							+attach.getUuid()+"_"+attach.getFileName());
//					Files.delete(thumbNail);
//				}
//			} catch (Exception e) {
//				log.error("delete file error"+e.getMessage());
//			}
//		});//end of forEach
//	}
//
//	


}
