package com.cunitsystem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Exam;
import com.cunitsystem.entity.ExamQuestion;
import com.cunitsystem.entity.NetWorkCourse;
import com.cunitsystem.entity.Question;
import com.cunitsystem.mapper.ExamMapper;
import com.cunitsystem.mapper.ExamQuestionMapper;
import com.cunitsystem.service.ExamService;
import com.cunitsystem.service.QuestionService;
import com.cunitsystem.util.DataGrid;

@Service("examService")
public class ExamServiceImpl implements ExamService {

	private ExamMapper examMapper;
	private ExamQuestionMapper examQuestionMapper;
	private QuestionService questionService;
	
	public DataGrid getExamsByPage(Map<String, Object> map) {
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(examMapper.getExamCount(map));
		List<Exam> exams = examMapper.getExamsByPage(map);
		dataGrid.setRows(exams);
		return dataGrid;
	}

	public boolean addExam(Exam exam) {
		int result = examMapper.saveExam(exam);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteExam(Exam exam) {
		int result = examMapper.deleteExam(exam);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateExam(Exam exam) {
		int result = examMapper.updateExam(exam);
		if(result==1)
			return true;
		return false;
	}

	public Exam getExamById(int examId) {
		return examMapper.getExamById(examId);
	}

	public boolean batchDeleteExam(int[] examArr) {
		int result = examMapper.batchDeleteExam(examArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setExamMapper(ExamMapper examMapper) {
		this.examMapper = examMapper;
	}

	public boolean addExamQuestion(int examId,int nwId,int[] examQuestionArr) {
		if(examQuestionArr==null || examQuestionArr.length<=0)
			return false;
		boolean result = false;
		ExamQuestion examQuestion = new ExamQuestion();
		examQuestion.setExamId(examId);
		examQuestion.setNwId(nwId);
		for (int i = 0; i < examQuestionArr.length; i++) {
			examQuestion.setQuestionId(examQuestionArr[i]);
			int save_result = examQuestionMapper.saveExamQuestion(examQuestion);
			if(save_result == 1)
				result = true;
			else 
				result = false;
		}
		return result;
	}

	public void setExamQuestionMapper(ExamQuestionMapper examQuestionMapper) {
		this.examQuestionMapper = examQuestionMapper;
	}

	public List<Question> getExamQuestion(int nwId) {
		return examQuestionMapper.queryQuestionByNwId(nwId);
	}

	public DataGrid getConjunctionQuestionList(int page, int rows, int examId,
			int nwId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("examId", examId);
		params.put("nwId", nwId);
		List<Integer> questionIdList = examQuestionMapper.queryQuestionIdList(params);
		if(questionIdList == null || questionIdList.size() <=0){
			DataGrid dataGrid = new DataGrid();
			dataGrid.setRows(new ArrayList<Question>());
			dataGrid.setTotal(0);
			return dataGrid;
		}
		int questionIdArray[] = new int[questionIdList.size()];
		for (int i = 0; i < questionIdList.size(); i++) {
			questionIdArray[i] = questionIdList.get(i);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		Question question = new Question();
		question.setQuestionIds(questionIdArray);
		NetWorkCourse netWorkCourse = new NetWorkCourse();
		netWorkCourse.setNwId(nwId);
		question.setNetWorkCourse(netWorkCourse);
		map.put("question", question);
		return questionService.getQuestionsByPage(map);
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

}
