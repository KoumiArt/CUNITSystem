package com.cunitsystem.mapper;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.StuHomeWork;

@Component("stuHomeWorkMapper")
public interface StuHomeWorkMapper {

	/**
	 * 保存学生的作业
	 * @param stuHomeWork
	 * @return
	 */
	public int saveStuHomeWork(StuHomeWork stuHomeWork);
	
	/**
	 * 删除作业
	 * @param stuHomeWork
	 * @return
	 */
	public int deleteStuHomeWork(StuHomeWork stuHomeWork);
	
	/**
	 * 根据题目ID，课程ID，学生ID查询此学生，此课程 ，此题目的选项 <br/>
	 * <span style="color:red">注意事项:查询不到返回的是null,所以不能用int接受,必须用Integer 避免错误</span>
	 * @param map
	 * @return
	 */
	public Integer queryStuQuestionOptionId(Map<String,Object> map);
}
