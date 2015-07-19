package com.cunitsystem.service;

import java.util.Map;

import com.cunitsystem.entity.Question;
import com.cunitsystem.util.DataGrid;

/**
 * @author         [hdj]
 * @version        1.0
 */
public interface QuestionService {

	public DataGrid getQuestionsByPage(Map<String,Object> map);
	
	public boolean addQuestion(Question question);

	public boolean deleteQuestion(Question question);
	
	public boolean updateQuestion(Question question);
	
	public Question getQuestionById(int questionId);

	public boolean batchDeleteQuestion(int[] questionArr);
}
