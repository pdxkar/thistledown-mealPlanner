package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.DayMenu;

public class DayMenuRowMapper implements RowMapper<DayMenu>{

	public DayMenuRowMapper() {
		
	}
	
	public DayMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
		DayMenu dayMenu = new DayMenu();
		dayMenu.setDayMenuId(rs.getInt("DAYMENUID"));
		dayMenu.setDayMenuName(rs.getString("DAYMENUNAME"));
		
		return dayMenu;
	}
}
