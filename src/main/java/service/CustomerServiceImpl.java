package service;

import dao.CustomerDaoImpl;
import dao.ICustomerDao;
import entity.Customer;

public class CustomerServiceImpl implements ICustomerService{
	ICustomerDao cusD = new CustomerDaoImpl();
	@Override
	public Customer get(int id) {
		
		return cusD.get(id);
	}
	@Override
	public void insert(String cusName, String cusAddress, String cusPhoneNumber, String username) {
		cusD.insert(cusName, cusAddress, cusPhoneNumber, username);
		
	}
	@Override
	public Customer getUsername(String username) {
		// TODO Auto-generated method stub
		return cusD.getUsername(username);
	}
	@Override
	public void editCustomer(String cusName, String cusAddress, String cusPhoneNumber, String username) {
		cusD.editCustomer(cusName, cusAddress, cusPhoneNumber, username);
		
	}

}
