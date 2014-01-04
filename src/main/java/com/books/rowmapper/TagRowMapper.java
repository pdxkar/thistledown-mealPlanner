package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.Tag;

/**
 * RowMapper for Tag
 */
public class TagRowMapper implements RowMapper<Tag> {   
	
	public TagRowMapper() {
		
	}
	/**
	 * maps the rows for tag
	 */
	public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
		Tag tag = new Tag();
		tag.setTagName(rs.getString("TAGNAME"));
		tag.setTagId(rs.getInt("TAGID"));
	
		return tag;
	}
}