package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import entity.Customer;
import entity.Order;
import service.CustomerServiceImpl;
import service.ICustomerService;

public class CartDaoImpl extends DBConnection implements ICartDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	ICustomerService cusS = new CustomerServiceImpl();
	@Override
	public int insert(Order cart) {
		String query="INSERT INTO Orders(cusId, orderDate, employeeId) VALUES(?,?,?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query, ps.RETURN_GENERATED_KEYS);
			ps.setInt(1,cart.getCusId().getCusId());
			ps.setString(2,cart.getOrderDate());
			ps.setInt(3,cart.getEmployeeId().getEmployeeId());
			ps.executeUpdate();
			
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				return rs.getInt(1);
			}
			rs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 0;
	}

	@Override
	public void edit(Order cart) {
		String query="UPDATE Orders set cusId=?, orderDate=?, employeeId=? WHERE orderId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setInt(1,cart.getCusId().getCusId());
			ps.setString(2,cart.getOrderDate());
			ps.setInt(3,cart.getEmployeeId().getEmployeeId());
			ps.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		String query = "DELETE FROM Orders WHERE orderId=?";
		try
		{
			conn= new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public Order get(int id) {
		String query = "SELECT orderId, orderDate, Customers.cusId, cusAddress, cusPhoneNumber, username, rank\r\n"
				+ "FROM Orders INNER JOIN  Customers ON Orders.cusId=Customers.cusId\r\n"
				+ "WHERE orderId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer cus=cusS.get(rs.getInt("cusId"));
				
				Order cart = new Order();
				cart.setOrderId(rs.getInt("orderId"));
				cart.setOrderDate(rs.getString("orderDate"));
				cart.setCusId(cus);
				return cart;
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Order> getAll() {
		List<Order> list = new ArrayList<Order>();
		String query = "SELECT orderId, orderDate, Customers.cusId, cusAddress, cusPhoneNumber, username, rank\r\n"
				+ "FROM Orders INNER JOIN  Customers ON Orders.cusId=Customers.cusId";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer cus=cusS.get(rs.getInt("cusId"));
				
				Order cart = new Order();
				cart.setOrderId(rs.getInt("orderId"));
				cart.setOrderDate(rs.getString("orderDate"));
				cart.setCusId(cus);
				list.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
