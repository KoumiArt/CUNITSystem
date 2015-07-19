package com.cunitsystem.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.HomeWorkComment;
import com.cunitsystem.mapper.HomeWorkCommentMapper;
import com.cunitsystem.service.HomeWorkCommentService;
import com.cunitsystem.util.SystemUtils;


@Service("homeWorkCommentService")
public class HomeWorkCommentServiceImpl implements HomeWorkCommentService {

	HomeWorkCommentMapper homeWorkCommentMapper;
	
	public boolean addHomeWorkComment(HomeWorkComment homeWorkComment) {
		int result = homeWorkCommentMapper.saveHomeWorkComment(homeWorkComment);
		if(result==1)
			return true;
		return false;
	}

	public void setHomeWorkCommentMapper(HomeWorkCommentMapper homeWorkCommentMapper) {
		this.homeWorkCommentMapper = homeWorkCommentMapper;
	}

	public boolean queryDateCommentCount(int nwId, int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nwId", nwId);
		map.put("stuId", userId);
		map.put("startTime", SystemUtils.getDayStarTime());
		map.put("endTime", SystemUtils.getDayEndTime());
		int result = homeWorkCommentMapper.queryDateCommentCount(map);
		if(result==1)
			return true;
		return false;
	}

}
