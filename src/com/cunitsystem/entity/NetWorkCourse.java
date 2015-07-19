package com.cunitsystem.entity;

import java.util.Date;

public class NetWorkCourse {
	private int nwId;
	private String courseName;
	private Date createTime;
	private String createTimeStr;
	private String description;
	
	
	/**
	 * 0  没报名
	 * 1 报过名 
	 */
	private int curUserIsEnrol;

	public int getNwId() {
		return nwId;
	}

	public void setNwId(int nwId) {
		this.nwId = nwId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreateTimeStr() {
		return createTimeStr;
	}

	public int getCurUserIsEnrol() {
		return curUserIsEnrol;
	}

	public void setCurUserIsEnrol(int curUserIsEnrol) {
		this.curUserIsEnrol = curUserIsEnrol;
	}

}
