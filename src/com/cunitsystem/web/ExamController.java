package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cunitsystem.entity.Exam;
import com.cunitsystem.service.ExamService;
import com.cunitsystem.service.StuExamService;
import com.cunitsystem.util.DataGrid;

@Controller
@RequestMapping("/manager")
public class ExamController {
	private ExamService examService;
	private StuExamService stuExamService;
	
	@RequestMapping("/examList")
	@ResponseBody
	public DataGrid getExamList(int page, int rows,Exam exam){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("exam", exam);
		return examService.getExamsByPage(map);
	}
	
	@RequestMapping("/saveExam")
	@ResponseBody
	public boolean saveExam(Exam exam){
		boolean result = false;
		if(exam.getExamId() >0){
			result = examService.updateExam(exam);
		} else {
			result = examService.addExam(exam);
		}
		return result;
	}

	@RequestMapping("/getExam")
	@ResponseBody
	public Exam getExam(int examId){
		return examService.getExamById(examId);
	}
	
	@RequestMapping("/deleteExam")
	@ResponseBody
	public boolean deleteExam(Exam exam){
		return examService.deleteExam(exam);
	}
	
	@RequestMapping("/batchDeleteExam")
	@ResponseBody
	public boolean batchDeleteExam(int[] examArr){
		return examService.batchDeleteExam(examArr);
	}
	
	@RequestMapping("/addExamQuestion")
	@ResponseBody
	public boolean addExamQuestion(int examId,int nwId,int[] examQuestionArr){
		return examService.addExamQuestion(examId,nwId,examQuestionArr);
	}
	
	@RequestMapping("/getExamQuestion")
	public ModelAndView getExamQuestion(int nwId){
		ModelAndView mav = new ModelAndView("client/examQuestion");
		mav.addObject("lstExamQuestion", examService.getExamQuestion(nwId));
		return mav;
	}
	
	@RequestMapping("/submitExamQusetion")
	@ResponseBody
	public boolean submitExamQusetion(int[] optionIds,int nwId){
		return stuExamService.addStuExam(nwId, optionIds);
	}
	
	@RequestMapping("/isExitExam")
	@ResponseBody
	public boolean isExitExam(int nwId){
		return stuExamService.isExitExam(nwId);
	}
	
	@RequestMapping("/conjunctionQuestionList")
	@ResponseBody
	public DataGrid getConjunctionQuestionList(int page,int rows,int examId,int nwId){
		return examService.getConjunctionQuestionList(page,rows,examId,nwId);
	}
	
	@RequestMapping("/getExamResult")
	@ResponseBody
	public DataGrid getExamResult(int examId,int nwId){
		return stuExamService.getExamResult(examId,nwId);
	}
	
	public ExamService getExamService() {
		return examService;
	}

	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	public void setStuExamService(StuExamService stuExamService) {
		this.stuExamService = stuExamService;
	}

}
