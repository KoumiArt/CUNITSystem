package com.cunitsystem.service;


import java.util.Map;

import com.cunitsystem.entity.Resource;
import com.cunitsystem.util.DataGrid;


/**
 * @author shy
 *
 */
public interface ResourceService {
	public DataGrid getResourceByPage(Map<String,Object> map);
	
	public boolean addResource(Resource resource);
	
	public boolean deleteResource(Resource resource);
	
	public boolean updateResource(Resource resource);
	
	public Resource getResourceById(int resourceId);
	
	public boolean batchDeleteResource(int resourceArr[]);
}
