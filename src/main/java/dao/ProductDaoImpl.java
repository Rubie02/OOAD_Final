package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import entity.Product;

public class ProductDaoImpl extends DBConnection implements IProductDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<Product>();
		String query = "SELECT * from Products";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getFloat(6), rs.getDate(7), rs.getDate(8), rs.getString(9)));
			}
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public List<Product> getProductByCID(String cid) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Products\n" + "where cateId = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, cid);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getFloat(6), rs.getDate(7), rs.getDate(8), rs.getString(9)));
			}
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public Product getProductByID(String id) {
		String query = "select * from Products\n" + "where productId = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getFloat(6), rs.getDate(7), rs.getDate(8), rs.getString(9));
			}
		} catch (Exception e) {

		}
		return null;
	}

	@Override
	public List<Product> searchByName(String txtSearch) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Products\n" + "where [productName] like ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getFloat(6), rs.getDate(7), rs.getDate(8), rs.getString(9)));
			}
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public void deleteProduct(String pid) {
		String query = "delete from Products\n"
				+ "where productId = ?";
		try
		{
			conn= new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setString(1, pid);
			ps.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void insertProduct(String name, int supId, int cateId, String information, float price, String mgf, String exp,
			String productImage) {
		String query = "INSERT [dbo] . [Products] \n"
				+ "([productName],[supId],[cateId],[information],[price],[MGF],[EXP],[productImage])\n"
				+ "VALUES(?,?,?,?,?,?,?,?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setString(1,name);
			ps.setInt(2,supId);
			ps.setInt(3,cateId);
			ps.setString(4,information);
			ps.setFloat(5,price);
			ps.setDate(6,java.sql.Date.valueOf(mgf));
			ps.setDate(7, java.sql.Date.valueOf(exp));
			ps.setString(8, productImage);
			ps.executeUpdate();
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}

//		List<Product> list = new ArrayList<Product>();
//		String query = "select top 4 * from Products\n" + "order by productId desc";
//		try {
//			conn = new DBConnection().getConnectionW();
//			ps = conn.prepareStatement(query);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
//						rs.getFloat(6), rs.getDate(7), rs.getDate(8), rs.getString(9)));
//			}
//		} catch (Exception e) {
//
//		}
//		return list;
//	}

	@Override
	public void updateProduct(String pid, String name, int supId, int cateId, String information, float price,
			String mgf, String exp, String productImage) {
		String query = "UPDATE Products SET productName=?, supId=?, cateId=?, information=?, price=?, mgf=?, exp=?, productImage=? WHERE productId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setInt(2, supId);
			ps.setInt(3, cateId);
			ps.setString(4, information);
			ps.setFloat(5, price);
			ps.setString(6, mgf);
			ps.setString(7, exp);
			ps.setString(8, productImage);
			ps.setString(9, pid);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
