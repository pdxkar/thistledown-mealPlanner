package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.Author;

/**
 * RowMapper for Authors
 */
public class AuthorRowMapper implements RowMapper<Author> {   
	
	public AuthorRowMapper() {
	}
	/**
	 * maps the rows for Authors
	 */
	public Author mapRow(ResultSet rs, int rowNum) throws SQLException {
		Author author = new Author();
		author.setAuthorId(rs.getInt("AUTHORID"));
		author.setDescription(rs.getString("DESCRIPTION"));
		author.setFirstName(rs.getString("FIRSTNAME"));
		author.setLastName(rs.getString("LASTNAME"));

		return author;
	}
}