package com.cunitsystem.service;


import java.util.List;
import java.util.Map;

import com.cunitsystem.entity.Enrol;
import com.cunitsystem.entity.Question;
import com.cunitsystem.util.DataGrid;

/**
 * @author shy
 *
 */
public interface EnrolService {
	
	/**
	 * 添加一条报名（授课）信息
	 * @param enrol
	 * @return
	 */
	public boolean addEnrol(Enrol enrol);
	
	/**
	 * 获取我的课程列表
	 * @return
	 */
	public DataGrid getMyNetWorkCourse(Map<String, Object> map);
	
	
	/**
	 * 随机获取50道问题 
	 * @param nwId(课程ID)
	 * @return
	 */
	public List<Question> getQuestionRandom(int nwId);
	
}
