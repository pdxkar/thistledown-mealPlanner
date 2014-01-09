//package com.books.booklister;
//
//import junit.framework.Assert;
//
//import org.junit.Test;
//
//public class IsbnConversionTest {
//
//	@Test
//	public void convertIsbn13To10Test() {
//		Assert.assertEquals(Bookinator.convertIsbn13To10("9780596007126"), "0596007124");
//		Assert.assertFalse(Bookinator.convertIsbn13To10("9780596007126").equals("0596007120"));
//		Assert.assertTrue(Bookinator.convertIsbn13To10("978059600D126").equals("ERROR"));		
//		Assert.assertTrue(Bookinator.convertIsbn13To10("97805960071").equals("ERROR"));
//	}
//}
