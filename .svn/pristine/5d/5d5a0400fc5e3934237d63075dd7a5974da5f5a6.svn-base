package com.cunitsystem.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cunitsystem.entity.Menu;
import com.cunitsystem.mapper.MenuMapper;
import com.cunitsystem.service.MenuService;

/**
 * @author shy
 *
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService{
	private MenuMapper menuMapper;
	
	public List<Menu> getMenuByParentId(Menu menu){
		return menuMapper.getMenuByParentId(menu);
	}

	public MenuMapper getMenuMapper() {
		return menuMapper;
	}

	public void setMenuMapper(MenuMapper menuMapper) {
		this.menuMapper = menuMapper;
	}

}
