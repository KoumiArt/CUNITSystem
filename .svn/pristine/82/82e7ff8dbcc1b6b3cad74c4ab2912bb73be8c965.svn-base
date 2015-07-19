package com.cunitsystem.listener;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.util.SpringUtils;

public class OnlineUserListener implements HttpSessionListener {
	 public void sessionCreated(HttpSessionEvent event) {
		 	Object obj = event.getSession().getAttribute("userSession");
		 	if(obj != null){
		        UserInfo u = (UserInfo) obj; 
		        //System.out.println("你登录网站========="+u.getUserSessionId());
		        u.setUserSessionId(event.getSession().getId());  
		        event.getSession().setAttribute("currentUser",u);  
		        OnlineUsers.getInstance().addUser(u);  
		 	}
	    }  
	  
	    public void sessionDestroyed(HttpSessionEvent event) {  
	        System.out.println("删除用户:"+event.getSession().getAttribute("currentUser"));  
	        OnlineUsers.getInstance().removeUser(event.getSession().getId());  
	        //移除相关的聊天信息
	        ServletContext application = SpringUtils.getServletContext();
	        Enumeration<String> attributeNames = application.getAttributeNames();
	        Object obj = event.getSession().getAttribute("userSession");
	        if(obj != null){
		        UserInfo u = (UserInfo) obj; 
				while(attributeNames.hasMoreElements()){
					String nextElement = attributeNames.nextElement();
					if(u.getUserType() == 2){
						if(nextElement.startsWith(u.getUserId()+"_")){
							application.removeAttribute(nextElement);
						}
						if(nextElement.contains("^"+u.getUserId())||nextElement.contains(u.getUserId()+"^")){
							application.removeAttribute(nextElement);
						}
			        }else if(u.getUserType() == 3){
			        	if(nextElement.endsWith("_"+u.getUserId())){
			        		application.removeAttribute(nextElement);
						}
			        }
				}
	        }
	    }  
}
