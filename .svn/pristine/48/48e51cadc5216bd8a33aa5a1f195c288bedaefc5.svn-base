package com.cunitsystem.service;

import java.util.List;
import java.util.Map;

import com.cunitsystem.entity.HomeWork;
import com.cunitsystem.entity.Question;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.web.bean.StuQuestionBean;

public interface HomeWorkService {

	/**
	 * 添加布置作业
	 * @param homeWork
	 * @return
	 */
	public boolean addHomeWork(HomeWork homeWork);

	public List<Question> getHomeWork(int nwId);
	
	public DataGrid getHomeWorkLogsByPage(Map<String,Object> map);
	
	/**
	 * 查看作业
	 * @param nwId
	 * @param userId
	 * @return
	 */
	public List<StuQuestionBean> seeHomeWork(int nwId,int userId);

}
