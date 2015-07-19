package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Question;
import com.cunitsystem.mapper.QuestionMapper;
import com.cunitsystem.service.QuestionService;
import com.cunitsystem.util.DataGrid;

/**
 * @author         [hdj]
 * @version        1.0
 */
@Service("questionService")
public class QuestionServiceImpl implements QuestionService {
	
	private QuestionMapper questionMapper;

	public void setQuestionMapper(QuestionMapper questionMapper) {
		this.questionMapper = questionMapper;
	}

	public boolean addQuestion(Question question) {
		int result = questionMapper.saveQuestion(question);
		if(result > 0){
			return true;
		}
		return false;
	}

	public boolean batchDeleteQuestion(int[] questionArr) {
		int result = questionMapper.batchDeleteQuestion(questionArr);
		if(result > 0){
			return true;
		}
		return false;
	}

	public boolean deleteQuestion(Question question) {
		int result = questionMapper.deleteQuestion(question);
		if(result > 0){
			return true;
		}
		return false;
	}

	public Question getQuestionById(int questionId) {
		return questionMapper.getQuestionById(questionId);
	}

	public DataGrid getQuestionsByPage(Map<String, Object> map) {
		List<Question> questionList = questionMapper.getQuestionsByPage(map);
		DataGrid dg = new DataGrid();
		dg.setTotal(questionMapper.getQuestionCount(map));
		dg.setRows(questionList);
		return dg;
	}

	public boolean updateQuestion(Question question) {
		int result = questionMapper.updateQuestion(question);
		if(result > 0){
			return true;
		}
		return false;
	}

}
