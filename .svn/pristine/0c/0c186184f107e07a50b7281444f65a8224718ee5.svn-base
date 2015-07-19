package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Resource;
import com.cunitsystem.entity.Teacher;

@Component("tacherMapper")
public interface TeacherMapper {
	public List<Teacher> getTeachersByPage(Map<String,Object> map);

	public int saveTeacher(Teacher teacher);

	public int getTeacherCount(Map<String, Object> map);
	
	public int deleteTeacher(Teacher teacher);
	
	public int updateTeacher(Teacher teacher);
	
	public Teacher getTeacherById(int teacherId);

	public int getTeacherByUserSessionId(String userSessionId);
	
	public int batchDeleteTeacher(@Param("teacherArr")int[] teacherArr);

	public List<Map<String,Object>> getTeacherEnrolList(int tId);

	public List<Resource> getTeacherResourceList(int nwId);
}