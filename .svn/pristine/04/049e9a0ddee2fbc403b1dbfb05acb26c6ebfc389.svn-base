package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cunitsystem.entity.Option;
import com.cunitsystem.service.OptionService;
import com.cunitsystem.util.DataGrid;

@Controller
@RequestMapping("/manager")
public class OptionController {
	
	private OptionService optionService;
	
	@RequestMapping("/optionList")
	@ResponseBody
	public DataGrid getOptionList(int page, int rows,Option option){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("option", option);
		return optionService.getOptionsByPage(map);
	}
	
	@RequestMapping("/saveOption")
	@ResponseBody
	public boolean saveOption(Option option){
		boolean result = false;
		if(option.getOptionId() >0){
			result = optionService.updateOption(option);
		} else {
			result = optionService.addOption(option);
		}
		return result;
	}

	@RequestMapping("/getOption")
	@ResponseBody
	public Option getOption(int optionId){
		return optionService.getOptionById(optionId);
	}
	
	@RequestMapping("/deleteOption")
	@ResponseBody
	public boolean deleteOption(Option option){
		return optionService.deleteOption(option);
	}
	
	@RequestMapping("/batchDeleteOption")
	@ResponseBody
	public boolean batchDeleteOption(int[] optionArr){
		return optionService.batchDeleteOption(optionArr);
	}
	
	public OptionService getOptionService() {
		return optionService;
	}

	public void setOptionService(OptionService optionService) {
		this.optionService = optionService;
	}
	
}
