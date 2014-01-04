package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.books.model.Book;

/**
 * RowMapper for Book
 * 
 * Pulls info from the Book DB table.
 */
public class BookRowMapper implements RowMapper<Book> {   
	
	public BookRowMapper() {
		
	}

	/**
	 * Maps result set for the Book table.
	 * @params ResultSet rs, int rowNum
	 * @return Book book
	 */
	public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = new Book();
		book.setName(rs.getString("TITLE"));
		book.setImageUrl(rs.getString("IMAGE"));	
		book.setId(rs.getInt("BOOKID"));
		book.setSnippet(rs.getString("DESCRIPTION"));
		book.setPublisher(rs.getString("PUBLISHER"));
		book.setIsbn13(rs.getString("ISBN"));
		book.setPublishYear(rs.getInt("PUBLISHYEAR"));
	
		return book;
	}
}