package com.cunitsystem.service;

import java.util.List;
import java.util.Map;

import com.cunitsystem.entity.Exam;
import com.cunitsystem.entity.Question;
import com.cunitsystem.util.DataGrid;

/**
 * @author shy
 *
 */
public interface ExamService {
	public DataGrid getExamsByPage(Map<String,Object> map);
	
	public boolean addExam(Exam exam);
	
	public boolean deleteExam(Exam exam);
	
	public boolean updateExam(Exam exam);
	
	public Exam getExamById(int examId);
	
	public boolean batchDeleteExam(int examArr[]);

	public boolean addExamQuestion(int examId,int nwId, int[] examQuestionArr);

	public List<Question> getExamQuestion(int nwId);

	public DataGrid getConjunctionQuestionList(int page, int rows, int examId,
			int nwId);
}
