package com.books.booklister;

import static org.junit.Assert.*; 
 
import static org.mockito.Mockito.*;  

import java.util.ArrayList;
import java.util.List;
  
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.runners.MockitoJUnitRunner;

import com.books.dao.AuthorDao;
import com.books.dao.BookDao;
import com.books.dao.MediaDao;
import com.books.dao.PhysicalBookDao;
import com.books.dao.TagDao;
import com.books.model.Author;
import com.books.model.Book;
import com.books.model.Media;
import com.books.model.PhysicalBook;
import com.books.model.Tag;
import com.books.model.TagCount;


@RunWith(MockitoJUnitRunner.class)  
public class BookinatorTest {
	
	//Daos
	private BookDao bookDao;
	private AuthorDao authorDao;
	private PhysicalBookDao physicalBookDao;
	private MediaDao mediaDao;
	private TagDao tagDao;
	//Books
	private Book book1 = new Book();
	private Book book2 = new Book();
	private List<Book> bookList = new ArrayList<Book>();
	//Authors
	private Author author1 = new Author();
	private Author author2 = new Author();
	private Author author3 = new Author();
	private Author author4 = new Author();
	private List<Author> authorList1 = new ArrayList<Author>();
	private List<Author> authorList2 = new ArrayList<Author>();	
	//Tags
	private Tag tag1 = new Tag();
	private Tag tag2 = new Tag();
	private List<Tag> tagList = new ArrayList<Tag>();
	//TagCounts
	private TagCount tagCount1 = new TagCount();
	private TagCount tagCount2 = new TagCount();
	private List<TagCount> tagCountList = new ArrayList<TagCount>();
	//PhysicalBook
	private PhysicalBook physicalBook1 = new PhysicalBook();
	private PhysicalBook physicalBook2 = new PhysicalBook();
	private List<PhysicalBook> physicalBookList = new ArrayList<PhysicalBook>();
	//Media
	private Media media1 = new Media();
	private Media media2 = new Media();
	private List<Media> mediaList = new ArrayList<Media>();
	
	
	@Before
    public void setUp() throws Exception {
		//Mocked Daos
		this.bookDao = mock(BookDao.class);
		this.authorDao = mock(AuthorDao.class);
		this.physicalBookDao = mock(PhysicalBookDao.class);
		this.mediaDao = mock(MediaDao.class);
		this.tagDao = mock(TagDao.class);
		
		//Test author list #1
		//Test Author#1
		author1.setAuthorId(333);
		author1.setDescription("Test Author1 description");
		author1.setFirstName("Lars");
		author1.setLastName("Vogel");
		authorList1.add(author1);
		//Test Author#2
		author2.setAuthorId(444);
		author2.setDescription("Test Author2 description");
		author2.setFirstName("Alex");
		author2.setLastName("Blewitt");
		authorList1.add(author2);

		//Test author list #2
		//Test Author#1
		author3.setAuthorId(222);
		author3.setDescription("Test Author3 description");
		author3.setFirstName("John");
		author3.setLastName("Smith");
		authorList2.add(author3);
		//Test Author#2
		author4.setAuthorId(111);
		author4.setDescription("Test Author4 description");
		author4.setFirstName("Ralph");
		author4.setLastName("Brown");
		authorList2.add(author4);
		
		//Test tag list
		//Test tag#1
		tag1.setTagId(888);
		tag1.setTagName("COBOL");
		tagList.add(tag1);
		//Test tag#2
		tag2.setTagId(999);
		tag2.setTagName("Fortran");
		tagList.add(tag2);
		
		//Test TagCount list
		//Test tagCount#1
		tagCount1.setTag(tag1);
		tagCount1.setTagCount(3);
		tagCountList.add(tagCount1);
		//Test tagCount#2
		tagCount2.setTag(tag2);
		tagCount2.setTagCount(4);
		tagCountList.add(tagCount2);
		
		//Test List of Media
		//Test Media#1
		media1.setMediaDescription("Sample media description number one.");
		media1.setMediaType("CD"); //This may need to be changed - isn't MediaType an Enum in the DB?
		media1.setPhysicalMediaId(2);
		media1.setStatus("available");
		mediaList.add(media1);
		//Test Media#2
		media2.setMediaDescription("Sample media description number two.");
		media2.setMediaType("Pamphlet"); //This may need to be changed - isn't MediaType an Enum in the DB?
		media2.setPhysicalMediaId(3);
		media2.setStatus("checkedout");
		mediaList.add(media2);
		
		//Test List of PhysicalBooks
		//Test PhysicalBook#1
		physicalBook1.setLocation("Beaverton");
		physicalBook1.setMediaList(mediaList);
		physicalBook1.setOwner("Catalyst");
		physicalBook1.setPhysicalBookId(1001);
		physicalBook1.setStatus("available");
		physicalBookList.add(physicalBook1);
		//Test PhysicalBook#2
		physicalBook2.setLocation("Baltimore");
		physicalBook2.setMediaList(mediaList);
		physicalBook2.setOwner("Holly Zelhart");
		physicalBook2.setPhysicalBookId(1002);
		physicalBook2.setStatus("checkedout");
		physicalBookList.add(physicalBook2);

		//Test list of books
		//Test book#1
		book1.setAuthorList(authorList1);
		book1.setBookTagList(tagList);
		book1.setId(555);
		book1.setImageUrl("testImageUrl1");
		book1.setIsbn10("8888888888");
		book1.setIsbn13("1111111111111");
		book1.setName("Distributed Version Control with Git");
		book1.setPhysicalBookList(physicalBookList);
		book1.setPublisher("Lars Vogel");
		book1.setPublishYear(2013);
		book1.setSnippet("Test Snippet #1");
		bookList.add(book1);
		//Test book#2		
		book2.setAuthorList(authorList2);
		book2.setBookTagList(tagList);
		book2.setId(777);
		book2.setImageUrl("testImageUrl2");
		book2.setIsbn10("7777777777");
		book2.setIsbn13("2222222222222");
		book2.setName("Practical Unit Testing with Mockito");
		book2.setPhysicalBookList(physicalBookList);
		book2.setPublisher("Tomasz Kaczanowski");
		book2.setPublishYear(2012);
		book2.setSnippet("Test Snippet #2");
		bookList.add(book2);
	}

