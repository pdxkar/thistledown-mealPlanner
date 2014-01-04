package com.books.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.ArrayList;
import java.util.List;

import junit.framework.Assert;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.books.dao.AuthorDao;
import com.books.dao.BookDao;
import com.books.dao.MediaDao;
import com.books.dao.PhysicalBookDao;
import com.books.dao.TagDao;
import com.books.model.Author;
import com.books.model.Book;
import com.books.model.PhysicalBook;
import com.books.model.Tag;
import com.books.model.TagCount;

public class BooksControllerTest {	
	
	private static final String isbn13 = "9780596007126";

	private MockMvc mockMvc;
	private BooksController booksController = new BooksController();
	private BookDao mockBookDao = Mockito.mock(BookDao.class);
	private TagDao mockTagDao = Mockito.mock(TagDao.class);
	private AuthorDao mockAuthorDao = Mockito.mock(AuthorDao.class);
	private PhysicalBookDao mockPhysicalBookDao = Mockito.mock(PhysicalBookDao.class);
	private MediaDao mockMediaDao = Mockito.mock(MediaDao.class);
	
	@Before
    public void setUp() throws Exception {
		booksController = new BooksController();
		mockMvc = MockMvcBuilders.standaloneSetup(booksController).build();
        MockitoAnnotations.initMocks(this);		        			
    }
		
	@Test
	public void testGetListOfTags() throws Exception {
		/**
		 * Verifies that List<Tag> is returned at Url /data/tags
		 */				
		List<TagCount> tagCountList = new ArrayList<TagCount>();
		tagCountList.add(new TagCount(1, new Tag(2, "Spring")));
		booksController.setTagDao(mockTagDao);
		Mockito.when(mockTagDao.getListOfTagCounts()).thenReturn(tagCountList);
			
		MvcResult result = mockMvc.perform(get("/data/tags")).andReturn();
		Assert.assertEquals(result.getResponse().getContentAsString(), "[{\"tagCount\":1,\"tag\":{\"tagId\":2,\"tagName\":\"Spring\"}}]");
	}	
	
	@Test
	public void testGetBookByIsbn() throws Exception {
		/**
		 * Verifies that book components (mostly empty) are built/returned at Url /data/{isbn}
		 */				
		Book book = new Book();
		book.setIsbn13(isbn13);
		book.setAuthorList(new ArrayList<Author>());
		book.setBookTagList(new ArrayList<Tag>());
		book.setPhysicalBookList(new ArrayList<PhysicalBook>());
				
		booksController.setBookDao(mockBookDao);
		booksController.setTagDao(mockTagDao);
		booksController.setAuthorDao(mockAuthorDao);
		booksController.setPhysicalBookDao(mockPhysicalBookDao);
		booksController.setMediaDao(mockMediaDao);
		
		Mockito.when(mockBookDao.getBookByIsbn(isbn13)).thenReturn(book);
		Mockito.when(mockTagDao.getListOfTagsForBook(book.getId())).thenReturn(book.getBookTagList());		
		Mockito.when(mockAuthorDao.getListOfAuthorsForBook(book.getId())).thenReturn(book.getAuthorList());
		Mockito.when(mockPhysicalBookDao.getListOfPhysicalBooks(book.getId())).thenReturn(book.getPhysicalBookList());
					
		MvcResult result = mockMvc.perform(get("/data/" + isbn13)).andReturn();
		Assert.assertEquals(result.getResponse().getContentAsString(), 
				"{\"id\":0,\"imageUrl\":null,\"name\":null,\"snippet\":null,\"publisher\":null,\"isbn13\":\"9780596007126\",\"isbn10\":\"0596007124\",\"publishYear\":0,\"authorList\":[],\"bookTagList\":[],\"physicalBookList\":[]}");
	}	
	
	@Test
	public void testExceptionByIsbn() throws Exception {
		/**
		 * Verifies that invalid isbn will result in EmptyResultDataAccessException, returning status of 404 not found
		 */				
		Book book = new Book();
		book.setIsbn13(isbn13);
		book.setAuthorList(new ArrayList<Author>());
		book.setBookTagList(new ArrayList<Tag>());
		book.setPhysicalBookList(new ArrayList<PhysicalBook>());
				
		booksController.setBookDao(mockBookDao);
		booksController.setTagDao(mockTagDao);
		booksController.setAuthorDao(mockAuthorDao);
		booksController.setPhysicalBookDao(mockPhysicalBookDao);
		booksController.setMediaDao(mockMediaDao);
		
		Mockito.when(mockBookDao.getBookByIsbn(isbn13)).thenThrow(new org.springframework.dao.EmptyResultDataAccessException(0));
		Mockito.when(mockTagDao.getListOfTagsForBook(book.getId())).thenReturn(book.getBookTagList());		
		Mockito.when(mockAuthorDao.getListOfAuthorsForBook(book.getId())).thenReturn(book.getAuthorList());
		Mockito.when(mockPhysicalBookDao.getListOfPhysicalBooks(book.getId())).thenReturn(book.getPhysicalBookList());
					
		MvcResult result = mockMvc.perform(get("/data/" + isbn13)).andReturn();
		Assert.assertEquals(result.getResponse().getStatus(), 404);
	}	
	
	@Test
	public void testListOfBooks() throws Exception {
		/**
		 * Verifies that list of book (components, mostly empty) are built/returned at Url /data}
		 */				
		Book book = new Book();
		book.setIsbn13(isbn13);
		book.setAuthorList(new ArrayList<Author>());
		book.setBookTagList(new ArrayList<Tag>());
		book.setPhysicalBookList(new ArrayList<PhysicalBook>());
		List<Book> listOfBooks = new ArrayList<Book>();
		listOfBooks.add(book);
				
		booksController.setBookDao(mockBookDao);
		booksController.setTagDao(mockTagDao);
		booksController.setAuthorDao(mockAuthorDao);
		booksController.setPhysicalBookDao(mockPhysicalBookDao);
		booksController.setMediaDao(mockMediaDao);
		
		Mockito.when(mockBookDao.getListOfBooks()).thenReturn(listOfBooks);
		Mockito.when(mockBookDao.getBookByIsbn(isbn13)).thenReturn(book);
		Mockito.when(mockTagDao.getListOfTagsForBook(book.getId())).thenReturn(book.getBookTagList());		
		Mockito.when(mockAuthorDao.getListOfAuthorsForBook(book.getId())).thenReturn(book.getAuthorList());
		Mockito.when(mockPhysicalBookDao.getListOfPhysicalBooks(book.getId())).thenReturn(book.getPhysicalBookList());
					
		MvcResult result = mockMvc.perform(get("/data")).andReturn();
		Assert.assertEquals(result.getResponse().getContentAsString(), 
				"[{\"id\":0,\"imageUrl\":null,\"name\":null,\"snippet\":null,\"publisher\":null,\"isbn13\":\"9780596007126\",\"isbn10\":\"0596007124\",\"publishYear\":0,\"authorList\":[],\"bookTagList\":[],\"physicalBookList\":[]}]");
	}	
}