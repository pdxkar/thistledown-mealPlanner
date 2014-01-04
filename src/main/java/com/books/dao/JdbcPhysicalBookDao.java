package com.books.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.books.model.PhysicalBook;
import com.books.rowmapper.PhysicalBookRowMapper;

/**
 * The JdbcPhysicalBookDao class allows access to the physical book information stored in
 * the database using named parameters queries.
 * 
 * This class extends SimpleJdbcDaoSupport, where the JdbcTemplate is instantiated,
 * and implements PhysicalBookDao, which specifies the client/server contract for PhysicalBooks
 * 
 */

public class JdbcPhysicalBookDao extends JdbcDaoSupport implements PhysicalBookDao {
	
	/**
	 * @param bookId - database primary key for Books
	 * @return List of Physical Books
	 * 
	 *  Using the given bookId, retrieve all physical copies of the specified meta-data book
	 */
	public List<PhysicalBook> getListOfPhysicalBooks(int bookId) {
		return getJdbcTemplate().query(PhysicalBook.GET_ALL_PHYSICALBOOKS_FOR_BOOK, new PhysicalBookRowMapper(), new Object[]{bookId}); 
	}
}