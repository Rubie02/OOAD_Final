package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ReviewDao;
import connection.DBConnection;
import entity.Review;

public class ReviewDaoImpl extends DBConnection implements ReviewDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void insert(Review review) {
		
		String sql = "INSERT INTO Review(product_id,  name, email, content, created) VALUES (?, ?, ?, ?, ?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setString(1, review.getProduct_id());
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
	public void edit(Review review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM Review WHERE id=?";
		
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();	
		} catch (Exception e) {
			
		}
	}

	@Override
	public Review get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review get(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> getAll() {
		List<Review> reviews = new ArrayList<Review>();
		String sql = "SELECT * FROM Review";
		
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Review review = new Review();
				review.setId(rs.getString("id"));
				review.setName(rs.getString("name"));
				review.setEmail(rs.getString("email"));
				review.setProduct_id(rs.getString("product_id"));
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
	public List<Review> getReviewById(int id)
	{
		List<Review> reviews = new ArrayList<Review>();
		String sql = "SELECT * FROM Review WHERE product_id=?";
		
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Review review = new Review();
				review.setId(rs.getString("id"));
				review.setName(rs.getString("name"));
				review.setEmail(rs.getString("email"));
				review.setProduct_id(rs.getString("product_id"));
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
