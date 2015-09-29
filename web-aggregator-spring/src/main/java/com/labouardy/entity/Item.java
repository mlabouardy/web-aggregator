package com.labouardy.entity;

import java.sql.Date;

import javax.persistence.*;

@Entity
public class Item{
	
	@Id
	@GeneratedValue
	private int id;

	private String title;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name="id_blog")
	private Blog blog;
	
	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	@Column(name="publish_date")
	private Date publishDate;
	
	private String link;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	
   
}
