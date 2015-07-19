package com.cunitsystem.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.service.UserService;
import com.cunitsystem.util.Constants;
import com.cunitsystem.util.SpringUtils;
import com.cunitsystem.web.bean.ChatBean;


@Controller
@SessionAttributes(Constants.USER_INFO_SESSION)
@RequestMapping("/chat")
@SuppressWarnings("unchecked")
public class ChatController {
	
	private UserService userService; 
	
	/**
	 * 获取聊天信息
	 * @param user 当前用户
	 * @param userId 与之聊天的用ID
	 * @return
	 */
	@RequestMapping("/getMsg")
	@ResponseBody
	public List<ChatBean> getMsg(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user,String teacherId){
		ServletContext application = SpringUtils.getServletContext();
		String chatSessionId = "";
		if(user.getUserType() == 2){
			chatSessionId = user.getUserId()+"_"+teacherId;
		} else if(user.getUserType() == 3){
			int curUserId = user.getUserId();
			Enumeration<String> attributeNames = application.getAttributeNames();
			while(attributeNames.hasMoreElements()){
				String nextElement = attributeNames.nextElement();
				if(nextElement.endsWith("_"+curUserId)){
					chatSessionId = nextElement;
				}
			}
		}
		Object msgBean = application.getAttribute(chatSessionId);
		if(msgBean != null){
			return (List<ChatBean>)msgBean;
		}
		return null;
	}
	
	
	/**
	 * 获取聊天信息
	 * @param user 当前用户
	 * @param userId 与之聊天的用ID
	 * @return
	 */
	@RequestMapping("/getMsgToMe")
	@ResponseBody
	public List<UserInfo> getMsgToMe(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user){
		ServletContext application = SpringUtils.getServletContext();
		List<UserInfo> userList = new ArrayList<UserInfo>();
		int curUserId = user.getUserId();
		Enumeration<String> attributeNames = application.getAttributeNames();
		while(attributeNames.hasMoreElements()){
			String nextElement = attributeNames.nextElement();
			if(user.getUserType() == 2){
				if(nextElement.endsWith(curUserId+"_")){
					String userId = nextElement.substring(nextElement.indexOf("_")+1);
					UserInfo userInfo = userService.getUserInfoById(Integer.parseInt(userId));
					userList.add(userInfo);
				}
			} else if(user.getUserType() == 3){
				if(nextElement.endsWith("_"+curUserId)){
					String userId = nextElement.substring(0,nextElement.indexOf("_"));
					UserInfo userInfo = userService.getUserInfoById(Integer.parseInt(userId));
					userList.add(userInfo);
				}
			}
		}
		return userList;
	}
	
	
	/**
	 * 发送一条消息
	 * @param user
	 * @param chatBean
	 * @param teacherId
	 */
	@RequestMapping("/sendMsg")
	@ResponseBody
	public void addMsg(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user,ChatBean chatBean,String teacherId){
		ServletContext application = SpringUtils.getServletContext();
		Object msgBean = null;
		chatBean.setOwnerUserId(user.getUserId());
		if(user.getUserType() == 2){
			msgBean = application.getAttribute(user.getUserId()+"_"+teacherId);
			chatBean.setOwnerName(user.getStudent().getsName());
		} else if(user.getUserType() == 3){
			msgBean = application.getAttribute(teacherId+"_"+user.getUserId());
			chatBean.setOwnerName(user.getTeacher().gettName());
		}
		List<ChatBean>  msgList;
		if(msgBean != null){
			msgList = (List<ChatBean>)msgBean;
		} else {
			msgList = new ArrayList<ChatBean>();
		}
		chatBean.setTime(new Date());
		msgList.add(chatBean);
		//当前用户ID + 老师的ID 作为聊天的唯一标示
		application.setAttribute(user.getUserId()+"_"+teacherId, msgList);
	}

	/**
	 * 获取组聊天消息
	 * @param user
	 * @param userId
	 * @return
	 */
	@RequestMapping("/getDiscussionMsg")
	@ResponseBody
	public List<ChatBean> getDiscussionMsg(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user,String[] userIdArr,String curDisChatId){
		ServletContext application = SpringUtils.getServletContext();
		String chatSessionId = "";
		if(curDisChatId != null && curDisChatId.trim().length() >0){
			chatSessionId = curDisChatId;
		} else {
			for (int i = 0; i < userIdArr.length; i++) {
				chatSessionId += user.getUserId()+"^"+userIdArr[i];
				if(i < userIdArr.length-1)
					chatSessionId += "^";
			}
		}
		Object msgBean = application.getAttribute(chatSessionId);
		if(msgBean != null){
			return (List<ChatBean>)msgBean;
		}
		return null;
	}
	
	/**
	 * 讨论组发送消息
	 * @param user
	 * @param chatBean
	 * @param userId
	 */
	@RequestMapping("/sendDiscussionMsg")
	@ResponseBody
	public void addDiscussionMsg(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user,ChatBean chatBean,String[] userIdArr,String curDisChatId){
		ServletContext application = SpringUtils.getServletContext();
		Object msgBean = null;
		String chatSessionId = "";
		chatBean.setOwnerUserId(user.getUserId());
		if(curDisChatId != null && curDisChatId.trim().length() >0){
			chatSessionId = curDisChatId;
		} else {
			for (int i = 0; i < userIdArr.length; i++) {
				chatSessionId += user.getUserId()+"^"+userIdArr[i];
				if(i < userIdArr.length-1)
					chatSessionId += "^";
			}
		}
		msgBean = application.getAttribute(chatSessionId);
		chatBean.setOwnerName(user.getStudent().getsName());
		List<ChatBean>  msgList;
		if(msgBean != null){
			msgList = (List<ChatBean>)msgBean;
		} else {
			msgList = new ArrayList<ChatBean>();
		}
		chatBean.setTime(new Date());
		msgList.add(chatBean);
		application.setAttribute(chatSessionId, msgList);
	}
	
	/**
	 * @param user
	 * @return
	 */
	@RequestMapping("/getDiscussionMsgToMe")
	@ResponseBody
	public List<UserInfo> getDiscussionMsgToMe(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user){
		ServletContext application = SpringUtils.getServletContext();
		List<UserInfo> userList = new ArrayList<UserInfo>();
		int curUserId = user.getUserId();
		Enumeration<String> attributeNames = application.getAttributeNames();
		while(attributeNames.hasMoreElements()){
			String nextElement = attributeNames.nextElement();
			System.out.println(nextElement);
			if(nextElement.contains("^"+curUserId) || nextElement.contains(curUserId+"^")){
				String[] userIds = nextElement.split("\\^");
				for (int i = 0; i < userIds.length; i++) {
					if(!userIds[i].equals(curUserId+"")){
						UserInfo userInfo = userService.getUserInfoById(Integer.parseInt(userIds[i]));
						userInfo.setDisChatId(nextElement);
						userList.add(userInfo);
					}
				}
			}
		}
		return userList;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
