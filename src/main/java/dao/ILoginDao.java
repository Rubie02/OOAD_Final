package dao;

import entity.Account;

public interface ILoginDao {
	public Account login(String user, String pass);
}
