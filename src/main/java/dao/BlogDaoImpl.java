package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import entity.Blog;
import entity.Product;

public class BlogDaoImpl extends DBConnection implements IBlogDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public List<Blog> getAllBlog() {
		List<Blog> list = new ArrayList<Blog>();
		String query = "SELECT * FROM Blogs";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public Blog getBlogByID(String bID) {
		String query = "select * from Blogs where blogId = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, bID);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		} catch (Exception e) {

		}
		return null;
	}

	@Override
	public void insertBlog(String details, String blogName, String blogImage) {
		String query = "INSERT INTO [dbo] . [Blogs] \n"
				+ "([details],[blogName],[blogImage])" + "VALUES(?,?,?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, details);
			ps.setString(2, blogName);
			ps.setString(3, blogImage);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public void deleteBlog(String bId) {
		String query = "DELETE FROM Blogs Where blogId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, bId);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public void updateBlog(String blogId, String details, String blogName, String blogImage) {
		String query = "UPDATE Blogs SET details=?, blogName=?, blogImage=? WHERE blogId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, details);
			ps.setString(2, blogName);
			ps.setString(3, blogImage);
			ps.setString(4, blogId);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	@Override
	public List<Blog> searchByName(String txtSearch) {
		List<Blog> list = new ArrayList<Blog>();
		String query = "select * from Blogs\n" + "where [blogName] like ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (Exception e) {

		}
		return list;
	}

}
