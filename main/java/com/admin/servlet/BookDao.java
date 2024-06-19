package com.admin.servlet;

import java.util.List;

import com.entity.Book;

public interface BookDao {
	public boolean addBook(Book b);
	public List<Book> getAllBooks();
	public Book getBookById(int id);
	public boolean updateBookDetails(Book b);
	public int delete(int id);
	public List<Book> getNewBook();
	public List<Book> getRecentBook();
	public List<Book> getOldBook();
	public List<Book> getAllRecentBook();
	public List<Book> getAllOldBook();
	public List<Book> getAllNewBook();
public List<Book> getAllOldBookById(String email,String categ);
public boolean oldBookDelete(int id,String email,String categ);

	}

