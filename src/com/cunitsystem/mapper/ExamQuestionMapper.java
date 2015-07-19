package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.ExamQuestion;
import com.cunitsystem.entity.Question;


@Component("examQuestionMapper")
public interface ExamQuestionMapper {

	public int saveExamQuestion(ExamQuestion examQuestion);
	
	public List<Question> queryQuestionByNwId(int nwId);
	
	public List<Integer> queryQuestionIdList(Map<String, Object> params);
}
