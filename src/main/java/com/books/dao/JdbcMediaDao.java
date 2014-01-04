package com.books.dao;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.books.model.Media;
import com.books.rowmapper.MediaRowMapper;

/**
 * The JdbcMediaDao class allows access to the media information stored in
 * the database using named parameters queries.
 * 
 * This class extends SimpleJdbcDaoSupport, where the JdbcTemplate is instantiated,
 * and implements MediaDao, which specifies the client/server contract for Media
 * 
 */
public class JdbcMediaDao extends JdbcDaoSupport implements MediaDao {
	
	/**
	 * @param physicalBookId - database primary key for physical book
	 * @return list of Media objects associated with the physical book
	 */
	public List<Media> getListOfMediaForPhysicalBook(int physicalBookId) {
		return getJdbcTemplate().query(Media.GET_ALL_MEDIA_FOR_PHYSICALBOOK, new MediaRowMapper(), new Object[]{physicalBookId});

	}
}