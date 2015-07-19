package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cunitsystem.entity.Subject;
import com.cunitsystem.service.SubjectService;
import com.cunitsystem.util.DataGrid;

@Controller
@RequestMapping("/manager")
public class SubjectController {
	
	private SubjectService subjectService;
	
	@RequestMapping("/subjectList")
	@ResponseBody
	public DataGrid getSubjectList(int page, int rows,Subject subject){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("subject", subject);
		return subjectService.getSubjectsByPage(map);
	}
	
	@RequestMapping("/saveSubject")
	@ResponseBody
	public boolean saveSubject(Subject subject){
		boolean result = false;
		if(subject.getSubjectId() >0){
			result = subjectService.updateSubject(subject);
		} else {
			result = subjectService.addSubject(subject);
		}
		return result;
	}

	@RequestMapping("/getSubject")
	@ResponseBody
	public Subject getSubject(int subjectId){
		return subjectService.getSubjectById(subjectId);
	}
	
	@RequestMapping("/deleteSubject")
	@ResponseBody
	public boolean deleteSubject(Subject subject){
		return subjectService.deleteSubject(subject);
	}
	
	@RequestMapping("/batchDeleteSubject")
	@ResponseBody
	public boolean batchDeleteSubject(int[] subjectArr){
		return subjectService.batchDeleteSubject(subjectArr);
	}
	
	public SubjectService getSubjectService() {
		return subjectService;
	}

	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}

	
}
