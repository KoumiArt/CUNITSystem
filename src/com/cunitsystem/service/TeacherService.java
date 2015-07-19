package com.cunitsystem.service;

import java.util.Map;

import com.cunitsystem.entity.Teacher;
import com.cunitsystem.util.DataGrid;

/**
 * @author shy
 *
 */
public interface TeacherService {
	
	public DataGrid getTeachersByPage(Map<String,Object> map);
	
	public boolean addTeacher(Teacher teacher);
	
	public boolean deleteTeacher(Teacher teacher);
	
	public boolean updateTeacher(Teacher teacher);
	
	public Teacher getTeacherById(int teacherId);
	
	public int getTeacherByUserSessionId(String userSessionId);
	
	public boolean batchDeleteTeacher(int teacherArr[]);
	
	public DataGrid getTeacherEnrolList(int tId);

	public DataGrid getTeacherResourceList(int nwId);
}
