package com.cunitsystem.service.impl;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.mapper.UserMapper;
import com.cunitsystem.service.LoginService;

/**
 * @author shy
 *
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService {

	private UserMapper userMapper;

	public UserInfo login(UserInfo user) {
		return userMapper.login(user);
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

}
