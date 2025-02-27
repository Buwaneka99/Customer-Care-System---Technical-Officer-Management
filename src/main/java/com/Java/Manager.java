package com.Java;

public class Manager {
	
	private int id;
	private String name;
	private String contact;
	private String address;
	private String email;
	private String username;
	private String password;
	
	public Manager(int id, String name, String contact, String address, String email, String username, String password) {
		this.id = id;
		this.name = name;
		this.contact = contact;
		this.address = address;
		this.email = email;
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getContact() {
		return contact;
	}

	public String getAddress() {
		return address;
	}

	public String getEmail() {
		return email;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
}
