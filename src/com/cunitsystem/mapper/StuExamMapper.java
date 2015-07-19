package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.StuExam;

@Component("stuExamMapper")
public interface StuExamMapper {

	/**
	 * 保存学生的作业
	 * @param stuExam
	 * @return
	 */
	public int saveStuExam(StuExam stuExam);
	
	/**
	 * 查询是否考过试
	 * @param map
	 * @return
	 */
	public int queryExitEaxm(Map<String,Object> map);
	
	
	public Integer queryExamId(Map<String,Object> map);
	
	public List<Map<String,Object>> queryExamResult(Map<String,Object> map);
}
