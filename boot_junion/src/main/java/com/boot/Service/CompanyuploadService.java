package com.boot.Service;

import java.util.List;

import com.boot.DTO.CompanyAttachDTO;


public interface CompanyuploadService {
	
	public List<CompanyAttachDTO> comInfoGetFileList(String com_email); // String타입 com_email파라미터를 list타입 <ComRegisterUploadDTO> getFileList로 사용하려함 / 파일열람
	public void comInfoDeleteFile(List<CompanyAttachDTO> fileList);  // com_email 맞춰서 파일삭제로직 / 파일삭제
}
