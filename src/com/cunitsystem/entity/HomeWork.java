package com.cunitsystem.entity;

import java.util.Date;

/**
 * @author shy
 * 
 */
public class HomeWork {
	private int hwId;
	private int nwId;
	private String questionIdArr;
	private Date lastTime;

	public int getHwId() {
		return hwId;
	}

	public void setHwId(int hwId) {
		this.hwId = hwId;
	}

	public String getQuestionIdArr() {
		return questionIdArr;
	}

	public void setQuestionIdArr(String questionIdArr) {
		this.questionIdArr = questionIdArr;
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public int getNwId() {
		return nwId;
	}

	public void setNwId(int nwId) {
		this.nwId = nwId;
	}

}
