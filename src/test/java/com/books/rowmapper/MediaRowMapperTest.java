package com.books.rowmapper;

import java.sql.ResultSet;

import junit.framework.Assert;

import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.jdbc.core.RowMapper;

import com.books.model.Media;
import com.books.model.MediaType;

public class MediaRowMapperTest {
	
	ResultSet resultSet = Mockito.mock(ResultSet.class);
	
	@Test
	public void test() throws Exception {
		Mockito.when(resultSet.getString("DESCRIPTION")).thenReturn("MediaDescription");		
		Mockito.when(resultSet.getInt("MEDIATYPE")).thenReturn(2);		// test incorporates MediaType enum
		Mockito.when(resultSet.getInt("PHYSICALMEDIAID")).thenReturn(4);
		Mockito.when(resultSet.getString("STATUS")).thenReturn("MediaStatus");		
		
		RowMapper<Media> rowMapper = new MediaRowMapper();
		Media media = rowMapper.mapRow(resultSet,1);
		
		Assert.assertEquals(media.getMediaDescription(), "MediaDescription");
		Assert.assertEquals(media.getMediaType(), MediaType.get(2).getStringValue());	// test incorporates MediaType enum
		Assert.assertEquals(media.getPhysicalMediaId(), 4);
		Assert.assertEquals(media.getStatus(), "MediaStatus");
	}
}

