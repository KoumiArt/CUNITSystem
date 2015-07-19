package com.cunitsystem.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cunitsystem.entity.Enrol;
import com.cunitsystem.entity.NetWorkCourse;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.service.EnrolService;
import com.cunitsystem.service.NetWorkCourseService;
import com.cunitsystem.util.DataGrid;
import com.cunitsystem.util.SystemUtils;

@Controller
@RequestMapping("/manager")
public class NetWorkCourseController {
	
	private NetWorkCourseService netWorkCourseService;
	
	private EnrolService enrolService;
	
	@RequestMapping("/netWorkCourseList")
	@ResponseBody
	public DataGrid getNetWorkCourseList(int page, int rows,NetWorkCourse netWorkCourse){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("netWorkCourse", netWorkCourse);
		return netWorkCourseService.getNetWorkCoursesByPage(map);
	}
	
	@RequestMapping("/saveNetWorkCourse")
	@ResponseBody
	public boolean saveNetWorkCourse(NetWorkCourse netWorkCourse){
		boolean result = false;
		if(netWorkCourse.getNwId() >0){
			result = netWorkCourseService.updateNetWorkCourse(netWorkCourse);
		} else {
			result = netWorkCourseService.addNetWorkCourse(netWorkCourse);
		}
		return result;
	}

	@RequestMapping("/getNetWorkCourse")
	@ResponseBody
	public NetWorkCourse getNetWorkCourse(int nwId){
		return netWorkCourseService.getNetWorkCourseById(nwId);
	}
	
	@RequestMapping("/deleteNetWorkCourse")
	@ResponseBody
	public boolean deleteNetWorkCourse(NetWorkCourse netWorkCourse){
		return netWorkCourseService.deleteNetWorkCourse(netWorkCourse);
	}
	
	@RequestMapping("/batchDeleteNetWorkCourse")
	@ResponseBody
	public boolean batchDeleteNetWorkCourse(int[] netWorkCourseArr){
		return netWorkCourseService.batchDeleteNetWorkCourse(netWorkCourseArr);
	}
	
	@RequestMapping("/addEnrol")
	@ResponseBody
	public boolean addEnrol(int nwId){
		Enrol enrol = new Enrol();
		enrol.setNwId(nwId);
		UserInfo curUser = SystemUtils.getCurUserInfo();
		enrol.setFkId(curUser.getUserId());
		//学生
		if(curUser.getUserType() ==2){
			enrol.setType(1);
		} else if(curUser.getUserType() ==3){//老师
			enrol.setType(2);
		}
		return enrolService.addEnrol(enrol);
	}
	
	/**
	 * 
	 */
	@RequestMapping("/getMyNetWorkCourse")
	@ResponseBody
	public DataGrid getMyNetWorkCourse(int page, int rows){
		Map<String, Object> map = new HashMap<String, Object>();
		UserInfo curUser = SystemUtils.getCurUserInfo();
		Enrol enrol = new Enrol();
		enrol.setFkId(curUser.getUserId());
		//学生
		if(curUser.getUserType() ==2){
			enrol.setType(1);
		} else if(curUser.getUserType() ==3){//老师
			enrol.setType(2);
		}
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("enrol", enrol);
		return enrolService.getMyNetWorkCourse(map);
	}
	
	@RequestMapping("/getQuestionRandom")
	public ModelAndView getQuestionRandom(int nwId){
		ModelAndView mav = new ModelAndView("/client/testPaper");
		mav.addObject("lstQuestion", enrolService.getQuestionRandom(nwId));
		return mav;
	}
	
	@RequestMapping("/stuNetWorkCourseList")
	@ResponseBody
	public DataGrid getStuNetWorkCourseList(int page, int rows,int nwId,String sName){
		Map<String, Object> map = new HashMap<String, Object>();
		Enrol enrol = new Enrol();
		enrol.setNwId(nwId);
		enrol.setType(1);
		enrol.setsName(sName);
		map.put("begin", ((page-1)*rows)+1);
		map.put("end", page*rows);
		map.put("enrol", enrol);
		return enrolService.getMyNetWorkCourse(map);
	}
	
	public void setEnrolService(EnrolService enrolService) {
		this.enrolService = enrolService;
	}

	public void setNetWorkCourseService(NetWorkCourseService netWorkCourseService) {
		this.netWorkCourseService = netWorkCourseService;
	}

	
}
