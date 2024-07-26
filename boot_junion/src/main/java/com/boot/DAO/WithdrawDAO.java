package com.boot.DAO;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WithdrawDAO {

//		public ArrayList<UserDTO> getUserInfo(HashMap<String, String> param);
//		public ArrayList<CompanyInfoDTO> getComInfo(HashMap<String, String> param);
		public void withdrawIndi(HashMap<String, String> param);
		public void withdrawCom(HashMap<String, String> param);

}
