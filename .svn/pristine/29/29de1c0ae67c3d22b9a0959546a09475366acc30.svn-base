package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.NetWorkCourse;

/**
 * @author shy
 * 
 */
@Component("netWorkCourseMapper")
public interface NetWorkCourseMapper {

	public List<NetWorkCourse> getNetWorkCoursesByPage(Map<String, Object> map);
	
	public List<NetWorkCourse> getNetWorkCoursesByList();

	public int saveNetWorkCourse(NetWorkCourse netWorkCourse);

	public int getNetWorkCourseCount(Map<String, Object> map);

	public int deleteNetWorkCourse(NetWorkCourse netWorkCourse);

	public int updateNetWorkCourse(NetWorkCourse netWorkCourse);

	public NetWorkCourse getNetWorkCourseById(int nwId);

	public int batchDeleteNetWorkCourse(@Param("netWorkCourseArr") int[] netWorkCourseArr);
}
