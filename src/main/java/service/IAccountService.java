package service;

import java.util.List;

import entity.Account;

public interface IAccountService {
	public void insertAccount(String user, String pass, int type, String email);
	public void deleteAccount(String user);
	public List<Account> getAllAccount();
	public void editAccount(String user, String pass, int type, String email);
	public Account getAccByUsername(String username);
	public Account getAccByEmail(String email);
	public List<String> getAllEmailUsername();
}
