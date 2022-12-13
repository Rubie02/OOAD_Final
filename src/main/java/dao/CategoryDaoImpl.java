package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import entity.Category;

public class CategoryDaoImpl extends DBConnection implements ICategoryDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<Category>();
		String query = "select * from Categories";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Category(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			}
		} catch (Exception e) {

		}
		return list;
	}

}
