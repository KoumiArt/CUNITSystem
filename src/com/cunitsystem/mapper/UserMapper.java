package com.cunitsystem.mapper;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.UserInfo;

/**
 * @author shy
 *
 * @param <T>
 */
@Component("userMapper")
public interface UserMapper {

	public UserInfo login(UserInfo user);
	
	public UserInfo getUserInfoById(int userId);
	
	public String checkLoginName(String loginName);
	
	public String getStudentNo(String uNo);
	
	public String getTearchNo(String uNo);
	
	public int register(UserInfo user);
	
	public int updatePwd(UserInfo user);
	
	public String checkOldLoginPwd(String loginName);
}
