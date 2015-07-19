package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Subject;
import com.cunitsystem.mapper.SubjectMapper;
import com.cunitsystem.service.SubjectService;
import com.cunitsystem.util.DataGrid;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

	private SubjectMapper subjectMapper;
	
	public DataGrid getSubjectsByPage(Map<String, Object> map) {
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(subjectMapper.getSubjectCount(map));
		List<Subject> subjects = subjectMapper.getSubjectsByPage(map);
		dataGrid.setRows(subjects);
		return dataGrid;
	}

	public boolean addSubject(Subject subject) {
		int result = subjectMapper.saveSubject(subject);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteSubject(Subject subject) {
		int result = subjectMapper.deleteSubject(subject);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateSubject(Subject subject) {
		int result = subjectMapper.updateSubject(subject);
		if(result==1)
			return true;
		return false;
	}

	public Subject getSubjectById(int subjectId) {
		return subjectMapper.getSubjectById(subjectId);
	}

	public boolean batchDeleteSubject(int[] subjectArr) {
		int result = subjectMapper.batchDeleteSubject(subjectArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setSubjectMapper(SubjectMapper subjectMapper) {
		this.subjectMapper = subjectMapper;
	}

	public List<Subject> getSubjectsByList() {
		return subjectMapper.getSubjectsByList();
	}

}
