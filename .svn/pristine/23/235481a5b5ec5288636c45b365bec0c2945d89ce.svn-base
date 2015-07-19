package com.cunitsystem.web;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cunitsystem.entity.HomeWork;
import com.cunitsystem.entity.HomeWorkComment;
import com.cunitsystem.entity.HomeWorkLog;
import com.cunitsystem.service.HomeWorkCommentService;
import com.cunitsystem.service.HomeWorkService;
import com.cunitsystem.service.StuHomeWorkService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SystemUtils;


/**
 * @author shy
 *
 */
@Controller
@RequestMapping("/client")
public class HomeWorkController {
	
	private HomeWorkService homeWorkService;
	private StuHomeWorkService stuHomeWorkService;
	private HomeWorkCommentService homeWorkCommentService;
	/**
	 * 布置作业
	 * @param lastTime 最迟提交时间
	 * @param questionArr 问题ID数组
	 * @return
	 */
	@RequestMapping("/homeWork")
	@ResponseBody
	public int homeWork(HomeWork homeWork){
		boolean checkCurDate = SystemUtils.checkCurDate(homeWork.getLastTime());
		if(checkCurDate){
			//入库
			boolean addResult = homeWorkService.addHomeWork(homeWork);
			if(addResult){
				return 1;//成功
			}
			return 2;//失败
		}
		return 3;//最迟提交时间至少要大于当前时间1小时！
	}
	
	@RequestMapping("/getHomeWork")
	public ModelAndView getHomeWork(int nwId){
		ModelAndView mav = new ModelAndView("client/homeWork");
		mav.addObject("lstHomeWork", homeWorkService.getHomeWork(nwId));
		return mav;
	}
	
	@RequestMapping("/seeHomeWork")
	public ModelAndView seeHomeWork(int nwId,int userId){
		ModelAndView mav = new ModelAndView("client/seeHomeWork");
		mav.addObject("lstHomeWork", homeWorkService.seeHomeWork(nwId, userId));
		return mav;
	}
	
	/**
	 * 提交作业
	 * @param optionIds
	 * @return
	 */
	@RequestMapping("/submitHomeWork")
	@ResponseBody
	public boolean submitHomeWork(int[] optionIds,int nwId){
		return stuHomeWorkService.addStuHomeWork(nwId,optionIds);
	}
	
	/**
	 * 提交作业批改
	 * @param homeWorkComment
	 * @return
	 */
	@RequestMapping("/submitHomeWorkComment")
	@ResponseBody
	public boolean submitHomeWorkComment(HomeWorkComment homeWorkComment){
		return homeWorkCommentService.addHomeWorkComment(homeWorkComment);
	}
	
	/**
	 * @param page
	 * @param rows
	 * @param homeWorkLog
	 * @return
	 */
	@RequestMapping("/getHomeWorkLogs")
	@ResponseBody
	public DataGrid getHomeWorkLogs(int page, int rows,HomeWorkLog homeWorkLog){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("homeWorkLog", homeWorkLog);
		return homeWorkService.getHomeWorkLogsByPage(map);
	}
	
	/**
	 * 查询当天有没有批阅过,批阅过返回true 没批阅返回false
	 * @param nwId
	 * @param stuId
	 * @return
	 */
	@RequestMapping("/checkHomeWorkComment")
	@ResponseBody
	public boolean checkHomeWorkComment(int nwId,int stuId){
		return homeWorkCommentService.queryDateCommentCount(nwId,stuId);
	}
	
	
	public void setHomeWorkService(HomeWorkService homeWorkService) {
		this.homeWorkService = homeWorkService;
	}

	public void setStuHomeWorkService(StuHomeWorkService stuHomeWorkService) {
		this.stuHomeWorkService = stuHomeWorkService;
	}

	public void setHomeWorkCommentService(
			HomeWorkCommentService homeWorkCommentService) {
		this.homeWorkCommentService = homeWorkCommentService;
	}
	
}
