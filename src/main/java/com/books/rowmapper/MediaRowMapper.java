package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.Media;
import com.books.model.MediaType;

/**
 * RowMapper for Book
 * 
 * @author Team ExtraterRESTrial
 */
public class MediaRowMapper implements RowMapper<Media> {

	public MediaRowMapper() {

	}

	/**
	 * maps the rows for tag
	 */
	public Media mapRow(ResultSet rs, int rowNum) throws SQLException {
		Media media = new Media();
		media.setMediaDescription(rs.getString("DESCRIPTION"));
		media.setMediaType(MediaType.get(rs.getInt("MEDIATYPE")).getStringValue());
		media.setPhysicalMediaId(rs.getInt("PHYSICALMEDIAID"));
		media.setStatus(rs.getString("STATUS"));

		return media;
	}

}