	@Test
	public void testGetListOfBooks() {
		
		//Mock the results of each of the Dao methods in the Bookinator
		//    (For instance, when the Dao would return a list of books, use the 
		//    "Test" list of books that was prepared instead
		when(bookDao.getListOfBooks()).thenReturn(bookList);
		//Mock the results for each Dao as if BookId is 555
		//BookId == 555
		when(tagDao.getListOfTagsForBook(555)).thenReturn(tagList);
		when(authorDao.getListOfAuthorsForBook(555)).thenReturn(authorList1);
		when(physicalBookDao.getListOfPhysicalBooks(555)).thenReturn(physicalBookList); 
		when(mediaDao.getListOfMediaForPhysicalBook(555)).thenReturn(mediaList); 
		//Mock the results for each Dao as if BookId is 777		
		//BookId == 777
		when(tagDao.getListOfTagsForBook(777)).thenReturn(tagList);
		when(authorDao.getListOfAuthorsForBook(777)).thenReturn(authorList2);
		when(physicalBookDao.getListOfPhysicalBooks(777)).thenReturn(physicalBookList); 
		when(mediaDao.getListOfMediaForPhysicalBook(777)).thenReturn(mediaList);
		
		//Assign listOfBooks with the results that are produced from the mocked Daos above
		List<Book> listOfBooks = Bookinator.getListOfBooks(bookDao, tagDao, authorDao, physicalBookDao, mediaDao);
		
		//Test that the listOfBooks has the expected values:
		//getListOfBooks does not return null
		assertNotNull(Bookinator.getListOfBooks(bookDao, tagDao, authorDao, physicalBookDao, mediaDao));
		//the authorList of the 0th book is not null
		assertNotNull(listOfBooks.get(0).getAuthorList());
		//AUTHOR
		//the 0th author in the 0th book's list of authors is the expected value
		assertEquals(listOfBooks.get(0).getAuthorList().get(0).getLastName().equals("Vogel"), true);
		//the 1st author in the 1st book's list of authors is the expected value		
		assertEquals(listOfBooks.get(1).getAuthorList().get(1).getLastName().equals("Brown"), true);
		//Book TAGLIST
		//the 0th tagName in the 0th book's tagList is the expected value
		assertEquals(listOfBooks.get(0).getBookTagList().get(0).getTagName().equals("COBOL"), true);
		//the 1st tagName in the 1st book's tagList is the expected value
		assertEquals(listOfBooks.get(1).getBookTagList().get(1).getTagName().equals("Fortran"), true);
		//Book ID
		//the 0th Book's id is the expected value
		assertEquals(listOfBooks.get(0).getId() == 555, true);
		//the 1st Book's id is the expected value
		assertEquals(listOfBooks.get(1).getId() == 777, true);
		//IMAGE URL
		//the 0th Book's imageURL is the expected value
		assertEquals(listOfBooks.get(0).getImageUrl().equals("testImageUrl1"), true);	
		//the 1st Book's imageURL is the expected value
		assertEquals(listOfBooks.get(1).getImageUrl().equals("testImageUrl2"), true);	
		//ISBN
		//the 0th Book's ISBN is the expected value 
		assertEquals(listOfBooks.get(0).getIsbn13().equals("1111111111111"), true);	
		//the 1st Book's ISBN is the expected value 3943747069
		assertEquals(listOfBooks.get(1).getIsbn13().equals("2222222222222"), true);			
		//Book NAME
		//the name of the book in the zero index of listOfBooks is the expected value
		assertEquals(listOfBooks.get(0).getName().equals("Distributed Version Control with Git"), true);
		//the name of the book in the 1st index of listOfBooks is the expected value
		assertEquals(listOfBooks.get(1).getName().equals("Practical Unit Testing with Mockito"), true);		
		//PHYSICALBOOKLIST
		//the 0th's owner of the 0th physicalBook of the 0th book is the expected value
		assertEquals(listOfBooks.get(0).getPhysicalBookList().get(0).getOwner().equals("Catalyst"), true);
		//the 1st of the 1st physicalBook of the 1st book is the expected value
		assertEquals(listOfBooks.get(1).getPhysicalBookList().get(1).getLocation().equals("Baltimore"), true);
		//PUBLISHER
		//the publisher of the 0th book is the expected value
		assertEquals(listOfBooks.get(0).getPublisher().equals("Lars Vogel"), true);	
		//the publisher of the 1st book is the expected value
		assertEquals(listOfBooks.get(1).getPublisher().equals("Tomasz Kaczanowski"), true);	
		//PUBLISHYEAR
		//the publisher year of the 0th book is the expected value
		assertEquals(listOfBooks.get(0).getPublishYear(), 2013);
		//the publisher year of the 0th book is the expected value
		assertEquals(listOfBooks.get(1).getPublishYear(),2012);	
		//SNIPPET
		//the snippet of the 0th book is the expected value
		assertEquals(listOfBooks.get(0).getSnippet().equals("Test Snippet #1"), true);	
		//the snippet of the 1st book is the expected value
		assertEquals(listOfBooks.get(1).getSnippet().equals("Test Snippet #2"), true);	
	}
	
