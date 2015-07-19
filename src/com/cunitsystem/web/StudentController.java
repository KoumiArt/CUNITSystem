package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cunitsystem.entity.Student;
import com.cunitsystem.service.StudentService;
import com.cunitsystem.util.DataGrid;

@Controller
@RequestMapping("/manager")
public class StudentController {
	private StudentService studentService;
	
	@RequestMapping("/studentList")
	@ResponseBody
	public DataGrid getStudentList(int page, int rows,Student student){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("student", student);
		return studentService.getStudentsByPage(map);
	}
	
	@RequestMapping("/saveStudent")
	@ResponseBody
	public boolean saveStudent(Student student){
		boolean result = false;
		if(student.getsId() >0){
			result = studentService.updateStudent(student);
		} else {
			result = studentService.addStudent(student);
		}
		return result;
	}

	@RequestMapping("/getStudent")
	@ResponseBody
	public Student getStudent(int sId){
		return studentService.getStudentById(sId);
	}
	
	@RequestMapping("/deleteStudent")
	@ResponseBody
	public boolean deleteStudent(Student student){
		return studentService.deleteStudent(student);
	}
	
	@RequestMapping("/batchDeleteStudent")
	@ResponseBody
	public boolean batchDeleteStudent(int[] studentArr){
		return studentService.batchDeleteStudent(studentArr);
	}
	
	@RequestMapping("/stuExamList")
	@ResponseBody
	public DataGrid getStuExamList(int stuId,int nwId){
		return studentService.getStuExams(stuId,nwId);
	}
	
	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	
}
