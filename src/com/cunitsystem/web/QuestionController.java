package com.cunitsystem.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cunitsystem.entity.NetWorkCourse;
import com.cunitsystem.entity.Question;
import com.cunitsystem.service.NetWorkCourseService;
import com.cunitsystem.service.QuestionService;
import com.cunitsystem.util.DataGrid;

/**
 * @author         [hdj]
 * @version        1.0
 */
@Controller("questionsController")
@RequestMapping("/manager")
public class QuestionController {
	
	private QuestionService questionService;
	private NetWorkCourseService netWorkCourseService;

	public void setNetWorkCourseService(NetWorkCourseService netWorkCourseService) {
		this.netWorkCourseService = netWorkCourseService;
	}

	public QuestionService getQuestionService() {
		return questionService;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	
	@RequestMapping("/questionList")
	@ResponseBody
	public DataGrid getQuestionsList(int page,int rows,Question question){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("question", question);
		return questionService.getQuestionsByPage(map);
	}
	
	@RequestMapping("/saveQuestion")
	@ResponseBody
	public boolean saveQuestion(Question question){
		boolean result = false;
		if(question.getQuestionId() > 0){
			result = questionService.updateQuestion(question);
		} else {
			result = questionService.addQuestion(question);
		}
		return result;
	}
	
	@RequestMapping("/netWorkCourseCmbList")
	@ResponseBody
	public List<NetWorkCourse> getNetWorkCoursesList(){
		return netWorkCourseService.getNetWorkCoursesByList();
	}
	
	@RequestMapping("/getQuestion")
	@ResponseBody
	public Question getQuestion(int questionId){
		return  questionService.getQuestionById(questionId);
	}
	
	@RequestMapping("/deleteQuestion")
	@ResponseBody
	public boolean deleteQuestion(Question question){
		return questionService.deleteQuestion(question);
	}
	
	@RequestMapping("/batchDeleteQuestion")
	@ResponseBody
	public boolean batchDeleteQuestion(int[] questionArr){
		return questionService.batchDeleteQuestion(questionArr);
	}
}
