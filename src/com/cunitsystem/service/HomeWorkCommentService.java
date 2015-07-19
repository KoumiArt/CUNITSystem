package com.cunitsystem.service;

import com.cunitsystem.entity.HomeWorkComment;

public interface HomeWorkCommentService {

	
	/**
	 * 添加作业批改
	 * @param homeWorkComment
	 * @return
	 */
	public boolean addHomeWorkComment(HomeWorkComment homeWorkComment);

	/** 
	 * 查询当天有没有批阅过,批阅过返回true 没批阅返回false
	 * @param nwId
	 * @param userId
	 * @return
	 */
	public boolean queryDateCommentCount(int nwId, int userId);
}
