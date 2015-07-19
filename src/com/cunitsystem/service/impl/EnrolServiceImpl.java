package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Enrol;
import com.cunitsystem.entity.NetWorkCourse;
import com.cunitsystem.entity.Question;
import com.cunitsystem.mapper.EnrolMapper;
import com.cunitsystem.service.EnrolService;
import com.cunitsystem.util.DataGrid;

@Component("enrolService")
public class EnrolServiceImpl implements EnrolService {

	private EnrolMapper enrolMapper;

	public void setEnrolMapper(EnrolMapper enrolMapper) {
		this.enrolMapper = enrolMapper;
	}

	public boolean addEnrol(Enrol enrol) {
		int result = enrolMapper.saveEnrol(enrol);
		if(result==1)
			return true;
		return false;
	}

	public DataGrid getMyNetWorkCourse(Map<String, Object> map) {
		List<NetWorkCourse> netWorkCourseList = enrolMapper.getMyNetWorkCoursesByPage(map);
		DataGrid dg = new DataGrid();
		dg.setTotal(enrolMapper.getMyNetWorkCourseCount(map));
		dg.setRows(netWorkCourseList);
		return dg;
	}

	public List<Question> getQuestionRandom(int nwId) {
		return enrolMapper.getQuestionRandom(nwId);
	}
}
