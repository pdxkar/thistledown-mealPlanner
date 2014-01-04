package com.books.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.books.model.Author;
import com.books.rowmapper.AuthorRowMapper;

/**
 * The JdbcAuthorDao class allows access to the author information stored in
 * the database using named parameters queries.
 * 
 * This class extends SimpleJdbcDaoSupport, where the JdbcTemplate is instantiated
 * and implements AuthorDao, which specifies the client/server contract for Authors
 */

public class JdbcAuthorDao extends JdbcDaoSupport implements AuthorDao {
	
	/**
	 * @param bookId - database primary key for book
	 * @return list of Authors associated with that book
	 */
	public List<Author> getListOfAuthorsForBook(int bookId) {
		return getJdbcTemplate().query(Author.GET_ALL_AUTHORS_FOR_BOOK, new AuthorRowMapper(), new Object[]{bookId}); 
	}
}