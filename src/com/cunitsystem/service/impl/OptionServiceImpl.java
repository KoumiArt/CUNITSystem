package com.cunitsystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Option;
import com.cunitsystem.mapper.OptionMapper;
import com.cunitsystem.service.OptionService;
import com.cunitsystem.util.DataGrid;

@Service("optionService")
public class OptionServiceImpl implements OptionService {

	private OptionMapper optionMapper;
	
	public DataGrid getOptionsByPage(Map<String, Object> map) {
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(optionMapper.getOptionCount(map));
		List<Option> options = optionMapper.getOptionsByPage(map);
		dataGrid.setRows(options);
		return dataGrid;
	}

	public boolean addOption(Option option) {
		int result = optionMapper.saveOption(option);
		if(result==1)
			return true;
		return false;
	}

	public boolean deleteOption(Option option) {
		int result = optionMapper.deleteOption(option);
		if(result==1)
			return true;
		return false;
	}

	public boolean updateOption(Option option) {
		int result = optionMapper.updateOption(option);
		if(result==1)
			return true;
		return false;
	}

	public Option getOptionById(int optionId) {
		return optionMapper.getOptionById(optionId);
	}

	public boolean batchDeleteOption(int[] optionArr) {
		int result = optionMapper.batchDeleteOption(optionArr);
		if(result > 0)
			return true;
		return false;
	}

	public void setOptionMapper(OptionMapper optionMapper) {
		this.optionMapper = optionMapper;
	}

}
