package com.entity;

public class User {
	private String name;
	private int id;
	private String email;
	private String phno;
	private String password;
	private String city;
	private String landmark;
	private String address;
	private String state;
	private String zip;

	public User(String name, int id, String email, String phno, String password, String city, String landmark,
			String address, String state, String zip) {
		super();
		this.name = name;
		this.id = id;
		this.email = email;
		this.phno = phno;
		this.password = password;
		this.city = city;
		this.landmark = landmark;
		this.address = address;
		this.state = state;
		this.zip = zip;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", id=" + id + ", email=" + email + ", phno=" + phno + ", password=" + password
				+ ", city=" + city + ", landmark=" + landmark + ", address=" + address + ", state=" + state + ", zip="
				+ zip + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

}
