//package com.books.rowmapper;
//
//import java.sql.ResultSet;
//
//import junit.framework.Assert;
//
//import org.junit.Test;
//import org.mockito.Mockito;
//import org.springframework.jdbc.core.RowMapper;
//
//public class TagRowMapperTest {
//	
//	ResultSet resultSet = Mockito.mock(ResultSet.class);
//	
//	@Test
//	public void test() throws Exception {
//		Mockito.when(resultSet.getInt("TAGID")).thenReturn(1);
//		Mockito.when(resultSet.getString("TAGNAME")).thenReturn("SomeTag");
//		
//		RowMapper<Tag> rowMapper = new TagRowMapper();
//		Tag tag = rowMapper.mapRow(resultSet,1);
//		
//		Assert.assertEquals(tag.getTagId(), 1);
//		Assert.assertEquals(tag.getTagName(), "SomeTag");
//	}
//}
