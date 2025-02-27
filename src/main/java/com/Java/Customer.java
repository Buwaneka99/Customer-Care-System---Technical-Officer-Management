package com.Java;

import java.sql.Date;

public class Customer {
	
	private int id;
	private String email;
	private String name;
	private String contact;
	private Date problemDate;
	private String problem;
	private Date answerDate;
	private String answer;
	
	public Customer(int id, String email, String name, String contact, Date problemDate, String problem,
			Date answerDate, String answer) {		
		this.id = id;
		this.email = email;
		this.name = name;
		this.contact = contact;
		this.problemDate = problemDate;
		this.problem = problem;
		this.answerDate = answerDate;
		this.answer = answer;
	}

	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getContact() {
		return contact;
	}

	public Date getProblemDate() {
		return problemDate;
	}

	public String getProblem() {
		return problem;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public void setProblemDate(Date problemDate) {
		this.problemDate = problemDate;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
	
	

}
