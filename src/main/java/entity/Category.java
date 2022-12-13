package entity;

public class Category {
	private int cateId;
	private int blogId;
	private String cateName;
	private String description;
	private String cateImage;
	public Category() {
		super();
	}
	public Category(int cateId, int blogId, String cateName, String description, String cateImage) {
		super();
		this.cateId = cateId;
		this.blogId = blogId;
		this.cateName = cateName;
		this.description = description;
		this.cateImage = cateImage;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCateImage() {
		return cateImage;
	}
	public void setCateImage(String cateImage) {
		this.cateImage = cateImage;
	}
	
}
