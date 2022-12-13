package entity;

public class Blog {
	private int blogId;
	private String details;
	private String blogName;
	private String blogImage;
	public Blog() {
		super();
	}
	public Blog(int blogId, String details, String blogName, String blogImage) {
		super();
		this.blogId = blogId;
		this.details = details;
		this.blogName = blogName;
		this.blogImage = blogImage;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public String getBlogImage() {
		return blogImage;
	}
	public void setBlogImage(String blogImage) {
		this.blogImage = blogImage;
	}
	
}
