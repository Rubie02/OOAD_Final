package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import service.CartServiceImpl;
import service.CustomerServiceImpl;
import service.ICartService;
import service.ICustomerService;
import service.IProductService;
import service.ProductServiceImpl;

public class CartItemDaoImpl extends DBConnection implements ICartItemDao{
	ICartService cartS = new CartServiceImpl();
	IProductService proS = new ProductServiceImpl();
	ICustomerService cusS = new CustomerServiceImpl();
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void insert(OrderDetail cart) {
		String query="INSERT INTO OrderDetails(orderId, productId, unitPrice, quantity, discount)\r\n"
				+ "VALUES(?, ?, ?, ?, ?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setInt(1,cart.getOrder().getOrderId());
			ps.setInt(2,cart.getProduct().getProductId());
			ps.setFloat(3,cart.getUnitPrice());
			ps.setInt(4,cart.getQuantity());
			ps.setFloat(5,cart.getDiscount());
			ps.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void edit(OrderDetail cart) {
		String query="UPDATE OrderDetails SET orderId=?, productId=?, unitPrice=?, quantity=?\r\n"
				+ "WHERE odId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps=conn.prepareStatement(query);
			ps.setInt(1,cart.getOrder().getOrderId());
			ps.setInt(2,cart.getProduct().getProductId());
			ps.setFloat(3,cart.getUnitPrice());
			ps.setInt(4,cart.getQuantity());
			ps.setInt(5,cart.getOdId());
			ps.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(int id) {
		String query = "DELETE FROM OrderDetails WHERE odId=?";
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
	public OrderDetail get(int id) {
		String query = "SELECT odId, quantity, unitPrice, Orders.orderId, Orders.orderDate, Products.productName, Products.price, Products.productImage\r\n"
				+ "FROM OrderDetails INNER JOIN Orders ON OrderDetails.orderId=Orders.orderId\r\n"
				+ "INNER JOIN Products ON OrderDetails.productId=Products.productId\r\n"
				+ "WHERE OrderDetails.odId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer cus=cusS.get(rs.getInt("cusId"));
				
				Order cart = new Order();
				Product pro = new Product();
				OrderDetail cartItem = new OrderDetail();
				cart.setCusId(cus);
				cart.setOrderDate(rs.getString("orderDate"));
				cart.setCusId(cus);
				pro.setProductName(rs.getString("productName"));
				pro.setPrice(rs.getFloat("price"));
				pro.setProductName(rs.getString("productImage"));
				cartItem.setOrder(cart);
				cartItem.setProduct(pro);
				cartItem.setQuantity(rs.getInt("quantity"));
				cartItem.setUnitPrice(rs.getFloat("unitPrice"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<OrderDetail> getByCusId(int id) {
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		String query = "SELECT odId, quantity, unitPrice, Orders.orderId, Orders.cusId, Orders.orderDate, Products.productName, Products.price, Products.productImage\r\n"
				+ "FROM OrderDetails INNER JOIN Orders ON OrderDetails.orderId=Orders.orderId\r\n"
				+ "INNER JOIN Products ON OrderDetails.productId=Products.productId\r\n"
				+ "WHERE Orders.cusId=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer cus=cusS.get(rs.getInt("cusId"));
				
				Order cart = new Order();
				Product pro = new Product();
				OrderDetail cartItem = new OrderDetail();
				cart.setCusId(cus);
				cart.setOrderDate(rs.getString("orderDate"));
				pro.setProductName(rs.getString("productName"));
				pro.setPrice(rs.getFloat("price"));
				pro.setProductImage(rs.getString("productImage"));
				cartItem.setOdId(rs.getInt("odId"));
				cartItem.setOrder(cart);
				cartItem.setProduct(pro);
				cartItem.setQuantity(rs.getInt("quantity"));
				cartItem.setUnitPrice(rs.getFloat("unitPrice"));
				list.add(cartItem);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<OrderDetail> getAll() {
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		String query = "SELECT odId, quantity, unitPrice, Orders.orderId, Orders.orderDate, Products.productName, Products.price, Products.productImage\\r\\n\"\r\n"
				+ "				+ \"FROM OrderDetails INNER JOIN Orders ON OrderDetails.orderId=Orders.orderId\\r\\n\"\r\n"
				+ "				+ \"INNER JOIN Products ON OrderDetails.productId=Products.productId";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer cus=cusS.get(rs.getInt("cusId"));
				
				Order cart = new Order();
				Product pro = new Product();
				OrderDetail cartItem = new OrderDetail();
				cart.setCusId(cus);
				cart.setOrderDate(rs.getString("orderDate"));
				cart.setCusId(cus);
				pro.setProductName(rs.getString("productName"));
				pro.setPrice(rs.getFloat("price"));
				pro.setProductImage(rs.getString("productImage"));
				cartItem.setOrder(cart);
				cartItem.setProduct(pro);
				cartItem.setQuantity(rs.getInt("quantity"));
				cartItem.setUnitPrice(rs.getFloat("unitPrice"));
				list.add(cartItem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
