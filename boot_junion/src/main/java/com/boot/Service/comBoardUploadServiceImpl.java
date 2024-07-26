package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.comBoardAttachDAO;
import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.comBoardAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("comBoardUploadService")
public class comBoardUploadServiceImpl implements comBoardUploadService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<comBoardAttachDTO> boardGetFileList(int board_no) {
		log.info("@# 업로드서비스임플 getFileList");
		
		comBoardAttachDAO dao = sqlSession.getMapper(comBoardAttachDAO.class);
		
		return dao.boardGetFileList(board_no);
	}

	//폴더에 저장된 파일들 삭제
	@Override
	public void boardDeleteFile(List<comBoardAttachDTO> fileList) {
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
