	@Test
	public void testGetBookByBookId() {
		
		String isbn = "1111111111111";
		int BOOK_ID = 555;
		//Mock the results of each of the Dao methods in the Bookinator
		//    (For instance, when the Dao would return a book, use the
		//    "Test" bookId "555" that was prepared instead
		when(bookDao.getBookByIsbn(isbn)).thenReturn(book1);
		when(tagDao.getListOfTagsForBook(BOOK_ID)).thenReturn(tagList);
		when(authorDao.getListOfAuthorsForBook(BOOK_ID)).thenReturn(authorList1);
		when(physicalBookDao.getListOfPhysicalBooks(BOOK_ID)).thenReturn(physicalBookList);
		
		//Assign "book" with the results that are produced from the mocked Daos above
		Book book = Bookinator.getBookByIsbn(bookDao, tagDao, authorDao, physicalBookDao, mediaDao, isbn);
		
		//Test that the book has the expected values:
		//getBookByBookId does not return null:
		assertNotNull(Bookinator.getBookByIsbn(bookDao, tagDao, authorDao, physicalBookDao, mediaDao, isbn));
		//the last name of the 0th author in the book's list of authors is the expected value
		assertEquals(book.getAuthorList().get(0).getLastName().equals("Vogel"), true);
		//the 1st tag in the book's tag list is the expected value
		assertEquals(book.getBookTagList().get(1).getTagName().equals("Fortran"), true);
		//the book's imageURL is the expected value
		assertEquals(book.getImageUrl().equals("testImageUrl1"), true);
		//the book's isbn is the expected value
		assertEquals(book.getIsbn13().equals("1111111111111"), true);
		//the book's name is the expected value
		assertEquals(book.getName().equals("Distributed Version Control with Git"), true);
		//the owner of the 0th physical book in the book's physical book list is the expected value
		assertEquals(book.getPhysicalBookList().get(0).getOwner().equals("Catalyst"), true);
		//the publisher of the book is the expected value
		assertEquals(book.getPublisher().equals("Lars Vogel"), true);
		//the publish year of the book is the expected value
		assertEquals(book.getPublishYear(), 2013);
		
	}
	
