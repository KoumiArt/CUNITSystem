package com.cunitsystem.apsect;

import java.util.Date;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.cunitsystem.entity.HomeWorkLog;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.mapper.HomeWorkLogMapper;
import com.cunitsystem.util.SystemUtils;

@Aspect
@Component
public class HomeWorkLogAspect {
	
	private HomeWorkLogMapper homeWorkLogMapper;
	
	/**
	 * 作业记录拦截
	 */
	@AfterReturning(value = "execution(* com.cunitsystem.service.impl.StuHomeWorkServiceImpl.addStuHomeWork(..)) && args(nwId,..)",argNames="nwId")  
    public void homeWorkLog(int nwId){  
		HomeWorkLog homeWorkLog = new HomeWorkLog();
		homeWorkLog.setNwId(nwId);
		UserInfo curUserInfo = SystemUtils.getCurUserInfo();
		homeWorkLog.setStuId(curUserInfo.getUserId());
		homeWorkLog.setSubTime(new Date());
		homeWorkLogMapper.saveHomeWorkLog(homeWorkLog);
    }

	public void setHomeWorkLogMapper(HomeWorkLogMapper homeWorkLogMapper) {
		this.homeWorkLogMapper = homeWorkLogMapper;
	} 
	
	
}
