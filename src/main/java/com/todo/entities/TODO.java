package com.todo.entities;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class TODO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "todo_id")
	private int id;
	
	@Column(name = "todo_title")
	private String noteTitle;
	
	@Column(name = "todo_content", length = 1000)
	private String noteContent;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "create_date")
	private Date createDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_on")
	private Date lastUpdatedDate;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public TODO(int id, String noteTitle, String noteContent, Date createDate) {
		super();
		this.id = id;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.createDate = createDate;
	}
	
	public TODO(Date lastUpdate, int id, String noteTitle, String noteContent) {
		super();
		this.id = id;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.lastUpdatedDate = lastUpdate;
	}
	public TODO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
