package com.boot.Service;

import java.util.HashMap;
import java.util.List;

import com.boot.DTO.UserDTO;
import com.boot.DTO.UserJobDTO;
import com.boot.DTO.UserStackDTO;

public interface IndividualService {
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
