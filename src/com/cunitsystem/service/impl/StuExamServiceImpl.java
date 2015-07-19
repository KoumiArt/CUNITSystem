package com.cunitsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.StuExam;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.mapper.StuExamMapper;
import com.cunitsystem.service.StuExamService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SystemUtils;


@Service("stuExamService")
public class StuExamServiceImpl implements StuExamService {

	private StuExamMapper stuExamMapper; 
	
	public boolean addStuExam(int nwId,int[] optionIds) {
		boolean result = false;
		UserInfo curUserInfo = SystemUtils.getCurUserInfo();
		StuExam stuExam = new StuExam();
		stuExam.setStuId(curUserInfo.getUserId());
		stuExam.setNwId(nwId);
		for (int i = 0; i < optionIds.length; i++) {
			stuExam.setOptionId(optionIds[i]);
			//查询examId
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("optionId", optionIds[i]);
			Integer examId = stuExamMapper.queryExamId(map);
			if(examId != null)
				stuExam.setExamId(examId);
			int save_result = stuExamMapper.saveStuExam(stuExam);
			if(save_result == 1)
				result = true;
			else 
				result = false;
		}
		return result;
	}

	public void setStuExamMapper(StuExamMapper stuExamMapper) {
		this.stuExamMapper = stuExamMapper;
	}

	public boolean isExitExam(int nwId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nwId", nwId);
		map.put("stuId", SystemUtils.getCurUserInfo().getUserId());
		int result = stuExamMapper.queryExitEaxm(map);
		if(result > 0)
			return true;
		return false;
	}

	public DataGrid getExamResult(int examId,int nwId) {
		DataGrid dg = new DataGrid();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("examId", examId);
		map.put("nwId", nwId);
		List<Map<String, Object>> examResult = stuExamMapper.queryExamResult(map);
		dg.setRows(examResult);
		dg.setTotal(examResult == null ? 0:examResult.size());
		return dg;
	}

}
