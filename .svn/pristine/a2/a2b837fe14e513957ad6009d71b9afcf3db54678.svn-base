package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Enrol;
import com.cunitsystem.entity.NetWorkCourse;
import com.cunitsystem.entity.Question;

@Component("enrolMapper")
public interface EnrolMapper {
	
	/**
	 * 保存
	 * @param enrol
	 * @return
	 */
	public int saveEnrol(Enrol enrol);

	/**
	 * 获取我的课程列表
	 * @param map
	 * @return
	 */
	public List<NetWorkCourse> getMyNetWorkCoursesByPage(Map<String, Object> map);
	
	/**
	 * 获取总数量
	 * @return
	 */
	public int getMyNetWorkCourseCount(Map<String, Object> map);
	
	/**
	 * 随机获取50道问题 
	 * @param nwId(课程ID)
	 * @return
	 */
	public List<Question> getQuestionRandom(int nwId);
}
