package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.NetWorkCourse;
import com.cunitsystem.mapper.NetWorkCourseMapper;
import com.cunitsystem.service.NetWorkCourseService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SystemUtils;

@Service("netWorkCourseService")
public class NetWorkCourseServiceImpl implements NetWorkCourseService {

	private NetWorkCourseMapper netWorkCourseMapper;
	
	public DataGrid getNetWorkCoursesByPage(Map<String, Object> map) {
		map.put("fkId", SystemUtils.getCurUserInfo().getUserId());
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(netWorkCourseMapper.getNetWorkCourseCount(map));
		List<NetWorkCourse> netWorkCourses = netWorkCourseMapper.getNetWorkCoursesByPage(map);
		dataGrid.setRows(netWorkCourses);
		return dataGrid;
	}

	public boolean addNetWorkCourse(NetWorkCourse netWorkCourse) {
		int result = netWorkCourseMapper.saveNetWorkCourse(netWorkCourse);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteNetWorkCourse(NetWorkCourse netWorkCourse) {
		int result = netWorkCourseMapper.deleteNetWorkCourse(netWorkCourse);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateNetWorkCourse(NetWorkCourse netWorkCourse) {
		int result = netWorkCourseMapper.updateNetWorkCourse(netWorkCourse);
		if(result==1)
			return true;
		return false;
	}

	public NetWorkCourse getNetWorkCourseById(int nwId) {
		return netWorkCourseMapper.getNetWorkCourseById(nwId);
	}

	public boolean batchDeleteNetWorkCourse(int[] netWorkCourseArr) {
		int result = netWorkCourseMapper.batchDeleteNetWorkCourse(netWorkCourseArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setNetWorkCourseMapper(NetWorkCourseMapper netWorkCourseMapper) {
		this.netWorkCourseMapper = netWorkCourseMapper;
	}

	public List<NetWorkCourse> getNetWorkCoursesByList() {
		return netWorkCourseMapper.getNetWorkCoursesByList();
	}

}
