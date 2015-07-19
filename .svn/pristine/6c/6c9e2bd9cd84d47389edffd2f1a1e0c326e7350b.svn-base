package com.cunitsystem.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author shy
 *
 */
public class Enrol {

	private int enrolId;
	private int fkId;
	private int nwId;
	private int type;
	private Date createTime;
	private String createTimeStr;
	private int score;
	
	//表单查询自动 用户学生名称
	private String sName;
	
	private UserInfo userInfo;
	private NetWorkCourse netWorkCourse;

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public NetWorkCourse getNetWorkCourse() {
		return netWorkCourse;
	}

	public void setNetWorkCourse(NetWorkCourse netWorkCourse) {
		this.netWorkCourse = netWorkCourse;
	}

	public int getEnrolId() {
		return enrolId;
	}

	public void setEnrolId(int enrolId) {
		this.enrolId = enrolId;
	}

	public int getFkId() {
		return fkId;
	}

	public void setFkId(int fkId) {
		this.fkId = fkId;
	}

	public int getNwId() {
		return nwId;
	}

	public void setNwId(int nwId) {
		this.nwId = nwId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}
