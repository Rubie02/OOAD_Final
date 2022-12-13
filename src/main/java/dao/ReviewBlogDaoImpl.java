package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ReviewBlogDao;
import connection.DBConnection;
import entity.ReviewBlog;

public class ReviewBlogDaoImpl extends DBConnection implements ReviewBlogDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void insert(ReviewBlog review) {
		
		String sql = "INSERT INTO ReviewBlog(blog_id,  name, email, content, created) VALUES (?, ?, ?, ?, ?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setString(1, review.getBlog_id());
			ps.setString(2, review.getName());
			ps.setString(3, review.getEmail());
			ps.setString(4, review.getContent());
			ps.setString(5, review.getCreated());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	   

	}

	@Override
	public void edit(ReviewBlog review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM ReviewBlog WHERE id=?";
		
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();	
		} catch (Exception e) {
			
		}
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
		List<ReviewBlog> reviews = new ArrayList<ReviewBlog>();
		String sql = "SELECT * FROM ReviewBlog";
		
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				ReviewBlog review = new ReviewBlog();
				review.setId(rs.getString("id"));
				review.setName(rs.getString("name"));
				review.setEmail(rs.getString("email"));
				review.setBlog_id(rs.getString("blog_id"));
				review.setContent(rs.getString("content"));
				review.setCreated(rs.getString("created"));
				reviews.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviews;
	}
	
	@Override
	public List<ReviewBlog> getReviewById(int id)
	{
		List<ReviewBlog> reviews = new ArrayList<ReviewBlog>();
		String sql = "SELECT * FROM ReviewBlog WHERE blog_id=?";
		
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				ReviewBlog review = new ReviewBlog();
				review.setId(rs.getString("id"));
				review.setName(rs.getString("name"));
				review.setEmail(rs.getString("email"));
				review.setBlog_id(rs.getString("blog_id"));
				review.setContent(rs.getString("content"));
				review.setCreated(rs.getString("created"));
				reviews.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviews;
	}

}
