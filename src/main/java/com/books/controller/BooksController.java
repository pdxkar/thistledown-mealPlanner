package com.books.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.books.booklister.Bookinator;
import com.books.dao.ComponentDao;
/*import com.books.dao.DayMenuDao;
import com.books.dao.JdbcDayMenuDao;*/
import com.books.model.Component;
import com.books.model.DayMenu;

@Controller
@RequestMapping(value = "/data")
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class BooksController {
	
/*	@Autowired
	private JdbcDayMenuDao jdbcDayMenuDao;
	
	@Resource
	private DayMenuDao dayMenuDao;
*/

	
	
	//*******This is a calorie counter experiment******
	
	/**
	 * Inject (via configuration in spring-servlet.xml) an ComponentDao instance
	 */
	@Resource
	private ComponentDao componentDao;


	
//	//this is the good one
//	//call this service with URL http://localhost:8080/mealPlanner/data/components <= returns the list 	
//	//call this service with URL http://localhost:8080/mealPlanner/data/  <= returns the jsp page
//	//call this service with URL http://localhost:8080/mealPlanner/data/components?componentid=1 <= returns the whole list
	@RequestMapping(value = "/components", method = RequestMethod.GET, headers = { "Accept=application/json" })
	public @ResponseBody
	List<Component> getListOfComponents() {
		System.out.println("BooksController GET /data/components");  

		return Bookinator.getListOfComponents(componentDao);
	}
	
	/**
	 * @param request
	 *            : value - URL relative to /Books/data; method - GET; headers -
	 *            Accept=/text/xml,application/json
	 * @return JSON string representing books (including authors, media, tags,
	 *         physical book)
	 * 
	 *         This endpoint returns a single book as a JSON object/string.
	 */
/*	@RequestMapping(value = "/{mealPlanId}", method = RequestMethod.GET, headers = { "Accept=application/json" })
	public @ResponseBody
	DayMenu getDayMenuById(@PathVariable Integer mealPlanId) {
//		logger.info("BooksController GET /data/{isbn}");
		return Bookinator.getDayMenuById(dayMenuDao, componentDao, mealPlanId);
	}*/
	
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
	
	public void setComponentDao(ComponentDao componentDao) {
		this.componentDao = componentDao;
	}

	public ComponentDao getComponentDao() {
		return componentDao;
	}

/*	public DayMenuDao getDayMenuDao() {
		return dayMenuDao;
	}

	public void setDayMenuDao(DayMenuDao dayMenuDao) {
		this.dayMenuDao = dayMenuDao;
	}*/
	
}