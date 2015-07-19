package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.HomeWorkLog;


@Component("homeWorkLogMapper")
public interface HomeWorkLogMapper {

	/**
	 * 保存作业记录
	 * @param homeWorkLog
	 * @return
	 */
	public int saveHomeWorkLog(HomeWorkLog homeWorkLog);
	
	public List<HomeWorkLog> getHomeWorkLogsByPage(Map<String,Object> map);

	public int getHomeWorkLogCount(Map<String, Object> map);
	
}
