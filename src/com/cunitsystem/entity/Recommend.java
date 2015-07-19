package com.cunitsystem.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Recommend {

	private int recId;
	private String content;
	private String path;
	private String recType;
	private Date createTime;
	private Date updateTime;
	private String createTimeStr;
	private String updateTimeStr;

	public int getRecId() {
		return recId;
	}

	public void setRecId(int recId) {
		this.recId = recId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getRecType() {
		return recType;
	}

	public void setRecType(String recType) {
		this.recType = recType;
	}

	public String getCreateTimeStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		createTimeStr = sdf.format(createTime);
		return createTimeStr;
	}

	public String getUpdateTimeStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		updateTimeStr = sdf.format(updateTime);
		return updateTimeStr;
	}

}
