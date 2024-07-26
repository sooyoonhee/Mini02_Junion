package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.CompanyAttachDTO;


//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CompanyAttachDAO {
//	파일 업로드는 파라미터를 DTO 사용
	public void comInfoInsertFile(CompanyAttachDTO vo);// value object
	public List<CompanyAttachDTO> comInfoGetFileList(String com_emial);
	public void comInfoDeleteFile(String com_emial);
	
}
