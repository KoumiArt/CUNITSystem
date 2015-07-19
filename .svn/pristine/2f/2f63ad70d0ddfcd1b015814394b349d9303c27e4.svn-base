package com.cunitsystem.service.impl;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.StuHomeWork;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.mapper.StuHomeWorkMapper;
import com.cunitsystem.service.StuHomeWorkService;
import com.cunitsystem.util.SystemUtils;


@Service("stuHomeWorkService")
public class StuHomeWorkServiceImpl implements StuHomeWorkService {

	private StuHomeWorkMapper stuHomeWorkMapper; 
	
	public boolean addStuHomeWork(int nwId,int[] optionIds) {
		boolean result = false;
		//保存之前先清空之前的作业记录
		UserInfo curUserInfo = SystemUtils.getCurUserInfo();
		StuHomeWork stuHomeWork_del = new StuHomeWork();
		stuHomeWork_del.setStuId(curUserInfo.getUserId());
		stuHomeWork_del.setNwId(nwId);
		stuHomeWorkMapper.deleteStuHomeWork(stuHomeWork_del);
		for (int i = 0; i < optionIds.length; i++) {
			StuHomeWork stuHomeWork = new StuHomeWork();
			stuHomeWork.setStuId(curUserInfo.getUserId());
			stuHomeWork.setNwId(nwId);
			stuHomeWork.setOptionId(optionIds[i]);
			int save_result = stuHomeWorkMapper.saveStuHomeWork(stuHomeWork);
			if(save_result == 1)
				result = true;
			else 
				result = false;
		}
		return result;
	}

	public void setStuHomeWorkMapper(StuHomeWorkMapper stuHomeWorkMapper) {
		this.stuHomeWorkMapper = stuHomeWorkMapper;
	}

}
