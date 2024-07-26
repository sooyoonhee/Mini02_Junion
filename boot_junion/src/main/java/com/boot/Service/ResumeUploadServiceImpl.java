package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.ResumeUploadDAO;
import com.boot.DTO.ResumeUploadDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UploadService")
public class ResumeUploadServiceImpl implements ResumeUploadService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ResumeUploadDTO> resumeGetFileList(int resume_num) {
		log.info("@# 업로드서비스임플 getFileList");
		
		ResumeUploadDAO dao = sqlSession.getMapper(ResumeUploadDAO.class);
		
		return dao.resumeGetFileList(resume_num);
	}

	//폴더에 저장된 파일들 삭제
	@Override
	public void resumeDeleteFile(List<ResumeUploadDTO> fileList) {
		log.info("@# 업로드서비스임플 deleteFiles");
		log.info("@# 업로드서비스임플 fileList 값 =>"+fileList);
		
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
















