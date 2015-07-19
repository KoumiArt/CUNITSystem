package com.cunitsystem.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.service.LoginService;
import com.cunitsystem.util.Constants;

@Controller
@SessionAttributes(Constants.USER_INFO_SESSION)
public class LoginController {
	private LoginService loginService;
	
	@RequestMapping(value = "/login")
	public String login(UserInfo user, Model model) {
		if(user == null || user.getLoginName() == null || user.getLoginName().trim().length()<=0 || user.getLoginPwd() == null || user.getLoginPwd().trim().length()<=0)
			return "login";
		UserInfo u = loginService.login(user);
		if (u == null) {
			model.addAttribute("message", "用户名或密码不存在！");
			return "login";
		} else {
			model.addAttribute(Constants.USER_INFO_SESSION, u);
		}
		return "redirect:/menu/getMenus";
	}
	
	@RequestMapping("/logout")
	public void logout() {

	}
	
	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
}
