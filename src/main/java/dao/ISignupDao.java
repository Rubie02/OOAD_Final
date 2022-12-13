package dao;

import entity.Account;

public interface ISignupDao {
	public Account checkAccountExist(String user);
	public void signup(String user, String pass);
	public void signupforCustomer(String user, String pass, String email);
}
