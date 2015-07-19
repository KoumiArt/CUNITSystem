package com.cunitsystem.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Student {
	private int sId;
	private String sName;
	private String sex;
	private String email;
	private String phone;
	private String address;
	private int age;
	private String sNo;
	private Date createTime;
	private String createTimeStr;
	private Grade grade;
	private String sexStr;

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateTimeStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		createTimeStr = sdf.format(createTime);
		return createTimeStr;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	
	public String getSexStr(){
		if(sex.equals("1"))
			this.sexStr = "男";
		if(sex.equals("2"))
			this.sexStr = "女";
		return this.sexStr;
	}
	
	public void setSexStr(String sexStr) {
		this.sexStr = sexStr;
	}
}
