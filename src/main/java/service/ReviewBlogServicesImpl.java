package service;

import java.util.List;

import dao.ReviewBlogDao;
import dao.ReviewBlogDaoImpl;
import entity.ReviewBlog;
import service.ReviewBlogService;

public class ReviewBlogServicesImpl implements ReviewBlogService {
	ReviewBlogDao reviewDao = new ReviewBlogDaoImpl();
	@Override
	public void insert(ReviewBlog review) {
		reviewDao.insert(review);
		
	}

	@Override
	public void edit(ReviewBlog review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		reviewDao.delete(id);
	}

	@Override
	public ReviewBlog get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewBlog get(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewBlog> getAll() {
		return reviewDao.getAll();
	}
	
	@Override
	public List<ReviewBlog> getReviewById(int id) {
		return reviewDao.getReviewById(id);
	}

}
