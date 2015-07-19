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

import com.cunitsystem.entity.Recommend;
import com.cunitsystem.service.RecommendService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SpringUtils;
import com.cunitsystem.util.SystemUtils;

@Controller
@RequestMapping("/manager")
public class RecommendController {
	private RecommendService recommendService;
	
	@RequestMapping("/recommendList")
	@ResponseBody
	public DataGrid getRecommendList(int page, int rows,Recommend recommend){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("recommend", recommend);
		return recommendService.getRecommendsByPage(map);
	}
	
	@RequestMapping("/saveRecommend")
	public ModelAndView saveRecommend(HttpServletRequest request,Recommend recommend,@RequestParam("recommendFile") CommonsMultipartFile file){
		ModelAndView mav = new ModelAndView("manager/editRecommend");
		boolean result = false;
		File saveFile = null;
		try {
			if (!file.isEmpty()) {
				String newFileName = SystemUtils.getReName(file.getOriginalFilename());
				String savePath = request.getSession().getServletContext().getRealPath("") +"\\recommendFile\\"+newFileName;
				recommend.setPath(newFileName);
				saveFile = new File(savePath);
				file.getFileItem().write(saveFile); //将上传的文件写入新建的文件中
			}
			if(recommend.getRecId() >0){
				result = recommendService.updateRecommend(recommend);
			} else {
				result = recommendService.addRecommend(recommend);
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(saveFile!=null)
				saveFile.delete();
			result = false;
		}
		mav.addObject("rec_result", result);
		return mav;
	}

	@RequestMapping("/getRecommend")
	@ResponseBody
	public Recommend getRecommend(int recId){
		return recommendService.getRecommendById(recId);
	}
	
	@RequestMapping("/deleteRecommend")
	@ResponseBody
	public boolean deleteRecommend(Recommend recommend){
		return recommendService.deleteRecommend(recommend);
	}
	
	@RequestMapping("/batchDeleteRecommend")
	@ResponseBody
	public boolean batchDeleteRecommend(int[] recommendArr){
		return recommendService.batchDeleteRecommend(recommendArr);
	}
	
	@RequestMapping("/checkRecommendFileExit")
	@ResponseBody
	public boolean recommendFileExit(int recId){
		Recommend recommend = recommendService.getRecommendById(recId);
		String filePath = SpringUtils.getServletContext().getRealPath("") +"\\recommendFile\\"+recommend.getPath();
		if(!new File(filePath).exists()){
			return false;
		}
		return true;
	}
	
	@RequestMapping("/downLoadRecommend")
	public  ResponseEntity<byte[]> downLoadRecommend(int recId)throws IOException{
		Recommend recommend = recommendService.getRecommendById(recId);
		HttpHeaders headers = new HttpHeaders();  
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);  
	    headers.setContentDispositionFormData("attachment", recommend.getPath()); 
	    String filePath = SpringUtils.getServletContext().getRealPath("") +"\\recommendFile\\"+recommend.getPath();
	    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(filePath)),  
                headers, HttpStatus.CREATED);
	}
	
	public RecommendService getRecommendService() {
		return recommendService;
	}

	public void setRecommendService(RecommendService recommendService) {
		this.recommendService = recommendService;
	}

	
}
