package com.cunitsystem.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Resource;


/**
 * @author shy
 *
 */
@Component("resourceMapper")
public interface ResourceMapper {
	public List<Resource> getResourceByPage(Map<String,Object> map);

	public int saveResource(Resource resource);

	public int getResourceCount(Map<String, Object> map);
	
	public int deleteResource(Resource resource);
	
	public int updateResource(Resource resource);
	
	public Resource getResourceById(int resourceId);

	public int batchDeleteResource(@Param("resourceArr")int[] resourceArr);
}
