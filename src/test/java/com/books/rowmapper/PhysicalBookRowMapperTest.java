package com.books.rowmapper;

import java.sql.ResultSet;

import junit.framework.Assert;

import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.jdbc.core.RowMapper;

import com.books.model.PhysicalBook;

public class PhysicalBookRowMapperTest {
	
	ResultSet resultSet = Mockito.mock(ResultSet.class);
	
	@Test
	public void test() throws Exception {
		Mockito.when(resultSet.getInt("PHYSICALBOOKID")).thenReturn(2);
		Mockito.when(resultSet.getString("OWNER")).thenReturn("SomeOwner");
		Mockito.when(resultSet.getString("STATUS")).thenReturn("SomeStatus");
		Mockito.when(resultSet.getString("LOCATION")).thenReturn("Some Location");
		
		RowMapper<PhysicalBook> rowMapper = new PhysicalBookRowMapper();
		PhysicalBook physicalBook = rowMapper.mapRow(resultSet,1);
		
		Assert.assertEquals(physicalBook.getPhysicalBookId(), 2);
		Assert.assertEquals(physicalBook.getOwner(), "SomeOwner");
		Assert.assertEquals(physicalBook.getLocation(), "Some Location");
		Assert.assertEquals(physicalBook.getStatus(), "SomeStatus");
	}
}
