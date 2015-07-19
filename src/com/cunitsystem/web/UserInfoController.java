package com.cunitsystem.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cunitsystem.entity.Student;
import com.cunitsystem.entity.Teacher;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.service.StudentService;
import com.cunitsystem.service.TeacherService;
import com.cunitsystem.service.UserService;
import com.cunitsystem.util.Constants;

@Controller
@SessionAttributes(Constants.USER_INFO_SESSION)
public class UserInfoController {
	private UserService userService;
	private StudentService studentService;
	private TeacherService teacherService;
	
	public TeacherService getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public UserService getUserService() {
		return userService;
	}

	@RequestMapping(value = "/registerUser")
	@ResponseBody
	public boolean registerUser(UserInfo user){
		boolean result = false;
		int fkId = 0;
		try {
			if(user.getUserType() == 2){
				fkId = studentService.getStudentByUserSessionId(user.getUserSessionId());
			}else{
				fkId = teacherService.getTeacherByUserSessionId(user.getUserSessionId());
			}
			user.setFkId(fkId);
			result = userService.register(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/editUserInfo")
	@ResponseBody
	public boolean editUserInfo(UserInfo user,Model model){
		boolean result = false;
		Student stu = null;
		Teacher tea = null;
		try {
			if(user != null){
				if(user.getUserType() == 2){
					stu = new Student();
					stu.setsId(user.getFkId());
					stu.setsName(user.getStudent().getsName());
					stu.setsNo(user.getStudent().getsNo());
					stu.setSex(user.getStudent().getSex().equals("男")?"1":"2");
					stu.setAge(user.getStudent().getAge());
					stu.setEmail(user.getStudent().getEmail());
					stu.setAddress(user.getStudent().getAddress());
					stu.setPhone(user.getStudent().getPhone());
					user.getStudent().setSexStr(user.getStudent().getSex());
				}else{
					tea = new Teacher();
					tea.settId(user.getFkId());
					tea.settName(user.getTeacher().gettName());
					tea.setSex(user.getTeacher().getSex().equals("男")?"1":"2");
					tea.setSexStr(user.getTeacher().getSex());
					tea.setTeachingAge(user.getTeacher().getTeachingAge());
					tea.settNo(user.getTeacher().gettNo());
					tea.setEmail(user.getTeacher().getEmail());
					tea.setPhone(user.getTeacher().getPhone());
					tea.setAddress(user.getTeacher().getAddress());
					user.getTeacher().setSexStr(user.getTeacher().getSex());
				}
				result = userService.updateUserInfo(stu, tea, user.getUserType());
				if(result){
					model.addAttribute(Constants.USER_INFO_SESSION, user);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/editPwd")
	@ResponseBody
	public boolean editPwd(UserInfo user){
		boolean result = false;
		if(null != user){
			try {
				int count = userService.updatePwd(user);
				if(count > 0){
					result = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/checkOldLoginPwd")
	@ResponseBody
	public boolean checkOldLoginPwd(String loginName,String pwd){
		String oldPwd = userService.checkOldLoginPwd(loginName);
		if(!pwd.equals(oldPwd)){
			return false;
		}else{
			return true;
		}
	}
	
	@RequestMapping(value = "/checkLoginName")
	@ResponseBody
	public boolean checkLoginName(String loginName){
		String lName = userService.checkLoginName(loginName);
		if(null != lName && !"".equals(lName)){
			return false;
		}else{
			return true;
		}
	}
	
	@RequestMapping(value = "/checkCardId")
	@ResponseBody
	public boolean checkCardId(String userSessionId,String paramter){
		boolean result = userService.checkCardId(userSessionId,paramter);
		return result;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
