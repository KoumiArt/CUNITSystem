package com.cunitsystem.entity;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.cunitsystem.util.SystemUtils;

/**
 * @author shy
 * 
 */
public class Exam {

	private int examId;
	private String examName;
	private int nwId;
	private Date savedEndDate;
	private String endDateStr;
	private NetWorkCourse netWorkCourse;
	private java.util.Date endDate;
	private boolean isInvalid;

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public int getNwId() {
		return nwId;
	}

	public void setNwId(int nwId) {
		this.nwId = nwId;
	}

	public Date getSavedEndDate() {
		return savedEndDate;
	}

	public void setSavedEndDate(Date savedEndDate) {
		this.savedEndDate = savedEndDate;
	}

	public java.util.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}

	public NetWorkCourse getNetWorkCourse() {
		return netWorkCourse;
	}

	public void setNetWorkCourse(NetWorkCourse netWorkCourse) {
		this.netWorkCourse = netWorkCourse;
	}

	public String getEndDateStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		endDateStr = sdf.format(savedEndDate);
		return endDateStr;
	}

	public boolean isInvalid() {
		isInvalid = SystemUtils.checkCurDate(savedEndDate);
		return isInvalid;
	}
}
