package com.cunitsystem.interceptor;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.listener.OnlineUsers;
import com.cunitsystem.util.Constants;
import com.cunitsystem.util.SpringUtils;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//就简单判断了一下，如果要详细控制可以用spring security
		String url = request.getRequestURI();
		if(url.endsWith("logout") || url.endsWith("manager/logout")){
			if(request.getSession() != null && request.getSession().getAttribute(Constants.USER_INFO_SESSION) != null){
		        Object obj = request.getSession().getAttribute("userSession");
				request.getSession().removeAttribute("userSession");
				OnlineUsers.getInstance().removeUser(request.getSession().getId());
				//移除用户相关聊天信息
		        ServletContext application = SpringUtils.getServletContext();
		        Enumeration<String> attributeNames = application.getAttributeNames();
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
		if(url.endsWith("registerUser")){
			return true;
		}
		if(url.endsWith("editUserInfo")){
			return true;
		}
		if(url.endsWith("editPwd")){
			return true;
		}
		if(url.endsWith("checkLoginName")){
			return true;
		}
		if(url.endsWith("checkCardId")){
			return true;
		}
		if(url.endsWith("childProductAll")){
			return true;
		}
		if(url.endsWith("login"))
			return true;
		if(request.getSession() != null && request.getSession().getAttribute(Constants.USER_INFO_SESSION) != null) 
			return true;
		if (request.getHeader("x-requested-with") != null  
                && request.getHeader("x-requested-with")  
                        .equalsIgnoreCase("XMLHttpRequest"))//如果是ajax请求响应头会有，x-requested-with；  
        {  
            response.setHeader("sessionstatus", "timeout");//在响应头设置session状态  
            response.getWriter().write("{status:302,location:'"+request.getContextPath()+"/jsp/login.jsp'}");
            response.getWriter().flush();
            response.getWriter().close();
            return false;  
        } else {
			response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
		}
		return false;
			
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		Object obj = request.getSession().getAttribute("userSession");
	 	if(obj != null){
	        UserInfo u = (UserInfo) obj; 
	        u.setUserSessionId(request.getSession().getId());  
	        request.getSession().setAttribute("currentUser",u);  
	        OnlineUsers.getInstance().addUser(u);  
	 	}
		super.afterCompletion(request, response, handler, ex);
	}
	
}
