package com.cunitsystem.service;

import java.util.List;

import com.cunitsystem.entity.Menu;

/**
 * @author shy
 *
 */
public interface MenuService {
	public List<Menu> getMenuByParentId(Menu menu);

}
