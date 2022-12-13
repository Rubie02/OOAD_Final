package service;

import entity.Account;

public interface ILoginService {
	public Account login(String user, String pass);
}
