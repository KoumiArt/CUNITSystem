package com.cunitsystem.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cunitsystem.entity.Resource;
import com.cunitsystem.service.ResourceService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SpringUtils;
import com.cunitsystem.util.SystemUtils;

@Controller
@RequestMapping("/manager")
public class ResourceController {
	private ResourceService resourceService;
	
	@RequestMapping("/resourceList")
	@ResponseBody
	public DataGrid getResourceList(int page, int rows,String resourceType,String resourceName,String beginTime,String endTime){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("resourceType", resourceType);
		map.put("resourceName", resourceName);
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		return resourceService.getResourceByPage(map);
	}
	
	@RequestMapping("/saveResource")
	public ModelAndView saveResource(HttpServletRequest request,Resource resource,@RequestParam("resourceFile") CommonsMultipartFile file){
		ModelAndView mav = new ModelAndView("manager/editResource");
		boolean result = false;
		File saveFile = null;
		try {
			if (!file.isEmpty()) {
				String newFileName = SystemUtils.getReName(file.getOriginalFilename());
				String savePath = request.getSession().getServletContext().getRealPath("") +"\\resourceFile\\"+newFileName;
				resource.setResourcePath(newFileName);
				saveFile = new File(savePath);
				file.getFileItem().write(saveFile); //将上传的文件写入新建的文件中
			}
			if(resource.getResourceId() !=null && resource.getResourceId() >0){
				result = resourceService.updateResource(resource);
			} else {
				result = resourceService.addResource(resource);
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(saveFile!=null)
				saveFile.delete();
			result = false;
		}
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping("/getResource")
	@ResponseBody
	public Resource getResource(int resourceId){
		return resourceService.getResourceById(resourceId);
	}
	
	@RequestMapping("/deleteResource")
	@ResponseBody
	public boolean deleteResource(Resource resource){
		return resourceService.deleteResource(resource);
	}
	
	@RequestMapping("/batchDeleteResource")
	@ResponseBody
	public boolean batchDeleteResource(int[] resourceArr){
		return resourceService.batchDeleteResource(resourceArr);
	}
	
	@RequestMapping("/checkResourceFileExit")
	@ResponseBody
	public boolean resourceFileExit(int resourceId){
		Resource resource = resourceService.getResourceById(resourceId);
		String filePath = SpringUtils.getServletContext().getRealPath("") +"\\resourceFile\\"+resource.getResourcePath();
		if(!new File(filePath).exists()){
			return false;
		}
		return true;
	}
	/**
	 * @param request
	 * @param response
	 * @param resourceId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/downLoadResource")
	public ResponseEntity<byte[]>  downLoadResource(int resourceId) throws IOException{
		Resource resource = resourceService.getResourceById(resourceId);
		HttpHeaders headers = new HttpHeaders();  
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);  
	    headers.setContentDispositionFormData("attachment", resource.getResourcePath()); 
	    String filePath = SpringUtils.getServletContext().getRealPath("") +"\\resourceFile\\"+resource.getResourcePath();
	    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(filePath)),  
                headers, HttpStatus.OK);
	}
	
	public ResourceService getResourceService() {
		return resourceService;
	}

	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	
}
