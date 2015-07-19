package com.cunitsystem.service;

import com.cunitsystem.util.DataGrid;

public interface StuExamService {

	/**
	 * 保存学生的考试
	 * @param stuHomeWork
	 * @return
	 */
	public boolean addStuExam(int nwId,int[] optionIds);

	/**
	 * 检查是否参加过考试
	 * @param nwId
	 * @return
	 */
	public boolean isExitExam(int nwId);
	
	public DataGrid getExamResult(int examId,int nwId);
}
