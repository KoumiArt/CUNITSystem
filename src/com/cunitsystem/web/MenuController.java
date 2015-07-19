package com.cunitsystem.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cunitsystem.entity.Menu;
import com.cunitsystem.entity.UserInfo;
import com.cunitsystem.service.MenuService;
import com.cunitsystem.util.Constants;

@Controller
@SessionAttributes(Constants.USER_INFO_SESSION)
@RequestMapping("/menu")
public class MenuController {
	private MenuService menuService;
	
	@RequestMapping(value = "/getMenus")
	public ModelAndView getMenus(@ModelAttribute(Constants.USER_INFO_SESSION) UserInfo user) {
		ModelAndView mav = null;
		if(user.getUserType() == 1)
			mav = new ModelAndView("manager/index");
		else
			mav = new ModelAndView("index");
		Menu menu = new Menu();
		menu.setParentMenuId(0);
		menu.setMenuType(user.getUserType());
		List<Menu> lstMenuParent = menuService.getMenuByParentId(menu);
		Map<Integer, List<Menu>> mapMenuChild = new HashMap<Integer, List<Menu>>();
		for (Menu mu : lstMenuParent) {
			menu.setParentMenuId(mu.getMenuId());
			List<Menu> lstMenuChild = menuService.getMenuByParentId(menu);
			if(lstMenuChild != null && lstMenuChild.size() > 0){
				mapMenuChild.put(mu.getMenuId(),lstMenuChild);
			}
		}
		mav.addObject( "mapMenuChild", mapMenuChild);
		mav.addObject( "lstMenuParent", lstMenuParent);
		return  mav;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

}
