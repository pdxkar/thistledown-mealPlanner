package com.books.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.books.model.Component;
import com.books.rowmapper.ComponentRowMapper;

/**

 * 
 */
public class JdbcComponentDao extends JdbcDaoSupport implements ComponentDao {
	
	/**
	 * @param
	 * @return list of all components
	 */
	public List<Component> getListOfComponents() {
		return getJdbcTemplate().query(Component.GET_ALL_COMPONENTS, new ComponentRowMapper());
	}
	
	/**
	 * @param
	 * @return list of all components associated with a given DayMenu
	 */
	public List<Component> getListOfComponentsForDayMenu(int dayMenuId) {
		return getJdbcTemplate().query(Component.GET_ALL_COMPONENTS_IN_A_DAYMENU, new ComponentRowMapper(), new Object[]{dayMenuId});
	}

}