package com.books.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.books.model.Tag;
import com.books.model.TagCount;

/**
 * RowMapper for Tag
 */
public class TagCountRowMapper implements RowMapper<TagCount> {   
	
	public TagCountRowMapper() {
		
	}
	/**
	 * maps the rows for tag
	 */
	public TagCount mapRow(ResultSet rs, int rowNum) throws SQLException {
		TagCount tagCount = new TagCount();
		Tag tag = new Tag();
		tagCount.setTagCount(rs.getInt("COUNT"));
		tag.setTagId(rs.getInt("TAGID"));
		tag.setTagName(rs.getString("TAGNAME"));
		
		tagCount.setTag(tag);
	
		return tagCount;
	}
}