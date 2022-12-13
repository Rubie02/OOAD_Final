package entity;

import java.util.Date;

public class ReviewBlog {
	private String id;
	private String name;
	private String email;
	private String blog_id;
	
	private String content;
	private String created;
	public ReviewBlog() {
		super();
	}
	public ReviewBlog(String id, String name, String email, String blog_id, String content, String created) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.blog_id = blog_id;
		this.content = content;
		this.created = created;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}
	@Override
	public String toString() {
		return "ReviewBlog [id=" + id + ", name=" + name + ", email=" + email + ", blog_id=" + blog_id + ", content="
				+ content + ", created=" + created + "]";
	}
	
	
	
}
