package com.books.model;

import java.util.List;

public class DayMenu {
	
	//SQL query to get a specific daymenu with components attached
//	public static final String GET_DAYMENU_BY_DAYMENUID = "select itemname from basecomponent, basecomponent_daymenu "
//	+ " where basecomponent_daymenu.daymenuid = 1 "
//	+ " and basecomponent_daymenu.componentid = basecomponent.itemid";
	
	// SQL query to get all daymenus:
	public static final String GET_ALL_DAYMENUS = "SELECT daymenuid, daymenuname"
			+ " FROM daymenu";
	
/*	public static final String GET_DAYMENU_BY_ID = "SELECT daymenuid, daymenuname "*/
	public static final String GET_DAYMENU_BY_ID = "SELECT * "
			+ " FROM daymenu"
			+ " WHERE daymenuid = ?";
	//			+ " WHERE daymenuid = ?";
	
	// SQL query to get one book by isbn:
/*	public static final String GET_BOOK_BY_ISBN = "SELECT title, description, bookid, publisher, isbn, publishyear, image "
			+ "FROM book "
			+ "WHERE isbn = ?";*/
	
/*	public static final String GET_ALL_COMPONENTS_IN_A_DAYMENU = "SELECT bc.itemid, bc.itemname "
			+ " FROM basecomponent bc, basecomponent_daymenu bcdm, daymenu dm"
			+ " WHERE dm.daymenuid = 1 "
			+ " and bcdm.daymenuid = 1 "
			+ " and bcdm.componentid = bc.itemid";*/

	//private variables
	private int dayMenuId; 
	private String dayMenuName;
	private List<Component> componentList;
	
	//empty constructor
	public DayMenu() {
		
	}

	//getters and setters
	public int getDayMenuId() {
		return dayMenuId;
	}

	public void setDayMenuId(int dayMenuId) {
		this.dayMenuId = dayMenuId;
	}

	public String getDayMenuName() {
		return dayMenuName;
	}

	public void setDayMenuName(String dayMenuName) {
		this.dayMenuName = dayMenuName;
	}

	public List<Component> getComponentList() {
		return componentList;
	}

	public void setComponentList(List<Component> componentList) {
		this.componentList = componentList;
	}
}
