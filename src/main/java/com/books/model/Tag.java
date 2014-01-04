package com.books.model;

/**
 * Tag - a Book contains a list of Tag objects.
 * 
 * Tag represents one of the subjects the Book covers - i.e. A book about the
 * Spring framework could have Java and Spring as tags.
 * 
 */
public class Tag {

	// SQL query to get all tag objects for a given book:
	public static final String GET_ALL_TAGS_FOR_BOOK = "SELECT tagname, tag.tagid " + "FROM tag "
			+ "JOIN booktag " + "ON booktag.tagid = tag.tagid " + "WHERE bookid = ?";
	
	public static final String GET_ALL_TAGS = "SELECT tagname, tagid FROM tag";
	
	public static final String GET_TAG_BY_ID = "SELECT tagid, tagname FROM tag WHERE tagid = ?";
		
	private int tagId;
	private String tagName;

	public Tag() {

	}
	public Tag(int tagId, String tagName) {
		this.tagId = tagId;
		this.tagName = tagName;
	}

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

}
