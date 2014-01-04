package com.books.dao;

import java.util.List;

import com.books.model.PhysicalBook;

public interface PhysicalBookDao {

	public List<PhysicalBook> getListOfPhysicalBooks(int bookId);
}