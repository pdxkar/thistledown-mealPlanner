package com.books.booklister;

import java.awt.print.Book;
import java.util.List;

import com.books.dao.ComponentDao;
import com.books.model.Component;

public class Bookinator {

//	private static String CheckDigits = "0123456789X0";
//
//	/**
//	 * Builds and returns a list of Book objects filled with data. Takes in
//	 * autowired DAOs from a controller to build the objects with.
//	 * 
//	 * @param BooksDAO
//	 *            booksDAO
//	 * @param TagDAO
//	 *            tagDAO
//	 * @param AuthorDAO
//	 *            authorDAO
//	 * @param PhysicalBookDAO
//	 *            physicalBookDAO
//	 * @param MediaDAO
//	 *            mediaDAO
//	 * @return
//	 */
//
//	public static List<Book> getListOfBooks(BookDao bookDao, TagDao tagDao, 
//			AuthorDao authorDao, PhysicalBookDao physicalBookDao, MediaDao mediaDao) {
//				
//		List<Book> bookList = bookDao.getListOfBooks();
//
//		for (Book book : bookList) {
//			// calculate and set book's isbn10 using its isbn13
//			book.setIsbn10(convertIsbn13To10(book.getIsbn13()));
//			book.setBookTagList(tagDao.getListOfTagsForBook(book.getId()));
//			book.setAuthorList(authorDao.getListOfAuthorsForBook(book.getId()));
//			book.setPhysicalBookList(physicalBookDao.getListOfPhysicalBooks(book.getId()));
//
//			for (PhysicalBook physicalBook : book.getPhysicalBookList()) {
//				physicalBook.setMediaList(mediaDao.getListOfMediaForPhysicalBook(physicalBook.getPhysicalBookId()));
//			}
//		}
//
//		return bookList;
//	}
//
//	/**
//	 * Builds and returns a Book object filled with data. Takes in autowired
//	 * DAOs from a controller to build the objects with.
//	 * 
//	 * @param BooksDAO
//	 *            booksDAO
//	 * @param TagDAO
//	 *            tagDAO
//	 * @param AuthorDAO
//	 *            authorDAO
//	 * @param PhysicalBookDAO
//	 *            physicalBookDAO
//	 * @param MediaDAO
//	 *            mediaDAO
//	 * @return
//	 */
//
//	public static Book getBookByIsbn(BookDao bookDao, TagDao tagDao, 
//			AuthorDao authorDao, PhysicalBookDao physicalBookDao, MediaDao mediaDao, String isbn){
//		
//		Book bookByIsbn = bookDao.getBookByIsbn(isbn);
//
//		// calculate and set book's isbn10 using its isbn13
//		bookByIsbn.setIsbn10(convertIsbn13To10(bookByIsbn.getIsbn13()));
//		bookByIsbn.setBookTagList(tagDao.getListOfTagsForBook(bookByIsbn.getId()));
//		bookByIsbn.setAuthorList(authorDao.getListOfAuthorsForBook(bookByIsbn.getId()));
//		bookByIsbn.setPhysicalBookList(physicalBookDao.getListOfPhysicalBooks(bookByIsbn.getId()));
//		
//		for (PhysicalBook physicalBook : bookByIsbn.getPhysicalBookList()){
//			physicalBook.setMediaList(mediaDao.getListOfMediaForPhysicalBook(physicalBook.getPhysicalBookId()));
//		}
//
//		return bookByIsbn;
//	}
//
//	/**
//	 * @param tagDao
//	 * @return list of all tags
//	 */
//	public static List<Tag> getListOfTags(TagDao tagDao) {
//
//		return tagDao.getListOfTags();
//	}
//
//	/**
//	 * @return list of tags/counts
//	 */
//	public static List<TagCount> getListOfTagCounts(TagDao tagDao) {
//		return tagDao.getListOfTagCounts();
//	}
//
//	/**
//	 * Convert an ISBN-13 to an ISBN-10
//	 * 
//	 * @param String
//	 *            isbn13
//	 * @return String isbn10
//	 */
//	public static String convertIsbn13To10(String isbn13) {
//
//		// if isbn13 is not 13 characters long, return ERROR
//		// if isbn13 contains one or more non-numeric characters, return ERROR
//		
//		if (isbn13.length() != 13 || !(containsOnlyNumbers(isbn13))) {
//			return "ERROR";
//		}
//	
//		String s9;
//		int i, n, v;
//		boolean ErrorOccurred;
//		ErrorOccurred = false;
//		s9 = isbn13.substring(3, 12);
//		n = 0;
//		for (i = 0; i < 9; i++) {
//			if (!ErrorOccurred) {
//				v = convertCharToInt(s9.charAt(i));
//				if (v == -1)
//					ErrorOccurred = true;
//				else
//					n = n + (10 - i) * v;
//			}
//		}
//		if (ErrorOccurred)
//			return "ERROR";
//		else {
//			n = 11 - (n % 11);
//			return s9 + CheckDigits.substring(n, n + 1);
//		}
//	}
//
//	/**
//	 * Converts chars to ints Used by the convertIsbn13To10() method
//	 * 
//	 * @param a
//	 *            char
//	 * @return int
//	 */
//	static int convertCharToInt(char a) {
//		return Character.getNumericValue(a);
//	}
//
//	/**
//	 * Checks that string only contains numbers
//	 * 
//	 * @param str
//	 * @return
//	 */
//	public static boolean containsOnlyNumbers(String str) {
//		// It can't contain only numbers if it's null or empty...
//		if (str == null || str.length() == 0)
//			return false;
//
//		for (int i = 0; i < str.length(); i++) {
//
//			// If we find a non-digit character we return false.
//			if (!Character.isDigit(str.charAt(i)))
//				return false;
//		}
//
//		return true;
//	}
	
	//*************Calorie Counter experiment*******
	/**
	 * @param componentDao
	 * @return list of Component objects
	 */
	public static List<Component> getListOfComponents(ComponentDao componentDao) {
		
		return componentDao.getListOfComponents();
	}
}