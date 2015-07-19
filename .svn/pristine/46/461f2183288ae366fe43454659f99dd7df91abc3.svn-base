package com.cunitsystem.service;

import com.cunitsystem.entity.Student;
import com.cunitsystem.entity.Teacher;
import com.cunitsystem.entity.UserInfo;

public interface UserService {
	
	public UserInfo getUserInfoById(int userId);
	
	public String checkLoginName(String loginName);
	
	public boolean register(UserInfo user);
	
	public boolean checkCardId(String uNo,String paramter);
	
	public boolean updateUserInfo(Student stu,Teacher tea, int userType);
	
	public int updatePwd(UserInfo user);
	
	public String checkOldLoginPwd(String loginName);
}
