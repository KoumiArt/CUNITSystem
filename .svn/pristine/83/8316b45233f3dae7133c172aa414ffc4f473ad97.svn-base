package com.cunitsystem.listener;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.cunitsystem.entity.UserInfo;

public class OnlineUsers implements HttpSessionBindingListener {
	private Map<String, UserInfo> users = new HashMap<String, UserInfo>();

	private static OnlineUsers onlineUsers = new OnlineUsers();

	public static OnlineUsers getInstance() {
		return onlineUsers;
	}

	/**
	 * @return
	 */
	public Collection<UserInfo> getUsers() {
		return users.values();
	}

	public void addUser(UserInfo user) {
		users.put(user.getUserSessionId()+"", user);
	}

	public void removeUser(String userId) {
		users.remove(userId);
	}

	/**
	 * 对象实例(即OnlineUserListener的实例)作为一个属性被设置到session的
	 * 时候，会调用本方法，这种情况一般发生在点击登录按钮以后的处理过程中 设置
	 * 
	 * @see javax.servlet.http.HttpSessionBindingListener#valueBound(javax.servlet.http.HttpSessionBindingEvent)
	 */
	public void valueBound(HttpSessionBindingEvent event) {
		// 现在暂时不需要额外处理，你可以在这里记录日志等
	}

	/**
	 * 当Session超时，或本实例被从session中移除的时候被调用，这种情况一般 发生在注销方法的处理过程中
	 * 
	 * @see javax.servlet.http.HttpSessionBindingListener#valueUnbound(javax.servlet.http.HttpSessionBindingEvent)
	 */
	public void valueUnbound(HttpSessionBindingEvent event) {
		try {
			HttpSession session = event.getSession();
			UserInfo u = (UserInfo) session.getAttribute("currentUser");
			//System.out.println("删除用户:" + u.getLoginName());
			this.removeUser(u.getUserId()+"");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
}
