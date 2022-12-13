package service;

import java.util.List;

import dao.BlogDaoImpl;
import dao.IBlogDao;
import entity.Blog;

public class BlogServiceImpl implements IBlogService{
	IBlogDao blogDao = new BlogDaoImpl();
	@Override
	public List<Blog> getAllBlog() {
		// TODO Auto-generated method stub
		return blogDao.getAllBlog();
	}

	@Override
	public Blog getBlogByID(String bID) {
		// TODO Auto-generated method stub
		return blogDao.getBlogByID(bID);
	}

	@Override
	public void insertBlog(String details, String blogName, String blogImage) {
		// TODO Auto-generated method stub
		blogDao.insertBlog(details, blogName, blogImage);
	}

	@Override
	public void deleteBlog(String bId) {
		// TODO Auto-generated method stub
		blogDao.deleteBlog(bId);
	}

	@Override
	public void updateBlog(String blogId, String details, String blogName, String blogImage) {
		blogDao.updateBlog(blogId, details, blogName, blogImage);
		
	}
	@Override
	public List<Blog> searchByName(String txtSearch) {
		// TODO Auto-generated method stub
		return blogDao.searchByName(txtSearch);
	}

}
