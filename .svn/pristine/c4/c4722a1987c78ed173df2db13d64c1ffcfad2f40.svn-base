package com.cunitsystem.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Teacher {
	private int tId;
	private String tName;
	private String sex;
	private int teachingAge;
	private String tNo;
	private String email;
	private String phone;
	private String address;
	private Date createTime;
	private String createTimeStr;
	private String sexStr;

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getTeachingAge() {
		return teachingAge;
	}

	public void setTeachingAge(int teachingAge) {
		this.teachingAge = teachingAge;
	}

	public String gettNo() {
		return tNo;
	}

	public void settNo(String tNo) {
		this.tNo = tNo;
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
