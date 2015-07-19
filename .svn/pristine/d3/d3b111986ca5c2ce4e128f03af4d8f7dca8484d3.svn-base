package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Resource;
import com.cunitsystem.entity.Teacher;
import com.cunitsystem.mapper.TeacherMapper;
import com.cunitsystem.service.TeacherService;
import com.cunitsystem.util.DataGrid;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {

	private TeacherMapper tacherMapper;
	
	public DataGrid getTeachersByPage(Map<String, Object> map) {
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(tacherMapper.getTeacherCount(map));
		List<Teacher> teachers = tacherMapper.getTeachersByPage(map);
		dataGrid.setRows(teachers);
		return dataGrid;
	}

	public boolean addTeacher(Teacher teacher) {
		int result = tacherMapper.saveTeacher(teacher);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteTeacher(Teacher teacher) {
		int result = tacherMapper.deleteTeacher(teacher);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateTeacher(Teacher teacher) {
		int result = tacherMapper.updateTeacher(teacher);
		if(result==1)
			return true;
		return false;
	}

	public Teacher getTeacherById(int teacherId) {
		return tacherMapper.getTeacherById(teacherId);
	}

	public boolean batchDeleteTeacher(int[] teacherArr) {
		int result = tacherMapper.batchDeleteTeacher(teacherArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setTacherMapper(TeacherMapper tacherMapper) {
		this.tacherMapper = tacherMapper;
	}

	public int getTeacherByUserSessionId(String userSessionId) {
		return tacherMapper.getTeacherByUserSessionId(userSessionId);
	}

	public DataGrid getTeacherEnrolList(int tId) {
		List<Map<String, Object>> teachers = tacherMapper.getTeacherEnrolList(tId);
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(teachers == null ? 0:teachers.size());
		dataGrid.setRows(teachers);
		return dataGrid;
	}

	public DataGrid getTeacherResourceList(int nwId) {
		List<Resource> teachers = tacherMapper.getTeacherResourceList(nwId);
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(teachers == null ? 0:teachers.size());
		dataGrid.setRows(teachers);
		return dataGrid;
	}

}
