package com.books.booklister;

import java.awt.print.Book;
import java.util.List;

import com.books.dao.ComponentDao;
import com.books.model.Component;

public class Bookinator {

	/**
	 * @param componentDao
	 * @return list of Component objects
	 */
	public static List<Component> getListOfComponents(ComponentDao componentDao) {
		
		return componentDao.getListOfComponents();
	}
}