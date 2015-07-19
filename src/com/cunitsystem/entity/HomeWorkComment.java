package com.cunitsystem.entity;

import java.util.Date;

/**
 * @author shy
 * 
 */
public class HomeWorkComment {
	
	private int hwcId;
	private int stuId;
	private int nwId;
	private int isEligible;
	private Date date;

	public int getHwcId() {
		return hwcId;
	}

	public void setHwcId(int hwcId) {
		this.hwcId = hwcId;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getIsEligible() {
		return isEligible;
	}

	public void setIsEligible(int isEligible) {
		this.isEligible = isEligible;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getNwId() {
		return nwId;
	}

	public void setNwId(int nwId) {
		this.nwId = nwId;
	}

}
