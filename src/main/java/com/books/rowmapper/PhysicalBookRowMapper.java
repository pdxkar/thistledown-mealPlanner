package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.PhysicalBook;

/**
 * RowMapper for PhysicalBooks
 */
public class PhysicalBookRowMapper implements RowMapper<PhysicalBook> {   
	
	public PhysicalBookRowMapper() {
		
	}
	/**
	 * maps the rows for tag
	 */
	public PhysicalBook mapRow(ResultSet rs, int rowNum) throws SQLException {
		PhysicalBook physicalBook = new PhysicalBook();
		physicalBook.setPhysicalBookId(rs.getInt("PHYSICALBOOKID"));
		physicalBook.setOwner(rs.getString("OWNER"));
		physicalBook.setStatus(rs.getString("STATUS"));
		physicalBook.setLocation(rs.getString("LOCATION"));

		return physicalBook;
	}
}