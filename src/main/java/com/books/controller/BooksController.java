package com.books.controller;

import java.awt.print.Book;
import java.util.List;

import javax.annotation.Resource;

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
import com.books.model.Component;

@Controller
@RequestMapping(value = "/data")
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class BooksController {
//	/**
//	 * Inject (via configuration in spring-servlet.xml) an AuthorDao instance
//	 */
//	@Resource
//	private AuthorDao authorDao;
//
//	public void setAuthorDao(AuthorDao authorDao) {
//		this.authorDao = authorDao;
//	}
//
//	public AuthorDao getAuthorDao() {
//		return authorDao;
//	}
//
//	/**
//	 * Inject (via configuration in spring-servlet.xml) an BookDao instance
//	 */
//	@Resource
//	private BookDao bookDao;
//
//	public void setBookDao(BookDao bookDao) {
//		this.bookDao = bookDao;
//	}
//
//	public BookDao getBookDao() {
//		return bookDao;
//	}
//
//	/**
//	 * Inject (via configuration in spring-servlet.xml) an MediaDao instance
//	 */
//	@Resource
//	private MediaDao mediaDao;
//
//	public void setMediaDao(MediaDao mediaDao) {
//		this.mediaDao = mediaDao;
//	}
//
//	public MediaDao getMediaDao() {
//		return mediaDao;
//	}
//
//	/**
//	 * Inject (via configuration in spring-servlet.xml) an PhysicalBookDao
//	 * instance
//	 */
//	@Resource
//	private PhysicalBookDao physicalBookDao;
//
//	public void setPhysicalBookDao(PhysicalBookDao physicalBookDao) {
//		this.physicalBookDao = physicalBookDao;
//	}
//
//	public PhysicalBookDao getPhysicalBookDao() {
//		return physicalBookDao;
//	}
//
//	/**
//	 * Inject (via configuration in spring-servlet.xml) an TagDao instance
//	 */
//	@Resource
//	private TagDao tagDao;
//
//	public void setTagDao(TagDao tagDao) {
//		this.tagDao = tagDao;
//	}
//
//	public TagDao getTagDao() {
//		return tagDao;
//	}
//	
//	/**
//	 * @param request
//	 *            : value - URL relative to /Books; method - GET; headers -
//	 *            Accept=/text/xml,application/json
//	 * @return JSON string representing books (including authors, media, tags,
//	 *         physical book)
//	 * 
//	 *         This endpoint returns the list of books in the database, as a
//	 *         JSON object/string.
//	 */
//	@RequestMapping(method = RequestMethod.GET, headers = { "Accept=application/json" })
//	public @ResponseBody
//	List<Book> getListOfBooks() {
//		System.out.println("BooksController GET /data");  //TODO Replace print statements with log4j logging
//
//		return Bookinator.getListOfBooks(bookDao, tagDao, authorDao, physicalBookDao, mediaDao);
//	}
//
//	/**
//	 * @param request
//	 *            : value - URL relative to /Books/data; method - GET; headers -
//	 *            Accept=/text/xml,application/json
//	 * @return JSON string representing books (including authors, media, tags,
//	 *         physical book)
//	 * 
//	 *         This endpoint returns a single book as a JSON object/string.
//	 */
//	@RequestMapping(value = "/{isbn}", method = RequestMethod.GET, headers = { "Accept=application/json" })
//	public @ResponseBody
//	Book getBookByIsbn(@PathVariable String isbn) {
//		System.out.println("BooksController GET /data/{isbn}");  //TODO Replace print statements with log4j logging
//
//		return Bookinator.getBookByIsbn(bookDao, tagDao, authorDao, physicalBookDao, mediaDao, isbn);
//	}
//
//	/**
//	 * @return list of tags with count of books using each tag
//	 */
//	@RequestMapping(value = "/tags", method = RequestMethod.GET)
//	public @ResponseBody
//	List<TagCount> getListOfTags() {
//		System.out.println("BooksController GET data/tags");  //TODO Replace print statements with log4j logging
//
//		return Bookinator.getListOfTagCounts(tagDao);
//	}

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
	
	//call this service with URL http://localhost:8080/mealPlanner/data/components?componentid=1	
	@RequestMapping(value = "/components", method = RequestMethod.GET, headers = { "Accept=application/json" })
	public @ResponseBody
	List<Component> getListOfComponents() {
		System.out.println("BooksController GET /data/components");  

		return Bookinator.getListOfComponents(componentDao);
	}

}