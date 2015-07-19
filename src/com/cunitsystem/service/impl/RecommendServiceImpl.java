package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Recommend;
import com.cunitsystem.mapper.RecommendMapper;
import com.cunitsystem.service.RecommendService;
import com.cunitsystem.util.DataGrid;

@Service("recommendService")
public class RecommendServiceImpl implements RecommendService {

	private RecommendMapper recommendMapper;
	
	public DataGrid getRecommendsByPage(Map<String, Object> map) {
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(recommendMapper.getRecommendCount(map));
		List<Recommend> recommends = recommendMapper.getRecommendsByPage(map);
		dataGrid.setRows(recommends);
		return dataGrid;
	}

	public boolean addRecommend(Recommend recommend) {
		int result = recommendMapper.saveRecommend(recommend);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteRecommend(Recommend recommend) {
		int result = recommendMapper.deleteRecommend(recommend);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateRecommend(Recommend recommend) {
		int result = recommendMapper.updateRecommend(recommend);
		if(result==1)
			return true;
		return false;
	}

	public Recommend getRecommendById(int recId) {
		return recommendMapper.getRecommendById(recId);
	}

	public boolean batchDeleteRecommend(int[] recommendArr) {
		int result = recommendMapper.batchDeleteRecommend(recommendArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setRecommendMapper(RecommendMapper recommendMapper) {
		this.recommendMapper = recommendMapper;
	}

}
