package com.boot.Service;

import java.util.List;

import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.comBoardAttachDTO;

public interface comBoardUploadService {
	public List<comBoardAttachDTO> boardGetFileList(int board_no);
	public void boardDeleteFile(List<comBoardAttachDTO> fileList);
}
