package com.boot.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.UserDTO;
import com.boot.DTO.UserJobDTO;
import com.boot.DTO.UserStackDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface IndividualDAO {
//	public ArrayList<UserDTO> list();
	public UserDTO getUserInfo(String user_email);
	public List<UserStackDTO> getUserStack(String user_email);
	public List<UserJobDTO> getUserJob(String user_email);
	
	
//	public UserDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
//	public void updateUserNoticeNum(String recentJobPostsStr, String user_email);
	public void updateUserNoticeNum(UserDTO userDTO);
//	public void delete(HashMap<String, String> param);

	
}
















