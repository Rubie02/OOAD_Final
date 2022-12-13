package service;

import dao.ILoginDao;
import dao.LoginDaoImpl;
import entity.Account;

public class LoginServiceImpl implements ILoginService{
	ILoginDao loginDao = new LoginDaoImpl();
	@Override
	public Account login(String user, String pass) {
		return loginDao.login(user, pass);
	}

}
