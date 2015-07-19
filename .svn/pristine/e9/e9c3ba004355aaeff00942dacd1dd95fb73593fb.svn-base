package com.cunitsystem.service;

import java.util.Map;

import com.cunitsystem.entity.Student;
import com.cunitsystem.util.DataGrid;

/**
 * @author shy
 *
 */
public interface StudentService {
	public DataGrid getStudentsByPage(Map<String,Object> map);
	
	public boolean addStudent(Student student);
	
	public boolean deleteStudent(Student student);
	
	public boolean updateStudent(Student student);
	
	public Student getStudentById(int studentId);
	
	public int getStudentByUserSessionId(String userSessionId);
	
	public boolean batchDeleteStudent(int studentArr[]);

	public DataGrid getStuExams(int stuId,int nwId);
}
