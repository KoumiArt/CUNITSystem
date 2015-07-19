package com.cunitsystem.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.cunitsystem.entity.Menu;

/**
 * @author shy
 *
 */
@Component("menuMapper")
public interface MenuMapper {
	public List<Menu> getMenuByParentId(Menu menu);

}
