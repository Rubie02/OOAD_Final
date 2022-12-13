package service;

import entity.Customer;

public interface ICustomerService {
	public Customer get(int id);
	public void insert(String cusName, String cusAddress, String cusPhoneNumber, String username);
	public Customer getUsername(String username);
	public void editCustomer(String cusName, String cusAddress, String cusPhoneNumber, String username);
}
