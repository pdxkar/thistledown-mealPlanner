package com.books.dao;

import java.util.List;

import com.books.model.Tag;
import com.books.model.TagCount;

public interface TagDao {
	
	public List<Tag> getListOfTagsForBook(int bookId);
	
	public List<Tag> getListOfTags();
	
	public List<TagCount> getListOfTagCounts();
}