package com.cunitsystem.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.HomeWork;

@Component("homeWorkMapper")
public interface HomeWorkMapper {

	/**
	 * 布置作业
	 * @param homeWork
	 * @return
	 */
	public int saveHomeWork(HomeWork homeWork);
	
	/**
	 * 根据课程ID获取作业问题ID
	 * @param nwId(课程ID)
	 * @return
	 */
	public List<String> getQuestionIdArrByNwId(int nwId);
}
