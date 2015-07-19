package com.cunitsystem.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author shy
 * 
 */
public class HomeWorkLog {

	private int hwLogId;
	private int stuId;
	private Date subTime;
	private int nwId;
	private String subTimeStr;

	public int getHwLogId() {
		return hwLogId;
	}

	public void setHwLogId(int hwLogId) {
		this.hwLogId = hwLogId;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public Date getSubTime() {
		return subTime;
	}

	public void setSubTime(Date subTime) {
		this.subTime = subTime;
	}

	public int getNwId() {
		return nwId;
	}

	public void setNwId(int nwId) {
		this.nwId = nwId;
	}

	public String getSubTimeStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		subTimeStr = sdf.format(subTime);
		return subTimeStr;
	}

}
