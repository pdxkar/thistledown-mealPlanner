package com.books.model;

/**
 * 
 * Author - A Book contains a list of Authors.
 *
 */
public class Author {
	
	//SQL query to get all authors for a given book:
	public static final String GET_ALL_AUTHORS_FOR_BOOK = 
			"SELECT author.authorid, description, firstname, lastname "
			+"FROM author "
			+"JOIN bookauthor "
			+"ON author.authorid = bookauthor.authorid "
			+"WHERE bookauthor.bookid = ?";
	
	// Private Variables
	private int authorId;
	private String firstName;
	private String lastName;
	private String description;
	
	public Author(){
		
	}
	
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
