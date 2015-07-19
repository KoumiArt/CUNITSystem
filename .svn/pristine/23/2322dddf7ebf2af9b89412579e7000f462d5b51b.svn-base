package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cunitsystem.entity.Teacher;
import com.cunitsystem.service.TeacherService;
import com.cunitsystem.util.DataGrid;

@Controller
@RequestMapping("/manager")
public class TeacherController {
	private TeacherService teacherService;
	
	@RequestMapping("/teacherList")
	@ResponseBody
	public DataGrid getTeacherList(int page, int rows,Teacher teacher,String beginTeachingAge,String endTeachingAge){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("teacher", teacher);
		map.put("beginTeachingAge", beginTeachingAge);
		map.put("endTeachingAge", endTeachingAge);
		return teacherService.getTeachersByPage(map);
	}
	
	@RequestMapping("/saveTeacher")
	@ResponseBody
	public boolean saveTeacher(Teacher teacher){
		boolean result = false;
		if(teacher.gettId() >0){
			result = teacherService.updateTeacher(teacher);
		} else {
			result = teacherService.addTeacher(teacher);
		}
		return result;
	}

	@RequestMapping("/getTeacher")
	@ResponseBody
	public Teacher getTeacher(int tId){
		return teacherService.getTeacherById(tId);
	}
	
	@RequestMapping("/deleteTeacher")
	@ResponseBody
	public boolean deleteTeacher(Teacher teacher){
		return teacherService.deleteTeacher(teacher);
	}
	
	@RequestMapping("/batchDeleteTeacher")
	@ResponseBody
	public boolean batchDeleteTeacher(int[] teacherArr){
		return teacherService.batchDeleteTeacher(teacherArr);
	}
	
	@RequestMapping("/teacherEnrolList")
	@ResponseBody
	public DataGrid getTeacherEnrolList(int tId){
		return teacherService.getTeacherEnrolList(tId);
	}
	
	@RequestMapping("/teacherResourceList")
	@ResponseBody
	public DataGrid getTeacherResourceList(int nwId){
		return teacherService.getTeacherResourceList(nwId);
	}
	
	public TeacherService getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	
}
