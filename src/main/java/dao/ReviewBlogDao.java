package dao;

import java.util.List;

import entity.ReviewBlog;



public interface ReviewBlogDao {
	void insert(ReviewBlog review);

	void edit(ReviewBlog review);

	void delete(int id);

	ReviewBlog get(int id);
	
	ReviewBlog get(String name);

	List<ReviewBlog> getAll();
	
	List<ReviewBlog> getReviewById(int id);
}
