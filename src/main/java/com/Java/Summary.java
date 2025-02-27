package com.Java;

import java.sql.Date;

public class Summary {
	
	private int id;
	private Date addedDate;
	private String type;
	private int solved;
	private int tobe;
	private Date updatedDate; 
	private String note;
	
	public Summary(int id, Date addedDate, String type, int sloved, int tobe,Date updatedDate, String note) {
		this.id = id;
		this.addedDate = addedDate;
		this.type = type;
		this.solved = sloved;
		this.tobe = tobe;
		this.updatedDate = updatedDate;
		this.note = note;
	}

	public int getId() {
		return id;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public String getType() {
		return type;
	}

	public int getSolved() {
		return solved;
	}

	public int getTobe() {
		return tobe;
	}
	
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public String getNote() {
		return note;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setAddDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setSolved(int solved) {
		this.solved = solved;
	}

	public void setTobe(int tobe) {
		this.tobe = tobe;
	}
	
	public void setpdateDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
	
}
