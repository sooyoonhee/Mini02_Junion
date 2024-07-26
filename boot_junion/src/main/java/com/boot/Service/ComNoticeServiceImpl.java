package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SubmitDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("JobPostService")
public class ComNoticeServiceImpl implements ComNoticeService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ComNoticeDTO> JobPostCard() {//채용정보 목록 불러오기
		log.info("@# JobPostServiceImpl JobPostCard");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ArrayList<ComNoticeDTO> dto = dao.JobPostCard();
		
//		 log.info("@# JobPostCard =>"+dto);
		
		return dto;
//		return null;
	}
	
	public void hitUP(int notice_num){//채용공고 선택시 조회수 증가
		log.info("hitUP!!!");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.hitUP(notice_num);
	}
	
	
	public ComNoticeDTO JobPost(int notice_num) {//채용공고 상세
		log.info("@# JobPostServiceImpl JobPost!!!");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ComNoticeDTO dto = dao.JobPost(notice_num);
		
		return dto;
	}
	
	public String comLocation(String com_email){//상세 채용공고-회사 위치 가져오기

		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		String com_location = dao.comLocation(com_email);
		
		return com_location;
	}
	
	public ComNoticeDTO getNoticeInfo(int notice_num) {//지원하기 클릭, 공고 정보 가져오기
	
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ComNoticeDTO dto = dao.getNoticeInfo(notice_num);
		
		return dto;
	}
	
	public ArrayList<ResumeDTO> getProfileList(String user_email){//지원하기 클릭, 이력서 정보 가져오기

		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ArrayList<ResumeDTO> dto = dao.getProfileList(user_email);
		
		return dto;
	}
	
//	public ArrayList<ComNoticeDTO> getNoticeNum(HashMap<String, String> param){//이력서 선택, 지원 완료시 공고 테이블에 이력서 배열값 가져오기
//	
//		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//	}
//	public boolean insertResumNum(HashMap<String, String> param){//이력서 선택, 지원 완료시 공고 테이블에 이력서 번호 추가
		public void insertResumNum(HashMap<String, String> param){//이력서 선택, 지원 완료시 공고 테이블에 이력서 번호 추가

		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.insertResumNum(param);
		
//		int notice_num = Integer.parseInt(param.get("notice_num"));
//		ArrayList<ComNoticeDTO> dto = dao.getResumeNum(notice_num);
//		String resume_num = param.get("resume_num");
//		boolean check = false;
		
//		if(dto.size()>0) {
//			for (int i = 0; i < dto.size(); i++) {
//				String splitResume = dto.get(i).getResume_num();
//				String[] value = splitResume.split(",");
//				for (String resumeValue : value) {
//					if(resume_num.equals(resumeValue)) {
//						check = true;
//						break;
//					}
//						
//				}
//				if (check) {
//				break;	
//				}
//			}
//		}
//		
//		if(!check) {
//			if (dto.size()>0) {
//				ComNoticeDTO dtos = dto.get(0);
//				String num = dtos.getResume_num() +","+resume_num;
//				param.put("resume_num", num);
//				log.info("Updated resumes: {}",  num);
//			}
//		dao.insertResumNum(param);
//		log.info("된건가?");
//		return true;
//		}
//		log.info("됐니?");
//		return false;
	}
		
	
	@Override
	public void updateSubmitData(SubmitDTO submitDTO){//이력서지원정보 저장
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.updateSubmitData(submitDTO);
	}
	
	
	
	
//	지수

	
	@Override
	public void registerNotice(ComNoticeDTO comNoticeDTO) {
		log.info("@# ComNoticeServiceImpl list registerNotice");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.registerNotice(comNoticeDTO);

		log.info("@# comNoticeDTO=>"+comNoticeDTO);
		
//		첨부파일 있는지 체크
		log.info("@# comNoticeDTO.getComNoticeAttachList()=>"+comNoticeDTO.getComNoticeAttachList());
		if (comNoticeDTO.getComNoticeAttachList() == null || comNoticeDTO.getComNoticeAttachList().size() == 0) {
			log.info("@# null");
			return;
		}
		
//		첨부파일이 있는 경우 처리
		comNoticeDTO.getComNoticeAttachList().forEach(attach -> {
			attach.setNotice_num(comNoticeDTO.getNotice_num());
			dao.registInsertFile(attach);
		});
		
	}
	
	@Override
	public void noticeInsertStack(ComNoticeDTO comNoticeDTO) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		
		String[] stackArray = comNoticeDTO.getStack().split(",");                               
	    for (String stack : stackArray) {
	        comNoticeDTO.setStackValue(stack); // 각각의 스택 값을 설정하는 메서드 추가
	        dao.noticeInsertStack(comNoticeDTO);
	    }
	}
	
	@Override
	public void noticeStauts(ComNoticeDTO comNoticeDTO) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.noticeStauts(comNoticeDTO);
	}

	
	//파일 업로드
	@Override
	public List<ComNoticeAttachDTO> registGetFileList(int notice_num) {
		log.info("@# ComNoticeServiceImpl registGetFileList");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		
		return dao.registGetFileList(notice_num);
	}

	@Override
	public void registDeleteFile(List<ComNoticeAttachDTO> fileList) {
		log.info("@# ComNoticeServiceImpl deleteFiles");
		log.info("@# ComNoticeServiceImpl fileList 값 =>"+fileList);
		
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\"
											 +attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\s_"
							+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		});//end of forEach
	}
	


}
