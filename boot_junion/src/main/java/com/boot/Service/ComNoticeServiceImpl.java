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
	
	public ComNoticeDTO getNoticeInfo(int notice_num) {//지원하기 클릭, 지원 팝업에 공고 정보 가져오기
	
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ComNoticeDTO dto = dao.getNoticeInfo(notice_num);
		
		return dto;
	}
	
	public ArrayList<ResumeDTO> getProfileList(String user_email){//지원하기 클릭, 지원 팝업에이력서 정보 가져오기

		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ArrayList<ResumeDTO> dto = dao.getProfileList(user_email);
		
		return dto;
	}
		
	
	@Override
//	public void updateSubmitData(SubmitDTO submitDTO){//이력서지원정보 저장
//		public void updateSubmitData(HashMap<String, String> param){//이력서지원정보 저장
		public boolean updateSubmitData(HashMap<String, String> param){//이력서지원정보 저장
		log.info("@# 이력서 배열 들고와서 비교 후 저장 처리 서비스!!!");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		dao.updateSubmitData(submitDTO);
		int notice_num= Integer.parseInt(param.get("notice_num"));
		ArrayList <SubmitDTO> list =  dao.getResumeNum(notice_num);
		String user_email = param.get("user_email");
		boolean result = false;
		
		if ( list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				if (user_email.equals(list.get(i).getUser_email())) {
					
					result = true;
//					break;
					return result;
				}
			}
			if (result = false) {
				dao.updateSubmitData(param);			
			}
		}else {
			dao.updateSubmitData(param);
		}
		
		return result;
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
		
		updateNoticeNums(comNoticeDTO.getCom_email());
	}
	
	@Override
    public void updateNoticeNums(String com_email) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
        // com_email로 notice_num을 조회
        List<Integer> noticeNums = dao.getNoticeNums(com_email);

        // notice_num 리스트를 콤마로 구분된 문자열로 변환
        String noticeNumsStr = noticeNums.stream()
                                         .map(String::valueOf)
                                         .collect(Collectors.joining(","));

        // com_tb 테이블에 업데이트
        dao.updateNoticeNums(com_email, noticeNumsStr);
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
