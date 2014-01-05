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
//public class TagCountRowMapperTest {
//	
//	ResultSet resultSet = Mockito.mock(ResultSet.class);
//	
//	@Test
//	public void test() throws Exception {
//		Mockito.when(resultSet.getInt("COUNT")).thenReturn(3);		
//		Mockito.when(resultSet.getInt("TAGID")).thenReturn(2);
//		Mockito.when(resultSet.getString("TAGNAME")).thenReturn("SomeTag");
//		
//		RowMapper<TagCount> rowMapper = new TagCountRowMapper();
//		TagCount tagCount = rowMapper.mapRow(resultSet,1);
//		
//		Assert.assertEquals(tagCount.getTagCount(), 3);
//		Assert.assertEquals(tagCount.getTag().getTagId(), 2);
//		Assert.assertEquals(tagCount.getTag().getTagName(), "SomeTag");
//	}
//}
//
