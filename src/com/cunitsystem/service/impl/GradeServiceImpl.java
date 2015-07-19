package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Grade;
import com.cunitsystem.mapper.GradeMapper;
import com.cunitsystem.service.GradeService;
import com.cunitsystem.util.DataGrid;
/**
 * 
 * @author         [黄典俊] [huangdianjun@xwtec.cn]
 * @version        1.0
 */
@Service("gradeService")
public class GradeServiceImpl implements GradeService {
	private GradeMapper gradeMapper;

	public void setGradeMapper(GradeMapper gradeMapper) {
		this.gradeMapper = gradeMapper;
	}

	/**
	 * 
	 *  Created on 2014-1-22
	 * <p>Discription:[根据年级ID查询年级信息]</p>
	 * @author:[黄典俊]
	 * @update:[日期YYYY-MM-DD] [更改人姓名]
	 */
	public Grade getGradeById(int gradeId) {
		return gradeMapper.getGradeById(gradeId);
	}

	/**
	 * 
	 *  Created on 2014-1-22
	 * <p>Discription:[查询年级列表]</p>
	 * @author:[黄典俊]
	 * @update:[日期YYYY-MM-DD] [更改人姓名]
	 */
	public DataGrid getGradeByPage(Map<String, Object> map) {
		DataGrid dg = new DataGrid();
		dg.setTotal(gradeMapper.getGradeCount(map));
		List<Grade> gradeList = gradeMapper.getGradeByPage(map);
		dg.setRows(gradeList);
		return dg;
	}

}
