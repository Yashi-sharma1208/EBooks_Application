package com.entity;

public class Book {
private int bookId;
private String bookName;
private String author;
private double price;
private String bookCategory;
private String status;
private String photoName;
public Book() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "Book [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
			+ ", bookCategory=" + bookCategory + ", status=" + status + ", photoName=" + photoName + ", user_email="
			+ user_email + "]";
}
public int getBookId() {
	return bookId;
}
public void setBookId(int bookId) {
	this.bookId = bookId;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public double getPrice() {
	return price;
}
public void setPrice(double  price) {
	this.price = price;
}
public String getBookCategory() {
	return bookCategory;
}
public void setBookCategory(String bookCategory) {
	this.bookCategory = bookCategory;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getPhotoName() {
	return photoName;
}
public void setPhotoName(String photoName) {
	this.photoName = photoName;
}
public String getUser_email() {
	return user_email;
}
public void setUser_email(String user_email) {
	this.user_email = user_email;
}

public Book(String bookName, String author, double price, String bookCategory, String status, String photoName,
		String user_email) {
	super();
	this.bookName = bookName;
	this.author = author;
	this.price = price;
	this.bookCategory = bookCategory;
	this.status = status;
	this.photoName = photoName;
	this.user_email = user_email;
}

private String user_email;
}
