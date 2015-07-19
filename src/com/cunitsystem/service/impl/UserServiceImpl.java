package com.cunitsystem.service.impl;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Student;
import com.cunitsystem.entity.Teacher;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.mapper.StudentMapper;
import com.cunitsystem.mapper.TeacherMapper;
import com.cunitsystem.mapper.UserMapper;
import com.cunitsystem.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;
	private StudentMapper studentMapper;
	private TeacherMapper tacherMapper;
	
	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	public void setTacherMapper(TeacherMapper tacherMapper) {
		this.tacherMapper = tacherMapper;
	}

	public UserInfo getUserInfoById(int userId) {
		return userMapper.getUserInfoById(userId);
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public String checkLoginName(String loginName) {
		return userMapper.checkLoginName(loginName);
	}

	public boolean register(UserInfo user) {
		int result = userMapper.register(user);
		if(result==1)
			return true;
		return false;
	}

	public boolean checkCardId(String uNo,String paramter) {
		boolean result = false;
		if("2".equals(paramter)){
			String sNo = userMapper.getStudentNo(uNo);
			if(null == sNo || "".equals(sNo)){
				result = false;
			}else{
				result = true;
			}
		}else{
			String tNo = userMapper.getTearchNo(uNo);
			if(null == tNo || "".equals(tNo)){
				result = false;
			}else{
				result = true;
			}
		}
		return result;
	}

	public boolean updateUserInfo(Student stu,Teacher tea, int userType) {
		boolean result = false;
		if(userType == 2){
			int count = studentMapper.updateStudent(stu);
			if(count > 0){
				result = true;
			}
		}else{
			int count = tacherMapper.updateTeacher(tea);
			if(count > 0){
				result = true;
			}
		}
		return result;
	}

	public int updatePwd(UserInfo user) {
		return userMapper.updatePwd(user);
	}

	@Override
	public String checkOldLoginPwd(String loginName) {
		return userMapper.checkOldLoginPwd(loginName);
	}

}
