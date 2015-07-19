package com.cunitsystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Option;

@Component("optionMapper")
public interface OptionMapper {
	
	public List<Option> getOptionsByPage(Map<String,Object> map);
	
	public List<Option> getOptionsByList();

	public int saveOption(Option option);

	public int getOptionCount(Map<String, Object> map);
	
	public int deleteOption(Option option);
	
	public int updateOption(Option option);
	
	public Option getOptionById(int optionId);

	public int batchDeleteOption(@Param("optionArr")int[] optionArr);
	
	public List<Option> getOptionByQuestionId(Integer questionId);
}
