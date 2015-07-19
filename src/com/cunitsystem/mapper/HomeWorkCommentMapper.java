package com.cunitsystem.mapper;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.HomeWorkComment;

@Component("homeWorkCommentMapper")
public interface HomeWorkCommentMapper {

	/**
	 * 保存一条作业批改
	 * @param homeWorkComment
	 * @return
	 */
	public int saveHomeWorkComment(HomeWorkComment homeWorkComment);
	
	/**
	 * 查询当天有没有批阅过,返回查询的到的数量,没有批阅返回0
	 * @param map
	 * @return
	 */
	public int queryDateCommentCount(Map<String,Object> map);
}
