package com.entity;

public class book_order {
private int id;
private String orderId;
private String user_name;
private String email;
private String address;
private String phone;
private String payment;
private String book_name;
private String author;
private double price;

public book_order(){
	
}
@Override
public String toString() {
	return "book_order [id=" + id + ", user_name=" + user_name + ", email=" + email + ", address=" + address
			+ ", phone=" + phone + ", payment=" + payment + "]";
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getPayment() {
	return payment;
}
public void setPayment(String payment) {
	this.payment = payment;
}
public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}

public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getBook_name() {
	return book_name;
}
public void setBook_name(String book_name) {
	this.book_name = book_name;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
}
