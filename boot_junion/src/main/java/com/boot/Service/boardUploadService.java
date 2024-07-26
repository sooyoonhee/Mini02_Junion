package com.boot.Service;

import java.util.List;

import com.boot.DTO.boardAttachDTO;

public interface boardUploadService {
	public List<boardAttachDTO> boardGetFileList(int board_no);
	public void boardDeleteFile(List<boardAttachDTO> fileList);
}
