package com.books.model;

import java.util.List;

/**
 * PhysicalBook - a Book contains a list of PhysicalBook objects. A PhysicalBook
 * contains a list of Media objects.
 * 
 * A PhysicalBook represents the physical copy of a book that can be checked
 * out, checked in, lost, etc.
 * 
 * 
 * 
 */
public class PhysicalBook {

	// SQL query to get all physicalbook objects for a given book:
	public static final String GET_ALL_PHYSICALBOOKS_FOR_BOOK = "SELECT physicalbookid, location, status, owner "
			+ "FROM physicalbook "
			+ "JOIN book "
			+ "ON book.bookid=physicalbook.bookid "
			+ "WHERE book.bookid = ?";
	
	public static final String PHYSICALBOOKID = "PHYSICALBOOKID";

	private int physicalBookId;
	private String location;
	private String status;
	private String owner;
	private List<Media> mediaList;

	public PhysicalBook() {

	}

	public int getPhysicalBookId() {
		return physicalBookId;
	}

	public void setPhysicalBookId(int physicalBookId) {
		this.physicalBookId = physicalBookId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public List<Media> getMediaList() {
		return mediaList;
	}

	public void setMediaList(List<Media> mediaList) {
		this.mediaList = mediaList;
	}

}
