package com.cunitsystem.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author [hdj]
 * @version 1.0
 */
public class Question {
	
	private int questionId;
	private String content;
	private NetWorkCourse netWorkCourse;
	private String description;
	private Date createTime;
	private String createTimeStr;
	private int score;
	private int[] questionIds;

	public int[] getQuestionIds() {
		return questionIds;
	}

	public void setQuestionIds(int[] questionIds) {
		this.questionIds = questionIds;
	}

	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}

	private List<Option> optionList;
	
	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public NetWorkCourse getNetWorkCourse() {
		return netWorkCourse;
	}

	public void setNetWorkCourse(NetWorkCourse netWorkCourse) {
		this.netWorkCourse = netWorkCourse;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public List<Option> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<Option> optionList) {
		this.optionList = optionList;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
