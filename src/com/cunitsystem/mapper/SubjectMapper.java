package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Subject;

@Component("subjectMapper")
public interface SubjectMapper {
	
	public List<Subject> getSubjectsByPage(Map<String,Object> map);
	
	public List<Subject> getSubjectsByList();

	public int saveSubject(Subject subject);

	public int getSubjectCount(Map<String, Object> map);
	
	public int deleteSubject(Subject subject);
	
	public int updateSubject(Subject subject);
	
	public Subject getSubjectById(int subjectId);

	public int batchDeleteSubject(@Param("subjectArr")int[] subjectArr);
}
