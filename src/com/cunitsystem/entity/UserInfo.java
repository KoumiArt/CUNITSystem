package com.cunitsystem.entity;

/**
 * @author shy
 *
 */
public class UserInfo {
	private Integer userId;
	private String loginName;
	private String loginPwd;
	private Integer fkId;
	private String userSessionId;
	private int userType;
	private Student student;
	private Teacher teacher;
	private String disChatId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public Integer getFkId() {
		return fkId;
	}

	public void setFkId(Integer pkId) {
		this.fkId = pkId;
	}

	public String getUserSessionId() {
		return userSessionId;
	}

	public void setUserSessionId(String userSessionId) {
		this.userSessionId = userSessionId;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getDisChatId() {
		return disChatId;
	}

	public void setDisChatId(String disChatId) {
		this.disChatId = disChatId;
	}
	
}
