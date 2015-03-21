package com.books.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.books.booklister.Bookinator;
import com.books.dao.ComponentDao;
import com.books.dao.JdbcComponentDao;
import com.books.model.Component;

@Controller
@RequestMapping(value = "/data")
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class BooksController {
	
	@Autowired
	private JdbcComponentDao jdbcComponentDao;

	/**
	 * Handle any exceptions from queryForObject (e.g. query for bookid - not
	 * found) which return EmptyResultDataAccessException
	 * 
	 * @return 404 - not found
	 */
	@ExceptionHandler(org.springframework.dao.EmptyResultDataAccessException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public @ResponseBody
	void EmptyResultDataAccessException() {}
	
	
	//*******This is a calorie counter experiment******
	
	/**
	 * Inject (via configuration in spring-servlet.xml) an ComponentDao instance
	 */
	@Resource
	private ComponentDao componentDao;

	public void setComponentDao(ComponentDao componentDao) {
		this.componentDao = componentDao;
	}

	public ComponentDao getComponentDao() {
		return componentDao;
	}
	
	//call this service with URL http://localhost:8080/mealPlanner/data/components <= returns the list 	
	//call this service with URL http://localhost:8080/mealPlanner/data/  <= returns the jsp page
	//call this service with URL http://localhost:8080/mealPlanner/data/components?componentid=1 <= returns the whole list
	@RequestMapping(value = "/components", method = RequestMethod.GET, headers = { "Accept=application/json" })
	public @ResponseBody
	List<Component> getListOfComponents() {
		System.out.println("BooksController GET /data/components");  

		return Bookinator.getListOfComponents(componentDao);
	}
	
	// call this service with URL http://localhost:8080/mealPlanner/data/getQuickList <= can use this with POSTMAN
	@RequestMapping(value = "/getQuickList", method = RequestMethod.GET, headers = { "Accept=application/json" })
	public @ResponseBody
	List<Component> getQuickList() {
		System.out.println("BooksController GET /data/getQuickList");
		
		//Later we're going to need a userId too, but for now all favorites belong on the quicklist
		Boolean isFavorite = true;

		return Bookinator.getQuickList(componentDao, isFavorite);
	}
	
	/**
	 * Add a baseComponent to the database
	 * @param title
	 * @param description
	 * @param publisher
	 * @param isbn
	 * @param publishYear
	 * @param image
	 */
	// call this service with URL http://localhost:8080/mealPlanner/data/addComponent <= can use this with POSTMAN
	@ResponseBody
	@RequestMapping(value = "/addComponent", method = RequestMethod.POST, headers = { "Accept=application/json" })
	public void addComponent(
		//Component stuff		
		@RequestParam(value = "itemName", required = false) String itemName,
		@RequestParam(value = "category", required = false) Integer category,
		@RequestParam(value = "baseQuantity", required = false) Integer baseQuantity,
		@RequestParam(value = "baseUnitOfMeasure", required = false) String baseUnitOfMeasure,
		@RequestParam(value = "calories", required = false) Integer calories,
		@RequestParam(value = "isFavorite", required = false) Boolean isFavorite) {
		
		System.out.println("BooksController POST /data/addComponent");  
	
		jdbcComponentDao.addComponent(itemName, category, baseQuantity, baseUnitOfMeasure, calories, isFavorite);

	}
	
}