	@Test
	public void testGetAllTags() {
		//Mock the results of the tagDao methods in the Bookinator
		//    so that when getListOfTags(tagDao) is called, the test data 
		//    "tag list" is returned instead
//		when(Bookinator.getListOfTags(tagDao)).thenReturn(tagList);
		when(tagDao.getListOfTags()).thenReturn(tagList);
		
		//Assign "returnedTagList" with the results that are produced from the mocked tagDao above
		List<Tag> returnedTagList = Bookinator.getListOfTags(tagDao);
		
		//the getListOfTags method does not return null
		assertNotNull(returnedTagList);
		//the tagId of the 0th tag in the tag list is the expected value
		assertEquals(returnedTagList.get(0).getTagId() == 888,true);
		//the tagId of the 1st tag in the tag list is the expected value
		assertEquals(returnedTagList.get(1).getTagId() == 999,true);
		//the 0th tag name in the tag list is the expected value
		assertEquals(returnedTagList.get(0).getTagName().equals("COBOL"), true);
		//the 1st tag name in the tag list is the expected value
		assertEquals(returnedTagList.get(1).getTagName().equals("Fortran"), true);
		
	
	}
	
	@Test
	public void testGetListOfTagCounts() {
		//Mock the results of the tagDao methods in the Bookinator
		//    so that when getListOfTagCounts(tagDao) is called, the test data 
		//    "tag Count list" is returned instead
//		when(Bookinator.getListOfTagCounts(tagDao)).thenReturn(tagCountList);
		//Assign "returnedTagCountList" with the results that are produced from the mocked tagDao above
		when (tagDao.getListOfTagCounts()).thenReturn(tagCountList);
		List<TagCount> returnedTagCountList = Bookinator.getListOfTagCounts(tagDao);
		//the getListOfTagCounts method does not return null
		assertNotNull(Bookinator.getListOfTagCounts(tagDao));
		//the tag name of the 0th tag in the tagCountList is the expected value
		assertEquals(returnedTagCountList.get(0).getTag().getTagName().equals("COBOL"), true);
		//the count of the 1st tag in the tagCount list is the expected value
		assertEquals(returnedTagCountList.get(1).getTagCount() == 4, true);
	}

}
