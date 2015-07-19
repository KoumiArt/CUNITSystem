package com.cunitsystem.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Resource;
import com.cunitsystem.mapper.ResourceMapper;
import com.cunitsystem.service.ResourceService;
import com.cunitsystem.util.DataGrid;


/**
 * @author shy
 *
 */
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService{
	
	private ResourceMapper resourceMapper;
	public DataGrid getResourceByPage(Map<String,Object> map){
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(resourceMapper.getResourceCount(map));
		List<Resource> resourceByPage = resourceMapper.getResourceByPage(map);
		dataGrid.setRows(resourceByPage);
		return dataGrid;
	}
	
	public void setResourceMapper(ResourceMapper resourceMapper) {
		this.resourceMapper = resourceMapper;
	}

	@Override
	public boolean addResource(Resource resource) {
		int result = resourceMapper.saveResource(resource);
		if(result==1)
			return true;
		return false;
	}
	
	public boolean deleteResource(Resource resource){
		int result = resourceMapper.deleteResource(resource);
		if(result==1)
			return true;
		return false;
	}
	
	public boolean updateResource(Resource resource){
		int result = resourceMapper.updateResource(resource);
		if(result==1)
			return true;
		return false;
	}
	
	public Resource getResourceById(int resourceId){
		return resourceMapper.getResourceById(resourceId);
	}

	public boolean batchDeleteResource(int[] resourceArr) {
		int result = resourceMapper.batchDeleteResource(resourceArr);
		if(result > 0)
			return true;
		return false;
	}
}
