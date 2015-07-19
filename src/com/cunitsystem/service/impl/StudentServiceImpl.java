package com.cunitsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Student;
import com.cunitsystem.mapper.StudentMapper;
import com.cunitsystem.service.StudentService;
import com.cunitsystem.util.DataGrid;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	private StudentMapper studentMapper;
	
	public DataGrid getStudentsByPage(Map<String, Object> map) {
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(studentMapper.getStudentCount(map));
		List<Student> students = studentMapper.getStudentsByPage(map);
		dataGrid.setRows(students);
		return dataGrid;
	}

	public boolean addStudent(Student student) {
		int result = studentMapper.saveStudent(student);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteStudent(Student student) {
		int result = studentMapper.deleteStudent(student);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateStudent(Student student) {
		int result = studentMapper.updateStudent(student);
		if(result==1)
			return true;
		return false;
	}

	public Student getStudentById(int studentId) {
		return studentMapper.getStudentById(studentId);
	}

	public boolean batchDeleteStudent(int[] studentArr) {
		int result = studentMapper.batchDeleteStudent(studentArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	public int getStudentByUserSessionId(String userSessionId) {
		return studentMapper.getStudentByUserSessionId(userSessionId);
	}

	public DataGrid getStuExams(int stuId,int nwId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("stuId", stuId);
		map.put("nwId", nwId);
		List<Map<String, Object>> stuExamList = studentMapper.selectStuExam(map);
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(stuExamList==null?0:stuExamList.size());
		dataGrid.setRows(stuExamList);
		return dataGrid;
	}

}
