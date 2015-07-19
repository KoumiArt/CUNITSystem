package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Question;

/**
 * @author         [hdj]
 * @version        1.0
 */
@Component("questionMapper")
public interface QuestionMapper {
	public List<Question> getQuestionsByPage(Map<String,Object> map);

	public int saveQuestion(Question question);

	public int getQuestionCount(Map<String, Object> map);
	
	public int deleteQuestion(Question question);
	
	public int updateQuestion(Question question);
	
	public Question getQuestionById(int questionId);

	public int batchDeleteQuestion(@Param("questionArr")int[] questionArr);
	
	public List<Question> getQuestionInQuestionId(@Param("questionIdArr")int[] questionIdArr);
}
