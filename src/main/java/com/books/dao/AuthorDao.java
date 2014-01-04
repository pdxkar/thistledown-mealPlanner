package com.books.dao;

import java.util.List;

import com.books.model.Author;

public interface AuthorDao {
	
	public List<Author> getListOfAuthorsForBook(int BookId);
}