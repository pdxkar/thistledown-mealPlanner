package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.Component;

/**
 * RowMapper for Component
 * 
 * Pulls info from the basecomponent DB table.
 */
public class ComponentRowMapper implements RowMapper<Component> {   
	
	public ComponentRowMapper() {
		
	}

	/**
	 * Maps result set for the Component table.
	 * @params ResultSet rs, int rowNum
	 * @return Component component
	 */
	public Component mapRow(ResultSet rs, int rowNum) throws SQLException {
		Component component = new Component();
		component.setItemid(rs.getInt("ITEMID"));
		component.setItemname(rs.getString("ITEMNAME"));	
		component.setCategory(rs.getInt("CATEGORY"));
		component.setBasequantity(rs.getFloat("BASEQUANTITY"));
		component.setBaseunitofmeasure(rs.getString("BASEUNITOFMEASURE"));
		component.setCalories(rs.getInt("CALORIES"));
		component.setCarbs(rs.getInt("CARBS"));
		component.setProtein(rs.getInt("PROTEIN"));
		component.setFiber(rs.getInt("FIBER"));
		component.setSugar(rs.getInt("SUGAR"));
		component.setFat(rs.getInt("FAT"));
		component.setImage(rs.getString("IMAGE"));
		component.setCholesterol(rs.getInt("CHOLESTEROL"));
		component.setIsFavorite(rs.getBoolean("ISFAVORITE"));

		return component;
	}
}