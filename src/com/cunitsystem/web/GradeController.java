package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cunitsystem.entity.Grade;
import com.cunitsystem.service.GradeService;
import com.cunitsystem.util.DataGrid;

/**
 * @author         [黄典俊] [huangdianjun@xwtec.cn]
 * @version        1.0
 */
@Controller
@RequestMapping("/manager")
public class GradeController {
	private GradeService gradeService;

	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	@RequestMapping("/gradeList")
	@ResponseBody
	public DataGrid getGradeList(int page,int rows,Grade grade){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("grade", grade);
		return gradeService.getGradeByPage(map);
	}

}
