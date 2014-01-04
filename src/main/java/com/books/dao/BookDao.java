package com.books.dao;

import java.util.List;
import com.books.model.Book;

/*
 * Interface for Book object
 * 
 * This interface specifies a contract between the User Experience and the server/database
 * This interface is implemented as a specific persistence resource - Jdbc, e.g.
 * 
 */

public interface BookDao {
	
	public List<Book> getListOfBooks();
	
	public Book getBookByIsbn(String isbn);

}