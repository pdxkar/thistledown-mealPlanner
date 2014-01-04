package com.books.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.books.model.Book;
import com.books.rowmapper.BookRowMapper;

/**
 * The JdbcBooksDao class allows access to the book information stored in
 * the database using named parameters queries.
 * 
 * This class extends SimpleJdbcDaoSupport, where the JdbcTemplate is instantiated
 * and implements BookDao, which specifies the client/server contract for Book
 * 
 */
public class JdbcBookDao extends JdbcDaoSupport implements BookDao {
	
	/**
	 * @param
	 * @return list of all books (this is the meta-data for books, not physical books)
	 */
	public List<Book> getListOfBooks() {
		return getJdbcTemplate().query(Book.GET_ALL_BOOK_RECORDS, new BookRowMapper());
	}
	
	/**
	 * @param
	 * @return one book by bookId (this is the meta-data for books, not physical books)
	 */
	public Book getBookByIsbn(String isbn) {

		return getJdbcTemplate().queryForObject(Book.GET_BOOK_BY_ISBN, new BookRowMapper(), new Object[]{isbn});		
	}
}