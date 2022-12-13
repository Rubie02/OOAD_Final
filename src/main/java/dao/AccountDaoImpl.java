package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import entity.Account;

public class AccountDaoImpl extends DBConnection implements IAccountDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void insertAccount(String user, String pass, int type, String email) {
		String query = "INSERT INTO Accounts(username,password,type,email)  VALUES(?,?,?,?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setInt(3, type);
			ps.setString(4, email);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public void deleteAccount(String user) {
		String query = "delete from Accounts\n" + "where username = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.executeUpdate();
		} catch (Exception e) {
		}
		
	}

	@Override
	public List<Account> getAllAccount() {
		List<Account> list = new ArrayList<Account>();
		String query = "select * from Accounts ";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
			}
		} catch (Exception e) {

		}
		return list;
	}
	@Override
	public List<String> getAllEmailUsername() {
		List<String> list = new ArrayList<String>();
		String query = "select email, username from Accounts ";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("email"));
				list.add(rs.getString("username"));
			}
		} catch (Exception e) {
			
		}
		return list;
	}

	@Override
	public void editAccount(String user, String pass, int type, String email) {
		String query = "UPDATE Accounts SET username=?, password=?, type=?, email=? WHERE username=?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setInt(3, type);
			ps.setString(4, email);
			ps.setString(5, user);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public Account getAccByUsername(String username) {
		String query = "select * from Accounts\n" + "where username = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4));
			}
		} catch (Exception e) {

		}
		return null;
	}
	@Override
	public Account getAccByEmail(String email) {
		String query = "select * from Accounts\n" + "where email = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4));
			}
		} catch (Exception e) {

		}
		return null;
	}

}
