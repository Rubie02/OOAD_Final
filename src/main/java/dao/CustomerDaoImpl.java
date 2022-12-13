package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import entity.Customer;

public class CustomerDaoImpl extends DBConnection implements ICustomerDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public Customer get(int id) {
		
				String query = "SELECT * FROM Customers WHERE cusId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5));
			}
		} catch (Exception e) {

		}
		return null;
	}
	@Override
	public void insert(String cusName, String cusAddress, String cusPhoneNumber, String username) {
		String query = "INSERT INTO [dbo] . [Customers] \n"
				+ "([cusName],[cusAddress],[cusPhoneNumber], [username])\n"
				+ "VALUES(?,?,?,0,?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setString(1,cusName);
			ps.setString(2,cusAddress);
			ps.setString(3,cusPhoneNumber);
			ps.setString(4,username);
			ps.executeUpdate();
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	@Override
	public Customer getUsername(String username) {
		String query = "SELECT * FROM Customers WHERE username=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5));
			}
		} catch (Exception e) {

		}
		return null;
	}
	@Override
	public void editCustomer(String cusName, String cusAddress, String cusPhoneNumber, String username) {
		String query = "UPDATE Customers SET cusName=?, cusAddress=?, cusPhoneNumber=? WHERE username=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, cusName);
			ps.setString(2, cusAddress);
			ps.setString(3, cusPhoneNumber);
			ps.setString(4, username);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
