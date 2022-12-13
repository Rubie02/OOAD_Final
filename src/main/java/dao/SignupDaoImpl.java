package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import entity.Account;

public class SignupDaoImpl extends DBConnection implements ISignupDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public Account checkAccountExist(String user) {
		String query = "select * from Accounts\r\n"
				+ "where [username] = ?\r\n";			
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			rs = ps.executeQuery();
			while(rs.next())
			{
				return new Account(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4));
			}
		}
		catch (Exception e) {
			
		}
		return null;
	}

	@Override
	public void signup(String user, String pass) {
		String query = "insert into Accounts\n"+	
				"values(?,?,0,0)";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.executeUpdate();	
		} catch (Exception e) {
			
		}
		
	}
	@Override
	public void signupforCustomer(String user, String pass, String email) {
		String query = "INSERT into Accounts\n"+	
				"values(?,?,0,?)";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setString(3,  email);
			ps.executeUpdate();	
		} catch (Exception e) {
			
		}
		
	}

}
