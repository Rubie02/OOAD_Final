package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import entity.Account;

public class LoginDaoImpl extends DBConnection implements ILoginDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public Account login(String user, String pass) {
		String query = "SELECT * FROM Accounts\r\n"
				+ "WHERE username = ?\r\n"
				+ "AND password = ?";
		try {
			conn = new DBConnection().getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while(rs.next())
			{
				return new Account(rs.getString(1),rs.getString(2),rs.getInt(3), rs.getString(4));
			}
		}
		catch (Exception e) {
			
		}
		return null;
	}

}
