package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Recommend;

/**
 * @author shy
 * 
 */
@Component("recommendMapper")
public interface RecommendMapper {

	public List<Recommend> getRecommendsByPage(Map<String, Object> map);

	public int saveRecommend(Recommend recommend);

	public int getRecommendCount(Map<String, Object> map);

	public int deleteRecommend(Recommend recommend);

	public int updateRecommend(Recommend recommend);

	public Recommend getRecommendById(int recId);

	public int batchDeleteRecommend(@Param("recommendArr") int[] recommendArr);
}
