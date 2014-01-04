package com.books.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.books.model.Tag;
import com.books.model.TagCount;
import com.books.rowmapper.TagCountRowMapper;
import com.books.rowmapper.TagRowMapper;

/**
 * The JdbcTagDao class allows access to the tags information stored in
 * the database using named parameters queries.
 * 
 * This class extends SimpleJdbcDaoSupport, where the JdbcTemplate is instantiated,
 *  * and implements TagDao, which specifies the client/server contract for Tags
 */

public class JdbcTagDao extends JdbcDaoSupport implements TagDao {

	/**
	 * @param bookId - books primary key
	 * @return list of Book objects
	 * 
	 * Use JdbcTemplate to return rows of Tags 
	 */
	public List<Tag> getListOfTagsForBook(int bookId) {
		return getJdbcTemplate().query(Tag.GET_ALL_TAGS_FOR_BOOK, new TagRowMapper(), new Object[]{bookId});
	}
	/**
	 * @return list of tags
	 */
	public List<Tag> getListOfTags() {
		return getJdbcTemplate().query(Tag.GET_ALL_TAGS, new TagRowMapper());
	}
	/**
	 * @return list of tags, including of count of books which use those tags
	 */
	public List<TagCount> getListOfTagCounts() {
		return getJdbcTemplate().query(TagCount.GET_TAG_COUNTS, new TagCountRowMapper());
	}
}
