package com.books.model;

import java.util.List;

/**
 * Book - A Book contains a list of Authors, PhysicalBooks, and Tags.
 * 
 */
public class Book {

	// SQL query to get all books:
	public static final String GET_ALL_BOOK_RECORDS = "SELECT title, description, bookid, publisher, isbn, publishyear, image "
			+ "FROM book";
	
	// SQL query to get one book by isbn:
	public static final String GET_BOOK_BY_ISBN = "SELECT title, description, bookid, publisher, isbn, publishyear, image "
			+ "FROM book "
			+ "WHERE isbn = ?";
	
	public static final String BOOKID = "BOOKID";

	// Private Variables
	private int id;
	private String imageUrl;
	private String name;
	private String snippet;
	private String publisher;
	private String isbn13;
	private String isbn10;
	private int publishYear;

	private List<Author> authorList;
	private List<Tag> bookTagList;
	private List<PhysicalBook> physicalBookList;

	// empty constructor
	public Book() {
	}

	// getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSnippet() {
		return snippet;
	}

	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn13() {
		return isbn13;
	}

	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	
	public String getIsbn10() {
		return isbn10;
	}

	public void setIsbn10(String isbn10) {
		this.isbn10 = isbn10;
	}

	public int getPublishYear() {
		return publishYear;
	}

	public void setPublishYear(int publishYear) {
		this.publishYear = publishYear;
	}

	public List<Author> getAuthorList() {
		return authorList;
	}

	public void setAuthorList(List<Author> authorList) {
		this.authorList = authorList;
	}

	public List<Tag> getBookTagList() {
		return bookTagList;
	}

	public void setBookTagList(List<Tag> bookTagList) {
		this.bookTagList = bookTagList;
	}

	public List<PhysicalBook> getPhysicalBookList() {
		return physicalBookList;
	}

	public void setPhysicalBookList(List<PhysicalBook> physicalBookList) {
		this.physicalBookList = physicalBookList;
	}

}