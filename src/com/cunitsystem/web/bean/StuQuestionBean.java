package com.cunitsystem.web.bean;

import java.util.List;

import com.cunitsystem.entity.Option;

/**
 * 
 * @author shy
 *
 */
public class StuQuestionBean {
	
	private int questionId;
	
	private String content;
	
	private String description;
	
	private int score;
	
	private List<Option> optionList;
	
	/**
	 * 当前题目所选的选项
	 */
	private int curOptionId;
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public int getCurOptionId() {
		return curOptionId;
	}
	public void setCurOptionId(int curOptionId) {
		this.curOptionId = curOptionId;
	}
	
	
}
