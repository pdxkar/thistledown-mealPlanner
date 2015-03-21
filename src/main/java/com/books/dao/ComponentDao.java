package com.books.dao;

import java.util.List;

import com.books.model.Component;

/*
 * Interface for Book object
 * 
 * This interface specifies a contract between the User Experience and the server/database
 * This interface is implemented as a specific persistence resource - Jdbc, e.g.
 * 
 */

public interface ComponentDao {

		public List<Component> getListOfComponents();
		
		public List<Component> getQuickList(Boolean isFavorite);
		
		public void addComponent(final String itemName, final Integer category, final Integer baseQuantity, final String baseUnitOfMeasure, final Integer calories, final Boolean isFavorite);

}


