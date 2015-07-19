package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Exam;

@Component("examMapper")
public interface ExamMapper {
	public List<Exam> getExamsByPage(Map<String, Object> map);

	public int saveExam(Exam exam);

	public int getExamCount(Map<String, Object> map);

	public int deleteExam(Exam exam);

	public int updateExam(Exam exam);

	public Exam getExamById(int examId);

	public int batchDeleteExam(@Param("examArr") int[] examArr);
}
