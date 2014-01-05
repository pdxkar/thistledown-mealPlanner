//package com.books.rowmapper;
//
//import java.awt.print.Book;
//import java.sql.ResultSet;
//
//import junit.framework.Assert;
//
//import org.junit.Test;
//import org.mockito.Mockito;
//import org.springframework.jdbc.core.RowMapper;
//
//public class BookRowMapperTest {
//	
//	ResultSet resultSet = Mockito.mock(ResultSet.class);
//	
//	@Test
//	public void test() throws Exception {
//		Mockito.when(resultSet.getInt("BOOKID")).thenReturn(6);
//		Mockito.when(resultSet.getString("IMAGE")).thenReturn("http://someimage.jpg");
//		Mockito.when(resultSet.getString("TITLE")).thenReturn("Some Title");
//		Mockito.when(resultSet.getString("DESCRIPTION")).thenReturn("Some Description/snippet");
//		Mockito.when(resultSet.getString("ISBN")).thenReturn("SomeISBN");
//		Mockito.when(resultSet.getInt("PUBLISHYEAR")).thenReturn(1984);
//		Mockito.when(resultSet.getString("PUBLISHER")).thenReturn("Some Publisher and Sons");
//		
//		RowMapper<Book> rowMapper = new BookRowMapper();
//		Book book = rowMapper.mapRow(resultSet,1);
//		
////		Long year = Long.parseLong("1984");
//		Assert.assertEquals(book.getId(), 6);
//		Assert.assertEquals(book.getImageUrl(), "http://someimage.jpg");
//		Assert.assertEquals(book.getName(), "Some Title");
//		Assert.assertEquals(book.getSnippet(), "Some Description/snippet");
//		Assert.assertEquals(book.getIsbn13(), "SomeISBN");
//		Assert.assertEquals(book.getPublisher(), "Some Publisher and Sons");
//		Assert.assertNotNull(book.getPublishYear());
//		Assert.assertEquals(book.getPublishYear(), 1984);
//	}
//}
