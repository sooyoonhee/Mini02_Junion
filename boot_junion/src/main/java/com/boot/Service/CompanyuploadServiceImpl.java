package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.CompanyAttachDAO;
import com.boot.DTO.CompanyAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("uploadService")
public class CompanyuploadServiceImpl implements CompanyuploadService{
	@Autowired
	private SqlSession sqlSession;
	
	//파일 업로드
			@Override
			public List<CompanyAttachDTO> comInfoGetFileList(String com_email) {
				log.info("@# ComNoticeServiceImpl registGetFileList");
				
				CompanyAttachDAO dao = sqlSession.getMapper(CompanyAttachDAO.class);
				
				return dao.comInfoGetFileList(com_email);
			}

			@Override
			public void comInfoDeleteFile(List<CompanyAttachDTO> fileList) {
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
