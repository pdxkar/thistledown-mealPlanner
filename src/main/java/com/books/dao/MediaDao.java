package com.books.dao;

import java.util.List;

import com.books.model.Media;

public interface MediaDao {
	
	public List<Media> getListOfMediaForPhysicalBook(int physicalBookId);
}