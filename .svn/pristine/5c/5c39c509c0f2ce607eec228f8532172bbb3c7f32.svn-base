package com.cunitsystem.web.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ChatBean {
	
	/**
	 * 聊天信息
	 */
	private String message;
	
	/**
	 * 当前这条聊天信息的所有者
	 */
	private int ownerUserId;
	
	private Date time;
	
	private String timeStr;
	
	private String ownerName;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getOwnerUserId() {
		return ownerUserId;
	}

	public void setOwnerUserId(int ownerUserId) {
		this.ownerUserId = ownerUserId;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getTimeStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		timeStr = sdf.format(time);
		return timeStr;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
}
