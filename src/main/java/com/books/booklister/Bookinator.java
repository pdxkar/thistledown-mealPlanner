package com.books.booklister;

import java.util.List;

import com.books.dao.ComponentDao;
//import com.books.dao.DayMenuDao;
import com.books.model.Component;
import com.books.model.DayMenu;

public class Bookinator {

	/**
	 * @param componentDao
	 * @return list of Component objects
	 */
	public static List<Component> getListOfComponents(ComponentDao componentDao) {
		
		return componentDao.getListOfComponents();
	}
	
/*	*//**
	 * @param componentDao
	 * @return list of DayMenu objects (dayMenu name plus all the Components that make up the menu)
	 *//*
	public static List<DayMenu> getListOfDayMenus(DayMenuDao dayMenuDao, ComponentDao componentDao) {
		
	List<DayMenu> dayMenuList = dayMenuDao.getListOfDayMenus();
	
	for (DayMenu dayMenu : dayMenuList) {
	//	dayMenu.setComponentList(componentDao.getListOfComponentsForDayMenu(dayMenu.getDayMenuId()));
		dayMenu.setComponentList(componentDao.getListOfComponentsForDayMenu(1));
	}
	
	return dayMenuList;
	}
}*/

/*	public static DayMenu getDayMenuById(DayMenuDao dayMenuDao, ComponentDao componentDao, int dayMenuId){		

		DayMenu dayMenuById = dayMenuDao.getDayMenuById(dayMenuId);
		dayMenuById.setComponentList(componentDao.getListOfComponentsForDayMenu(dayMenuById.getDayMenuId()));
		return dayMenuById;
		
	}*/

}