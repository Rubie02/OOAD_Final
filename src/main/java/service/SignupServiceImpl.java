package service;

import dao.ISignupDao;
import dao.SignupDaoImpl;
import entity.Account;

public class SignupServiceImpl implements ISignupService{
	ISignupDao signupDao = new SignupDaoImpl();
	@Override
	public Account checkAccountExist(String user) {
		return signupDao.checkAccountExist(user);
	}

	@Override
	public void signup(String user, String pass) {
		signupDao.signup(user, pass);
	}

	@Override
	public void signupforCustomer(String user, String pass, String email) {
		signupDao.signupforCustomer(user, pass, email);
		
	}
	
}
