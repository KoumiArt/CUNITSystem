package com.cunitsystem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.HomeWork;
import com.cunitsystem.entity.Question;
import com.cunitsystem.mapper.HomeWorkLogMapper;
import com.cunitsystem.mapper.HomeWorkMapper;
import com.cunitsystem.mapper.QuestionMapper;
import com.cunitsystem.mapper.StuHomeWorkMapper;
import com.cunitsystem.service.HomeWorkService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SystemUtils;
import com.cunitsystem.web.bean.StuQuestionBean;

/**
 * @author shy
 *
 */
@Service("homeWorkService")
public class HomeWorkServiceImpl implements HomeWorkService {

	private HomeWorkMapper homeWorkMapper;
	private QuestionMapper questionMapper;
	private HomeWorkLogMapper homeWorkLogMapper;
	private StuHomeWorkMapper stuHomeWorkMapper;
	
	public boolean addHomeWork(HomeWork homeWork) {
		int result = homeWorkMapper.saveHomeWork(homeWork);
		if(result==1)
			return true;
		return false;
	}

	public void setHomeWorkMapper(HomeWorkMapper homeWorkMapper) {
		this.homeWorkMapper = homeWorkMapper;
	}

	public List<Question> getHomeWork(int nwId) {
		List<String> questionIdArrList = homeWorkMapper.getQuestionIdArrByNwId(nwId);
		if(questionIdArrList !=null && questionIdArrList.size() >0){
			String arrStr = "";
			for (int i = 0; i < questionIdArrList.size(); i++) {
				arrStr += questionIdArrList.get(i) +",";
			}
			if(arrStr!=null){
				arrStr = arrStr.substring(0,arrStr.length()-1);
				int[] qIdArr = SystemUtils.convertStringArray2IntArray(arrStr.split(","));
				return questionMapper.getQuestionInQuestionId(qIdArr);
			}
		}
		return null;
	}

	public List<StuQuestionBean> seeHomeWork(int nwId,int userId){
		 List<Question> questionList = getHomeWork(nwId);
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("nwId", nwId);
		 map.put("stuId", userId);
		 List<StuQuestionBean> stuQuestionBeanList = new ArrayList<StuQuestionBean>();
		 if(questionList == null || questionList.size() <=0)
			 return null;
		 for (Question question : questionList) {
			StuQuestionBean sqb = new StuQuestionBean();
			sqb.setContent(question.getContent());
			sqb.setQuestionId(question.getQuestionId());
			sqb.setScore(question.getScore());
			sqb.setOptionList(question.getOptionList());
			sqb.setDescription(question.getDescription());
			map.put("questionId", question.getQuestionId());
			//设置当前题目的选项ID
			Integer curOptionId = stuHomeWorkMapper.queryStuQuestionOptionId(map);
			sqb.setCurOptionId(curOptionId==null?0:curOptionId);
			stuQuestionBeanList.add(sqb);
		}
		 return stuQuestionBeanList;
	}
	
	public void setQuestionMapper(QuestionMapper questionMapper) {
		this.questionMapper = questionMapper;
	}

	@Override
	public DataGrid getHomeWorkLogsByPage(Map<String, Object> map) {
		map.put("fkId", SystemUtils.getCurUserInfo().getUserId());
		DataGrid dg = new DataGrid();
		dg.setTotal(homeWorkLogMapper.getHomeWorkLogCount(map));
		dg.setRows(homeWorkLogMapper.getHomeWorkLogsByPage(map));
		return dg;
	}

	public void setHomeWorkLogMapper(HomeWorkLogMapper homeWorkLogMapper) {
		this.homeWorkLogMapper = homeWorkLogMapper;
	}

	public void setStuHomeWorkMapper(StuHomeWorkMapper stuHomeWorkMapper) {
		this.stuHomeWorkMapper = stuHomeWorkMapper;
	}
	
}
