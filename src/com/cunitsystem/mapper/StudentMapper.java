package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Student;

@Component("studentMapper")
public interface StudentMapper {
	public List<Student> getStudentsByPage(Map<String,Object> map);

	public int saveStudent(Student student);

	public int getStudentCount(Map<String, Object> map);
	
	public int deleteStudent(Student student);
	
	public int updateStudent(Student student);
	
	public Student getStudentById(int studentId);

	public int getStudentByUserSessionId(String userSessionId);

	public int batchDeleteStudent(@Param("studentArr")int[] studentArr);
	
	public List<Map<String,Object>> selectStuExam(Map<String,Object> map);
}
