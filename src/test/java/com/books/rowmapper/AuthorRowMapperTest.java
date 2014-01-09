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
//public class AuthorRowMapperTest {
//	
//	ResultSet resultSet = Mockito.mock(ResultSet.class);
//	
//	@Test
//	public void test() throws Exception {
//		Mockito.when(resultSet.getInt("AUTHORID")).thenReturn(1);
//		Mockito.when(resultSet.getString("FIRSTNAME")).thenReturn("Some");
//		Mockito.when(resultSet.getString("LASTNAME")).thenReturn("Author");
//		Mockito.when(resultSet.getString("DESCRIPTION")).thenReturn("Author's Description");
//		
//		RowMapper<Author> rowMapper = new AuthorRowMapper();
//		Author author = rowMapper.mapRow(resultSet,1);
//		
//		Assert.assertEquals(author.getFirstName(), "Some");
//		Assert.assertEquals(author.getLastName(), "Author");
//		Assert.assertEquals(author.getAuthorId(), 1);
//		Assert.assertEquals(author.getDescription(), "Author's Description");
//	}
//}
